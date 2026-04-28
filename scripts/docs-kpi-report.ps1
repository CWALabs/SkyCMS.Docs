<#
.SYNOPSIS
    Generate a standards KPI report for SkyCMS documentation.

.DESCRIPTION
    Reports metadata coverage, review cadence health, doc-type distribution,
    status breakdown, and internal link health. Designed to be run monthly
    to track documentation standards progress over time.

    Outputs a console summary and optionally a Markdown report file.

.PARAMETER OutputMarkdown
    If specified, path to write a Markdown KPI report (e.g. kpi-report-2026-05.md).

.PARAMETER DocsRoot
    Root of the docs directory. Defaults to the current directory.

.PARAMETER StaleThresholdDays
    Pages with status=active and last_reviewed older than this many days are
    counted as stale. Default: 180.

.PARAMETER HighTrafficThresholdDays
    Pages matching the high-traffic list with last_reviewed older than this
    many days are flagged as needing priority review. Default: 90.

.EXAMPLE
    ./scripts/docs-kpi-report.ps1
    ./scripts/docs-kpi-report.ps1 -OutputMarkdown kpi-2026-05.md
#>
param(
    [string]$OutputMarkdown,
    [string]$DocsRoot = '.',
    [int]$StaleThresholdDays = 180,
    [int]$HighTrafficThresholdDays = 90
)

$ErrorActionPreference = 'Stop'

# Pages treated as high-traffic for the tighter 90-day review cadence
$highTrafficPaths = @(
    'index.md',
    'getting-started/quick-start.md',
    'getting-started/what-is-skycms.md',
    'installation/overview.md',
    'installation/local-development.md',
    'installation/minimum-required-settings.md',
    'deployment/overview.md',
    'deployment/azure.md',
    'deployment/docker.md',
    'configuration/overview.md',
    'for-editors/index.md',
    'for-site-builders/index.md',
    'for-developers/index.md',
    'reference/troubleshooting.md',
    'reference/faq.md'
)

$skipPrefixes = @('site/', '.github/', 'notes/', 'scripts/', 'legacy/')

function Should-Skip([string]$RelPath) {
    $p = $RelPath.Replace('\', '/')
    foreach ($prefix in $skipPrefixes) {
        if ($p.StartsWith($prefix)) { return $true }
    }
    return $false
}

function Get-YamlBlock([string[]]$Lines) {
    if ($Lines.Count -lt 3) { return $null }
    if ($Lines[0].Trim() -ne '---') { return $null }
    for ($i = 1; $i -lt $Lines.Count; $i++) {
        if ($Lines[$i].Trim() -eq '---') { return $Lines[1..($i - 1)] }
    }
    return $null
}

function Parse-YamlTopLevel([string[]]$YamlLines) {
    $keys = @{}
    foreach ($line in $YamlLines) {
        if ($line -match '^([A-Za-z0-9_\-]+):\s*(.*)$') {
            $keys[$Matches[1]] = $Matches[2].Trim().Trim('"').Trim("'")
        }
    }
    return $keys
}

$today = [DateTime]::Today
$reportDate = $today.ToString('yyyy-MM-dd')
$root = (Resolve-Path $DocsRoot).Path

$allFiles = Get-ChildItem -Path $root -Recurse -File -Filter '*.md' |
    ForEach-Object {
        $rel = $_.FullName.Substring($root.Length + 1).Replace('\', '/')
        if (-not (Should-Skip $rel)) { $_ | Add-Member -NotePropertyName RelPath -NotePropertyValue $rel -PassThru }
    } | Where-Object { $_ }

$total = $allFiles.Count
$withFrontmatter = 0
$missingFrontmatter = @()
$docTypeMap = @{}
$statusMap = @{}
$stalePages = @()
$highTrafficOverdue = @()
$noOutcomeHowTo = @()
$today = [DateTime]::Today

foreach ($file in $allFiles) {
    $lines = Get-Content -LiteralPath $file.FullName
    $yaml = Get-YamlBlock -Lines $lines
    if ($null -eq $yaml) {
        $missingFrontmatter += $file.RelPath
        continue
    }
    $withFrontmatter++
    $meta = Parse-YamlTopLevel -YamlLines $yaml

    # doc_type distribution
    $dt = if ($meta.ContainsKey('doc_type')) { $meta['doc_type'].ToLower() } else { '(missing)' }
    if (-not $docTypeMap.ContainsKey($dt)) { $docTypeMap[$dt] = 0 }
    $docTypeMap[$dt]++

    # status distribution
    $st = if ($meta.ContainsKey('status')) { $meta['status'].ToLower() } else { '(missing)' }
    if (-not $statusMap.ContainsKey($st)) { $statusMap[$st] = 0 }
    $statusMap[$st]++

    # review cadence checks
    if ($meta.ContainsKey('last_reviewed') -and $meta['last_reviewed'] -match '^\d{4}-\d{2}-\d{2}$') {
        $reviewed = [DateTime]::ParseExact($meta['last_reviewed'], 'yyyy-MM-dd', $null)
        $daysOld = ($today - $reviewed).Days

        $isHighTraffic = $highTrafficPaths -contains $file.RelPath
        $isActive = $st -eq 'active'

        if ($isActive -and $isHighTraffic -and $daysOld -gt $HighTrafficThresholdDays) {
            $highTrafficOverdue += [PSCustomObject]@{ Path = $file.RelPath; DaysOld = $daysOld; LastReviewed = $meta['last_reviewed'] }
        }
        if ($isActive -and $daysOld -gt $StaleThresholdDays) {
            $stalePages += [PSCustomObject]@{ Path = $file.RelPath; DaysOld = $daysOld; LastReviewed = $meta['last_reviewed'] }
        }
    }

    # Outcome check: How-to and Tutorial pages should have ## Outcome
    if ($dt -in @('how-to', 'tutorial')) {
        $content = $lines -join "`n"
        if ($content -notmatch '(?m)^## Outcome') {
            $noOutcomeHowTo += $file.RelPath
        }
    }
}

$coveragePct = if ($total -gt 0) { [Math]::Round($withFrontmatter / $total * 100, 1) } else { 0 }

# Run link check if the script is available
$linkIssues = 0
$linkCheckPath = Join-Path $root '.tmp-link-check.ps1'
if (Test-Path $linkCheckPath) {
    try {
        Push-Location $root
        & $linkCheckPath | Out-Null
        $issuesFile = Join-Path $root '.tmp-link-issues.json'
        if (Test-Path $issuesFile) {
            $linkIssues = (@(Get-Content $issuesFile -Raw | ConvertFrom-Json)).Count
        }
        Pop-Location
    } catch {
        Pop-Location
        $linkIssues = -1
    }
}

# Build output
$lines_out = @()
$lines_out += "# SkyCMS Documentation KPI Report — $reportDate"
$lines_out += ""
$lines_out += "## Summary"
$lines_out += ""
$lines_out += "| Metric | Value |"
$lines_out += "| --- | --- |"
$lines_out += "| Total Markdown pages | $total |"
$lines_out += "| Pages with YAML frontmatter | $withFrontmatter |"
$lines_out += "| Metadata coverage | $coveragePct% |"
$lines_out += "| Stale pages (active, >$StaleThresholdDays days) | $($stalePages.Count) |"
$lines_out += "| High-traffic overdue (>$HighTrafficThresholdDays days) | $($highTrafficOverdue.Count) |"
$lines_out += "| How-to/Tutorial pages missing Outcome | $($noOutcomeHowTo.Count) |"
if ($linkIssues -ge 0) {
    $lines_out += "| Internal link issues | $linkIssues |"
} else {
    $lines_out += "| Internal link issues | (check skipped) |"
}
$lines_out += "| Report generated | $reportDate |"
$lines_out += ""

$lines_out += "## Metadata coverage"
$lines_out += ""
$lines_out += "**$withFrontmatter of $total pages** have YAML frontmatter ($coveragePct%)."
$lines_out += ""
if ($missingFrontmatter.Count -gt 0) {
    $lines_out += "<details><summary>Pages missing frontmatter ($($missingFrontmatter.Count))</summary>"
    $lines_out += ""
    foreach ($p in ($missingFrontmatter | Sort-Object)) { $lines_out += "- $p" }
    $lines_out += ""
    $lines_out += "</details>"
    $lines_out += ""
}

$lines_out += "## Doc type distribution"
$lines_out += ""
$lines_out += "| doc_type | Count |"
$lines_out += "| --- | --- |"
foreach ($key in ($docTypeMap.Keys | Sort-Object)) {
    $lines_out += "| $key | $($docTypeMap[$key]) |"
}
$lines_out += ""

$lines_out += "## Status distribution"
$lines_out += ""
$lines_out += "| status | Count |"
$lines_out += "| --- | --- |"
foreach ($key in ($statusMap.Keys | Sort-Object)) {
    $lines_out += "| $key | $($statusMap[$key]) |"
}
$lines_out += ""

$lines_out += "## Review cadence health"
$lines_out += ""
if ($highTrafficOverdue.Count -gt 0) {
    $lines_out += "### High-traffic pages overdue (>${HighTrafficThresholdDays} days)"
    $lines_out += ""
    $lines_out += "| Page | Last reviewed | Days old |"
    $lines_out += "| --- | --- | --- |"
    foreach ($p in ($highTrafficOverdue | Sort-Object DaysOld -Descending)) {
        $lines_out += "| $($p.Path) | $($p.LastReviewed) | $($p.DaysOld) |"
    }
    $lines_out += ""
} else {
    $lines_out += "All high-traffic pages are within the $HighTrafficThresholdDays-day review window. :white_check_mark:"
    $lines_out += ""
}

if ($stalePages.Count -gt 0) {
    $lines_out += "### Active pages overdue (>${StaleThresholdDays} days)"
    $lines_out += ""
    $lines_out += "| Page | Last reviewed | Days old |"
    $lines_out += "| --- | --- | --- |"
    foreach ($p in ($stalePages | Sort-Object DaysOld -Descending | Select-Object -First 30)) {
        $lines_out += "| $($p.Path) | $($p.LastReviewed) | $($p.DaysOld) |"
    }
    if ($stalePages.Count -gt 30) { $lines_out += "| ... and $($stalePages.Count - 30) more | | |" }
    $lines_out += ""
} else {
    $lines_out += "All active pages are within the $StaleThresholdDays-day review window. :white_check_mark:"
    $lines_out += ""
}

$lines_out += "## Internal link health"
$lines_out += ""
if ($linkIssues -eq 0) {
    $lines_out += "No internal link or anchor issues detected. :white_check_mark:"
} elseif ($linkIssues -gt 0) {
    $lines_out += "**$linkIssues internal link issue(s) detected.** Run `./.tmp-link-check.ps1` for details."
} else {
    $lines_out += "_Link check skipped (`.tmp-link-check.ps1` not found or errored)._"
}
$lines_out += ""

$lines_out += "## Notes"
$lines_out += ""
$lines_out += "- Top failed searches requires integration with site analytics (e.g. Cloudflare Analytics, Plausible, or MkDocs search logs). Not available from local corpus scan."
$lines_out += "- Run ``./scripts/review-cadence-check.ps1`` for a full overdue-review listing with owner information."
$lines_out += "- Run ``./scripts/deprecation-audit.ps1`` for a full deprecated/archived page audit."

# Console output
$lines_out | ForEach-Object { Write-Host $_ }

# Markdown output
if ($OutputMarkdown) {
    $lines_out | Set-Content $OutputMarkdown -Encoding utf8
    Write-Host ""
    Write-Host "Report written to: $OutputMarkdown" -ForegroundColor Green
}
