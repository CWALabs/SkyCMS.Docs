<#
.SYNOPSIS
    List documentation pages that are overdue for review based on review cadence targets.

.DESCRIPTION
    Checks last_reviewed dates against two cadence targets:
    - High-traffic pages: 90-day review window (configurable)
    - All active pages: 180-day review window (configurable)

    Pages that have never been reviewed (missing last_reviewed), have an invalid
    date, or are past their review window are listed with their owner.

    Exit code 0 even when pages are overdue — this is a governance visibility
    tool, not a blocking gate. Use -FailIfOverdue to change this behavior.

.PARAMETER HighTrafficDays
    Review window in days for high-traffic pages. Default: 90.

.PARAMETER AllPagesDays
    Review window in days for all active pages. Default: 180.

.PARAMETER FailIfOverdue
    If specified, exits with code 1 when any overdue pages are found.

.PARAMETER DocsRoot
    Root of the docs directory. Defaults to the current directory.

.EXAMPLE
    ./scripts/review-cadence-check.ps1
    ./scripts/review-cadence-check.ps1 -HighTrafficDays 60 -AllPagesDays 120
    ./scripts/review-cadence-check.ps1 -FailIfOverdue
#>
param(
    [int]$HighTrafficDays = 90,
    [int]$AllPagesDays = 180,
    [switch]$FailIfOverdue,
    [string]$DocsRoot = '.'
)

$ErrorActionPreference = 'Stop'

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
    foreach ($prefix in $skipPrefixes) { if ($p.StartsWith($prefix)) { return $true } }
    return $false
}

function Get-YamlBlock([string[]]$Lines) {
    if ($Lines.Count -lt 3 -or $Lines[0].Trim() -ne '---') { return $null }
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
$root = (Resolve-Path $DocsRoot).Path

$allFiles = Get-ChildItem -Path $root -Recurse -File -Filter '*.md' |
    ForEach-Object {
        $rel = $_.FullName.Substring($root.Length + 1).Replace('\', '/')
        if (-not (Should-Skip $rel)) { $_ | Add-Member -NotePropertyName RelPath -NotePropertyValue $rel -PassThru }
    } | Where-Object { $_ }

$highTrafficOverdue = [System.Collections.Generic.List[PSCustomObject]]::new()
$allPagesOverdue    = [System.Collections.Generic.List[PSCustomObject]]::new()
$missingDate        = [System.Collections.Generic.List[PSCustomObject]]::new()

foreach ($file in $allFiles) {
    $lines = Get-Content -LiteralPath $file.FullName
    $yaml  = Get-YamlBlock -Lines $lines
    if ($null -eq $yaml) { continue }
    $meta  = Parse-YamlTopLevel -YamlLines $yaml

    $status = if ($meta.ContainsKey('status')) { $meta['status'].ToLower() } else { '' }
    if ($status -notin @('active', 'draft')) { continue }   # skip deprecated/archived

    $owner      = if ($meta.ContainsKey('owner'))        { $meta['owner'] }        else { '(no owner)' }
    $isHighTraffic = $highTrafficPaths -contains $file.RelPath

    if (-not $meta.ContainsKey('last_reviewed') -or $meta['last_reviewed'] -notmatch '^\d{4}-\d{2}-\d{2}$') {
        $missingDate.Add([PSCustomObject]@{ Path = $file.RelPath; Owner = $owner; HighTraffic = $isHighTraffic })
        continue
    }

    $reviewed = [DateTime]::ParseExact($meta['last_reviewed'], 'yyyy-MM-dd', $null)
    $daysOld  = ($today - $reviewed).Days
    $threshold = if ($isHighTraffic) { $HighTrafficDays } else { $AllPagesDays }

    if ($daysOld -gt $threshold) {
        $record = [PSCustomObject]@{
            Path        = $file.RelPath
            Owner       = $owner
            LastReviewed= $meta['last_reviewed']
            DaysOld     = $daysOld
            Threshold   = $threshold
            HighTraffic = $isHighTraffic
        }
        if ($isHighTraffic) {
            $highTrafficOverdue.Add($record)
        } else {
            $allPagesOverdue.Add($record)
        }
    }
}

$totalOverdue = $highTrafficOverdue.Count + $allPagesOverdue.Count + $missingDate.Count

Write-Host ""
Write-Host "=== Documentation Review Cadence Check ===" -ForegroundColor Cyan
Write-Host "  High-traffic threshold : $HighTrafficDays days"
Write-Host "  All-pages threshold    : $AllPagesDays days"
Write-Host "  Check date             : $($today.ToString('yyyy-MM-dd'))"
Write-Host ""

if ($highTrafficOverdue.Count -gt 0) {
    Write-Host "HIGH-TRAFFIC pages overdue ($($highTrafficOverdue.Count)):" -ForegroundColor Red
    foreach ($p in ($highTrafficOverdue | Sort-Object DaysOld -Descending)) {
        Write-Host "  [$($p.DaysOld)d] $($p.Path)  (owner: $($p.Owner))" -ForegroundColor Yellow
    }
    Write-Host ""
}

if ($allPagesOverdue.Count -gt 0) {
    Write-Host "Active pages overdue ($($allPagesOverdue.Count)):" -ForegroundColor Yellow
    foreach ($p in ($allPagesOverdue | Sort-Object DaysOld -Descending)) {
        Write-Host "  [$($p.DaysOld)d] $($p.Path)  (owner: $($p.Owner))"
    }
    Write-Host ""
}

if ($missingDate.Count -gt 0) {
    Write-Host "Pages with missing or invalid last_reviewed ($($missingDate.Count)):" -ForegroundColor Yellow
    foreach ($p in ($missingDate | Sort-Object Path)) {
        $ht = if ($p.HighTraffic) { ' [HIGH TRAFFIC]' } else { '' }
        Write-Host "  $($p.Path)$ht  (owner: $($p.Owner))"
    }
    Write-Host ""
}

if ($totalOverdue -eq 0) {
    Write-Host "All active pages are within their review cadence windows." -ForegroundColor Green
} else {
    Write-Host "Total overdue: $totalOverdue page(s)." -ForegroundColor ($highTrafficOverdue.Count -gt 0 ? 'Red' : 'Yellow')
}
Write-Host ""

if ($FailIfOverdue -and $totalOverdue -gt 0) {
    exit 1
}
