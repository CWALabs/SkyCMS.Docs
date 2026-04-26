$ErrorActionPreference = 'Stop'

function Get-Slug([string]$h) {
  $s = $h.Trim().ToLowerInvariant()
  $s = $s -replace '`',''
  $s = $s -replace '[^a-z0-9\s\-]',''
  $s = $s -replace '\s+','-'
  $s = $s -replace '-+','-'
  $s = $s.Trim('-')
  return $s
}

$mdFiles = Get-ChildItem -Recurse -File -Include *.md
$anchorCache = @{}
$issues = New-Object System.Collections.Generic.List[object]

foreach ($file in $mdFiles) {
  $content = Get-Content -Raw -Path $file.FullName
  $matches = [regex]::Matches($content, '(?<!!)\[[^\]]*\]\(([^)]+)\)')

  foreach ($m in $matches) {
    $rawTarget = $m.Groups[1].Value.Trim()
    if ([string]::IsNullOrWhiteSpace($rawTarget)) { continue }

    $target = $rawTarget.Split(' ')[0].Trim('"',"'")
    if ($target -match '^(https?:|mailto:|tel:|data:|javascript:)') { continue }

    $target = $target -replace '%20', ' '

    $pathPart = $target
    $anchorPart = $null
    if ($target.Contains('#')) {
      $parts = $target.Split('#', 2)
      $pathPart = $parts[0]
      $anchorPart = $parts[1]
    }

    $targetFile = $null
    if ([string]::IsNullOrWhiteSpace($pathPart)) {
      $targetFile = $file.FullName
    } else {
      $candidate = [System.IO.Path]::GetFullPath((Join-Path $file.DirectoryName $pathPart))
      if (Test-Path -LiteralPath $candidate) {
        $item = Get-Item -LiteralPath $candidate
        if ($item.PSIsContainer) {
          $indexMd = Join-Path $item.FullName 'index.md'
          if (Test-Path -LiteralPath $indexMd) { $targetFile = $indexMd }
        } else {
          $targetFile = $item.FullName
        }
      }
    }

    if (-not $targetFile) {
      $issues.Add([pscustomobject]@{ Type='MISSING_PATH'; Source=$file.FullName; Target=$rawTarget; Resolved='' })
      continue
    }

    if ($anchorPart) {
      if (-not $anchorCache.ContainsKey($targetFile)) {
        $tContent = Get-Content -Raw -Path $targetFile
        $anchors = New-Object System.Collections.Generic.HashSet[string]
        foreach ($hm in [regex]::Matches($tContent, '(?m)^#{1,6}\s+(.+)$')) {
          $headingText = $hm.Groups[1].Value
          $explicit = [regex]::Match($headingText, '\{#([A-Za-z0-9\-_]+)\}\s*$')
          if ($explicit.Success) {
            [void]$anchors.Add($explicit.Groups[1].Value.ToLowerInvariant())
            $headingText = $headingText.Substring(0, $explicit.Index).Trim()
          }
          $slug = Get-Slug $headingText
          if ($slug) { [void]$anchors.Add($slug) }
        }
        $anchorCache[$targetFile] = $anchors
      }

      $wanted = $anchorPart.Trim().ToLowerInvariant()
      if (-not $anchorCache[$targetFile].Contains($wanted)) {
        $issues.Add([pscustomobject]@{ Type='MISSING_ANCHOR'; Source=$file.FullName; Target=$rawTarget; Resolved=$targetFile })
      }
    }
  }
}

$issues | Sort-Object Source,Target,Type | ConvertTo-Json -Depth 4 | Set-Content -Path '.tmp-link-issues.json' -Encoding UTF8
Write-Output "Total markdown files scanned: $($mdFiles.Count)"
Write-Output "Total issues: $($issues.Count)"
