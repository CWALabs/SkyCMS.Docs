param(
    [string[]]$Files,
    [string[]]$RequireFrontMatterFiles
)

$ErrorActionPreference = 'Stop'

$requiredFields = @(
    'canonical_title',
    'description',
    'doc_type',
    'product_area',
    'user_intent',
    'audience',
    'difficulty',
    'version',
    'status',
    'owner',
    'last_reviewed'
)

$allowedDocTypes = @('tutorial', 'how-to', 'reference', 'explanation')
$allowedDifficulty = @('beginner', 'intermediate', 'advanced')
$allowedStatus = @('draft', 'active', 'deprecated', 'archived')

function Normalize-Path([string]$Path) {
    return $Path.Replace('\\', '/')
}

function Should-Skip([string]$Path) {
    $p = Normalize-Path $Path
    return $p -like 'site/*' -or $p -like '.github/*' -or $p -like 'notes/*'
}

function Get-TargetFiles {
    param([string[]]$InputFiles)

    if ($null -ne $InputFiles -and $InputFiles.Count -gt 0) {
        return $InputFiles | Where-Object { $_ -and (Test-Path -LiteralPath $_) }
    }

    return Get-ChildItem -Recurse -File -Filter *.md |
        Where-Object { -not (Should-Skip (Normalize-Path $_.FullName.Substring((Get-Location).Path.Length + 1))) } |
        ForEach-Object { $_.FullName }
}

function Get-YamlBlock {
    param([string[]]$Lines)

    if ($Lines.Count -lt 3) { return $null }
    if ($Lines[0].Trim() -ne '---') { return $null }

    for ($i = 1; $i -lt $Lines.Count; $i++) {
        if ($Lines[$i].Trim() -eq '---') {
            return $Lines[1..($i - 1)]
        }
    }

    return $null
}

function Parse-YamlTopLevelKeys {
    param([string[]]$YamlLines)

    $keys = @{}
    foreach ($line in $YamlLines) {
        if ($line -match '^([A-Za-z0-9_\-]+):\s*(.*)$') {
            $keys[$Matches[1]] = $Matches[2]
        }
    }
    return $keys
}

function Strip-WrappingQuotes([string]$Value) {
    if ($null -eq $Value) { return '' }
    $trimmed = $Value.Trim()
    if ($trimmed.Length -ge 2) {
        $first = $trimmed[0]
        $last = $trimmed[$trimmed.Length - 1]
        if (($first -eq '"' -and $last -eq '"') -or ($first -eq "'" -and $last -eq "'")) {
            return $trimmed.Substring(1, $trimmed.Length - 2)
        }
    }
    return $trimmed
}

$errors = New-Object System.Collections.Generic.List[string]
$targets = Get-TargetFiles -InputFiles $Files
$requiredFrontMatter = @{}
foreach ($rf in @($RequireFrontMatterFiles)) {
    if ($rf) {
        $requiredFrontMatter[(Normalize-Path $rf)] = $true
    }
}

foreach ($file in $targets) {
    $relative = Normalize-Path $file
    if ($file.StartsWith((Get-Location).Path)) {
        $relative = Normalize-Path $file.Substring((Get-Location).Path.Length + 1)
    }

    if (Should-Skip $relative) {
        continue
    }

    $lines = Get-Content -LiteralPath $file
    $yaml = Get-YamlBlock -Lines $lines

    if ($null -eq $yaml) {
        if ($requiredFrontMatter.ContainsKey($relative)) {
            $errors.Add("${relative}: missing YAML front matter block")
        }
        continue
    }

    $keys = Parse-YamlTopLevelKeys -YamlLines $yaml

    foreach ($field in $requiredFields) {
        if (-not $keys.ContainsKey($field)) {
            $errors.Add("${relative}: missing required field '$field'")
        }
    }

    if ($keys.ContainsKey('doc_type')) {
        $docType = (Strip-WrappingQuotes $keys['doc_type']).ToLowerInvariant()
        if ($allowedDocTypes -notcontains $docType) {
            $errors.Add("${relative}: invalid doc_type '$($keys['doc_type'])' (allowed: Tutorial, How-to, Reference, Explanation)")
        }
    }

    if ($keys.ContainsKey('difficulty')) {
        $difficulty = (Strip-WrappingQuotes $keys['difficulty']).ToLowerInvariant()
        if ($allowedDifficulty -notcontains $difficulty) {
            $errors.Add("${relative}: invalid difficulty '$($keys['difficulty'])' (allowed: beginner, intermediate, advanced)")
        }
    }

    if ($keys.ContainsKey('status')) {
        $status = (Strip-WrappingQuotes $keys['status']).ToLowerInvariant()
        if ($allowedStatus -notcontains $status) {
            $errors.Add("${relative}: invalid status '$($keys['status'])' (allowed: draft, active, deprecated, archived)")
        }
    }

    if ($keys.ContainsKey('last_reviewed')) {
        $lastReviewed = Strip-WrappingQuotes $keys['last_reviewed']
        if ($lastReviewed -notmatch '^\d{4}-\d{2}-\d{2}$') {
            $errors.Add("${relative}: last_reviewed must use yyyy-mm-dd format")
        }
    }
}

if ($errors.Count -gt 0) {
    Write-Host "Metadata validation failed with $($errors.Count) issue(s):" -ForegroundColor Red
    foreach ($e in $errors) {
        Write-Host " - $e" -ForegroundColor Red
    }
    exit 1
}

Write-Host "Metadata validation passed for $($targets.Count) file(s)." -ForegroundColor Green
