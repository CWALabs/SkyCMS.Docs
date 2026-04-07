# Build and preview the SkyCMS documentation site locally.
# Usage:
#   ./scripts/serve-docs.ps1          # Live-reload dev server (default)
#   ./scripts/serve-docs.ps1 -Build   # Build to ../_skycms_local_site and open in browser
#
# MkDocs forbids the config file living inside docs_dir, so this script
# generates a thin wrapper config one level above the repo that inherits the
# real mkdocs.yml and overrides docs_dir / site_dir.

param(
    [switch]$Build
)

$ErrorActionPreference = 'Stop'
$repoRoot   = Split-Path $PSScriptRoot -Parent
$repoName   = Split-Path $repoRoot -Leaf
$parentDir  = Split-Path $repoRoot -Parent
$wrapperCfg = Join-Path $parentDir 'mkdocs-local.yml'
$siteDir    = Join-Path $parentDir '_skycms_local_site'

# Create a temporary wrapper config that inherits the repo config
@"
INHERIT: $repoName/mkdocs.yml
docs_dir: $repoName
site_dir: _skycms_local_site
"@ | Set-Content $wrapperCfg -Encoding utf8

try {
    Push-Location $parentDir
    if ($Build) {
        Write-Host "Building docs to $siteDir ..." -ForegroundColor Cyan
        python -m mkdocs build --config-file $wrapperCfg
        if ($LASTEXITCODE -ne 0) { Write-Error "Build failed"; exit 1 }
        $index = Join-Path $siteDir 'index.html'
        Write-Host "Opening $index" -ForegroundColor Green
        Start-Process $index
    } else {
        Write-Host "Starting local dev server at http://localhost:8000 (Ctrl+C to stop)" -ForegroundColor Cyan
        python -m mkdocs serve --config-file $wrapperCfg
    }
} finally {
    Pop-Location
    if (Test-Path $wrapperCfg) { Remove-Item $wrapperCfg -Force }
}
