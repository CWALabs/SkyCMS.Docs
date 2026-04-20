param(
    [string]$DocsRoot = (Split-Path -Parent $PSScriptRoot),
    [string]$SiteUrl = 'https://docs.sky-cms.com/'
)

$ErrorActionPreference = 'Stop'

function Get-HomepageAssets {
    param(
        [string]$IndexHtmlPath
    )

    $content = Get-Content -Path $IndexHtmlPath -Raw -Encoding UTF8
    $pattern = @'
(?:href|src)=["'](assets/[^"'#? ]+)
'@
    $matches = [regex]::Matches($content, $pattern)
    $seen = New-Object System.Collections.Generic.HashSet[string]

    foreach ($match in $matches) {
        $asset = $match.Groups[1].Value
        if ($seen.Add($asset)) {
            $asset
        }
    }
}

$docsRoot = (Resolve-Path $DocsRoot).Path
$repoName = Split-Path -Leaf $docsRoot
$workspaceRoot = Split-Path -Parent $docsRoot
$wrapperConfig = Join-Path $workspaceRoot 'mkdocs-asset-verify.yml'
$siteDir = Join-Path $workspaceRoot '_asset_verify_site'

try {
    Set-Location $workspaceRoot

    @"
INHERIT: ${repoName}/mkdocs.yml
docs_dir: ${repoName}
site_dir: _asset_verify_site
"@ | Set-Content -Path $wrapperConfig -Encoding UTF8

    python -m mkdocs build --config-file $wrapperConfig | Out-Null

    $indexHtml = Join-Path $siteDir 'index.html'
    if (-not (Test-Path $indexHtml)) {
        throw 'Generated site is missing index.html.'
    }

    $assets = @(Get-HomepageAssets -IndexHtmlPath $indexHtml)
    if ($assets.Count -eq 0) {
        throw 'No homepage assets were detected in generated index.html.'
    }

    $results = foreach ($asset in $assets) {
        $localPath = Join-Path $siteDir $asset.Replace('/', [IO.Path]::DirectorySeparatorChar)
        $localExists = Test-Path $localPath

        $statusCode = $null
        $contentType = $null
        $cacheStatus = $null
        $lastModified = $null
        $errorMessage = $null

        try {
            $response = Invoke-WebRequest -Uri ($SiteUrl.TrimEnd('/') + '/' + $asset) -UseBasicParsing -MaximumRedirection 5
            $statusCode = [int]$response.StatusCode
            $contentType = $response.Headers['Content-Type']
            $cacheStatus = $response.Headers['CF-Cache-Status']
            $lastModified = $response.Headers['Last-Modified']
        }
        catch {
            if ($_.Exception.Response) {
                $statusCode = [int]$_.Exception.Response.StatusCode
                $contentType = $_.Exception.Response.Headers['Content-Type']
                $cacheStatus = $_.Exception.Response.Headers['CF-Cache-Status']
                $lastModified = $_.Exception.Response.Headers['Last-Modified']
            }

            $errorMessage = $_.Exception.Message
        }

        [pscustomobject]@{
            Asset        = $asset
            LocalExists  = $localExists
            LocalLength  = if ($localExists) { (Get-Item $localPath).Length } else { $null }
            LiveStatus   = $statusCode
            ContentType  = $contentType
            CacheStatus  = $cacheStatus
            LastModified = $lastModified
            Error        = $errorMessage
        }
    }

    $results | Format-Table -AutoSize
}
finally {
    if (Test-Path $wrapperConfig) {
        Remove-Item $wrapperConfig -Force
    }

    if (Test-Path $siteDir) {
        Remove-Item $siteDir -Recurse -Force
    }
}