<#
Converts Obsidian image embeds like:
  ![[photo.png]]
  ![[photo with spaces.jpg]]
  ![[photo.png|200]]
  ![[photo.png|200x300]]
  ![[photo.png|My descriptive alt]]

into Markdown/HTML that works on GitHub Pages with Jekyll, using:
  {{ '/path/from/site/root' | relative_url | uri_escape }}

How image paths are resolved (in order):
1) If the embed references a filename (with or without subfolders),
   prefer a match under content/assets/img
2) Otherwise search anywhere under content/
3) If not found, leave the embed unchanged and log a warning

Creates a .bak backup before writing any changes.

Run from repo root:
  cd C:\Users\rinac\Documents\Web\my-site-fresh
  .\scripts\convert-obsidian-embeds.ps1
#>

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

# Root and search directories
$RepoRoot   = (Resolve-Path ".").Path
$ContentDir = Join-Path $RepoRoot "content"
$AssetsImg  = Join-Path $ContentDir "assets\img"

# Regex to find Obsidian image embeds:
# Matches:
#   ![[path/to/image.png]]
#   ![[image.png|200]]
#   ![[image.png|200x300]]
#   ![[image.png|My alt text]]
# Optional "#..." fragment after filename is ignored for images
$embedPattern = [regex]'!\[\[([^\]\|#]+)(?:#[^\]]+)?(?:\|([^\]]+))?\]\]'

# Allowed image extensions
$imageExtPattern = [regex]'(?i)\.(png|jpe?g|gif|svg|webp)$'

# Ensure a path begins with "/content/..." from the repo root, using forward slashes.
function Get-SitePathFromFile([string]$fullPath) {
  $fullPath = (Resolve-Path -LiteralPath $fullPath).Path
  $rel = $fullPath.Substring($RepoRoot.Length).TrimStart('\','/')
  $rel = $rel -replace '\\','/'
  return "/$rel"
}

# Given a reference inside ![[...]], return a site-root path like "/content/.../image.png" or $null if not found
function Resolve-ImageSitePath([string]$ref) {
  # Normalize slashes
  $ref = $ref -replace '\\','/'
  # If starts with '/', treat as site-root path already
  if ($ref.StartsWith('/')) {
    return $ref
  }
  # If starts with "content/", we can directly convert to site path
  if ($ref -match '^content/') {
    return "/$ref"
  }
  # Otherwise search by filename (prefer content/assets/img)
  $name = [System.IO.Path]::GetFileName($ref)

  # Prefer under assets/img
  if (Test-Path $AssetsImg) {
    $hit = Get-ChildItem -Path $AssetsImg -Recurse -File -ErrorAction SilentlyContinue |
      Where-Object { $_.Name -ieq $name } | Select-Object -First 1
    if ($hit) { return Get-SitePathFromFile $hit.FullName }
  }

  # Fallback: anywhere under content/
  if (Test-Path $ContentDir) {
    $hit = Get-ChildItem -Path $ContentDir -Recurse -File -ErrorAction SilentlyContinue |
      Where-Object { $_.Name -ieq $name } | Select-Object -First 1
    if ($hit) { return Get-SitePathFromFile $hit.FullName }
  }

  return $null
}

# Build the Liquid src that works with baseurl and encodes spaces safely
function Make-LiquidSrc([string]$sitePath) {
  # Example output: {{ '/content/assets/img/photo 01.jpg' | relative_url | uri_escape }}
  return "{{ '$sitePath' | relative_url | uri_escape }}"
}

# Escape any closing bracket in alt text to avoid breaking Markdown
function Escape-Alt([string]$alt) {
  if ([string]::IsNullOrWhiteSpace($alt)) { return "" }
  return ($alt -replace '\]','\]')
}

# Convert one embed match into replacement text (Markdown or HTML)
function Convert-Embed([System.Text.RegularExpressions.Match]$m) {
  $pathRaw = $m.Groups[1].Value.Trim()
  $optRaw  = if ($m.Groups[2].Success) { $m.Groups[2].Value.Trim() } else { $null }

  # Only convert if the target looks like an image file
  if (-not $imageExtPattern.IsMatch($pathRaw)) {
    return $m.Value  # leave unchanged
  }

  $sitePath = Resolve-ImageSitePath $pathRaw
  if (-not $sitePath) {
    Write-Warning "Image not found for embed $($m.Value). Skipping."
    return $m.Value
  }

  $src = Make-LiquidSrc $sitePath

  # Default alt is filename (no extension)
  $alt = [System.IO.Path]::GetFileNameWithoutExtension($pathRaw)

  # If the pipe option exists, interpret it
  if ($optRaw) {
    # Width or width x height (with optional 'px')
    $dim = [regex]::Match($optRaw, '^\s*(\d+)\s*(?:x\s*(\d+))?\s*(px)?\s*$', [System.Text.RegularExpressions.RegexOptions]::IgnoreCase)
    if ($dim.Success) {
      $w = $dim.Groups[1].Value
      $h = $dim.Groups[2].Value
      if ([string]::IsNullOrWhiteSpace($h)) {
        return "<img src=""$src"" alt=""$([System.Web.HttpUtility]::HtmlAttributeEncode($alt))"" width=""$w"">"
      } else {
        return "<img src=""$src"" alt=""$([System.Web.HttpUtility]::HtmlAttributeEncode($alt))"" width=""$w"" height=""$h"">"
      }
    } else {
      # Treat the option as alt text
      $alt = $optRaw
    }
  }

  $altMd = Escape-Alt $alt
  return "![${altMd}]($src)"
}

# Process a single Markdown file's content
function Convert-File([string]$path) {
  $text = Get-Content -LiteralPath $path -Raw

  # Collect all matches first
  $matches = $embedPattern.Matches($text)
  if ($matches.Count -eq 0) { return $false } # no change

  $sb = New-Object System.Text.StringBuilder
  $last = 0
  foreach ($m in $matches) {
    # Append text before match
    $null = $sb.Append($text.Substring($last, $m.Index - $last))
    # Append replacement
    $replacement = Convert-Embed $m
    $null = $sb.Append($replacement)
    # Advance
    $last = $m.Index + $m.Length
  }
  # Append tail
  $null = $sb.Append($text.Substring($last))

  $newText = $sb.ToString()
  if ($newText -ne $text) {
    # Backup
    Copy-Item -LiteralPath $path -Destination ($path + ".bak") -Force
    # Write new
    Set-Content -LiteralPath $path -Value $newText -Encoding UTF8
    Write-Host "Updated: $path"
    return $true
  }
  return $false
}

# Main: walk all Markdown files under content/
$changed = 0
if (-not (Test-Path $ContentDir)) {
  Write-Error "Cannot find content directory at $ContentDir"
  exit 1
}

Get-ChildItem -Path $ContentDir -Recurse -Filter *.md -File | ForEach-Object {
  $changedFile = Convert-File $_.FullName
  if ($changedFile) { $changed++ }
}

Write-Host "Done. Files changed: $changed"
Write-Host "Note: Backups saved as .bak next to modified files."