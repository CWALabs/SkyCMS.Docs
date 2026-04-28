<#
.SYNOPSIS
    Audit deprecated and archived documentation pages for proper governance.

.DESCRIPTION
    Checks that:
    1. Pages with status=deprecated have a superseded_by field pointing to a valid page.
    2. Pages with status=archived are not listed in the active nav (mkdocs.yml).
    3. No active pages link to deprecated or archived pages.

    Exit code 0 even when issues are found — this is a governance audit tool,
    not a blocking gate. Use -FailIfIssues to change this behavior.

.PARAMETER FailIfIssues
    If specified, exits with code 1 when any audit issues are found.

.PARAMETER DocsRoot
    Root of the docs directory. Defaults to the current directory.

.EXAMPLE
    ./scripts/deprecation-audit.ps1
    ./scripts/deprecation-audit.ps1 -FailIfIssues
#>
param(
    [switch]$FailIfIssues,
    [string]$DocsRoot = '.'
)

$ErrorActionPreference = 'Stop'

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

$root    = (Resolve-Path $DocsRoot).Path
$navFile = Join-Path $root 'mkdocs.yml'

# Load nav content for archived-page check
$navContent = if (Test-Path $navFile) { Get-Content $navFile -Raw } else { '' }

$allFiles = Get-ChildItem -Path $root -Recurse -File -Filter '*.md' |
    ForEach-Object {
        $rel = $_.FullName.Substring($root.Length + 1).Replace('\', '/')
        if (-not (Should-Skip $rel)) { $_ | Add-Member -NotePropertyName RelPath -NotePropertyValue $rel -PassThru }
    } | Where-Object { $_ }

$deprecatedPages = @{}   # path -> meta
$archivedPages   = @{}   # path -> meta

$issues = [System.Collections.Generic.List[string]]::new()
$warnings = [System.Collections.Generic.List[string]]::new()

# Pass 1: collect deprecated and archived pages
foreach ($file in $allFiles) {
    $lines = Get-Content -LiteralPath $file.FullName
    $yaml  = Get-YamlBlock -Lines $lines
    if ($null -eq $yaml) { continue }
    $meta  = Parse-YamlTopLevel -YamlLines $yaml
    $status = if ($meta.ContainsKey('status')) { $meta['status'].ToLower() } else { '' }

    if ($status -eq 'deprecated') {
        $deprecatedPages[$file.RelPath] = $meta

        # Check: deprecated pages should have superseded_by
        if (-not $meta.ContainsKey('superseded_by') -or [string]::IsNullOrWhiteSpace($meta['superseded_by'])) {
            $issues.Add("DEPRECATED without superseded_by: $($file.RelPath)")
        } else {
            # Check superseded_by target exists
            $target = $meta['superseded_by'].TrimStart('/')
            $targetFull = Join-Path $root ($target.Replace('/', [System.IO.Path]::DirectorySeparatorChar))
            if (-not (Test-Path $targetFull)) {
                $issues.Add("DEPRECATED superseded_by target not found: $($file.RelPath) -> $target")
            }
        }
    }

    if ($status -eq 'archived') {
        $archivedPages[$file.RelPath] = $meta

        # Check: archived pages should not appear in the nav
        $relForNav = $file.RelPath.Replace('\', '/')
        if ($navContent -match [regex]::Escape($relForNav)) {
            $issues.Add("ARCHIVED page found in mkdocs.yml nav: $($file.RelPath)")
        }
    }
}

# Pass 2: check active pages for links to deprecated or archived pages
$linkPattern = [regex]'\]\(([^)#]+\.md[^)]*)\)'

foreach ($file in $allFiles) {
    $lines = Get-Content -LiteralPath $file.FullName
    $yaml  = Get-YamlBlock -Lines $lines
    if ($null -ne $yaml) {
        $meta   = Parse-YamlTopLevel -YamlLines $yaml
        $status = if ($meta.ContainsKey('status')) { $meta['status'].ToLower() } else { 'active' }
        if ($status -in @('deprecated', 'archived')) { continue }
    }

    $content = $lines -join "`n"
    $matches  = $linkPattern.Matches($content)
    foreach ($m in $matches) {
        $rawTarget  = $m.Groups[1].Value.Trim()
        $cleanTarget = $rawTarget -replace '#.*$', ''
        if ($cleanTarget.StartsWith('http')) { continue }

        # Resolve relative to file location
        $absTarget = if ($cleanTarget.StartsWith('/')) {
            Join-Path $root $cleanTarget.TrimStart('/')
        } else {
            Join-Path (Split-Path $file.FullName) $cleanTarget
        }

        try { $resolvedRel = (Resolve-Path $absTarget -ErrorAction SilentlyContinue)?.Path } catch { $resolvedRel = $null }
        if ($null -eq $resolvedRel) { continue }

        $resolvedRelNorm = $resolvedRel.Substring($root.Length + 1).Replace('\', '/')

        if ($deprecatedPages.ContainsKey($resolvedRelNorm)) {
            $warnings.Add("Active page links to DEPRECATED: $($file.RelPath) -> $resolvedRelNorm")
        }
        if ($archivedPages.ContainsKey($resolvedRelNorm)) {
            $warnings.Add("Active page links to ARCHIVED: $($file.RelPath) -> $resolvedRelNorm")
        }
    }
}

# Report
Write-Host ""
Write-Host "=== Documentation Deprecation Audit ===" -ForegroundColor Cyan
Write-Host "  Deprecated pages : $($deprecatedPages.Count)"
Write-Host "  Archived pages   : $($archivedPages.Count)"
Write-Host ""

if ($deprecatedPages.Count -gt 0) {
    Write-Host "Deprecated pages:" -ForegroundColor Yellow
    foreach ($p in ($deprecatedPages.Keys | Sort-Object)) {
        $sb = if ($deprecatedPages[$p].ContainsKey('superseded_by')) { "-> $($deprecatedPages[$p]['superseded_by'])" } else { '(no superseded_by)' }
        Write-Host "  $p  $sb"
    }
    Write-Host ""
}

if ($archivedPages.Count -gt 0) {
    Write-Host "Archived pages:" -ForegroundColor DarkGray
    foreach ($p in ($archivedPages.Keys | Sort-Object)) {
        Write-Host "  $p"
    }
    Write-Host ""
}

if ($issues.Count -gt 0) {
    Write-Host "Issues requiring action ($($issues.Count)):" -ForegroundColor Red
    foreach ($i in $issues) { Write-Host "  [ISSUE] $i" -ForegroundColor Red }
    Write-Host ""
}

if ($warnings.Count -gt 0) {
    Write-Host "Warnings ($($warnings.Count)):" -ForegroundColor Yellow
    foreach ($w in $warnings) { Write-Host "  [WARN]  $w" -ForegroundColor Yellow }
    Write-Host ""
}

if ($issues.Count -eq 0 -and $warnings.Count -eq 0 -and $deprecatedPages.Count -eq 0 -and $archivedPages.Count -eq 0) {
    Write-Host "No deprecated or archived pages found. Nothing to audit." -ForegroundColor Green
} elseif ($issues.Count -eq 0 -and $warnings.Count -eq 0) {
    Write-Host "All deprecated and archived pages are correctly governed." -ForegroundColor Green
}
Write-Host ""

if ($FailIfIssues -and $issues.Count -gt 0) {
    exit 1
}
