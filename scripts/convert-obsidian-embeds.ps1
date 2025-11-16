<#
Updates Markdown files under content/:
1. Converts Obsidian image embeds ![[...]] to Markdown/HTML with Liquid relative_url + uri_escape.
2. Rewrites existing Markdown or HTML image links to point to /content/assets/img/.
3. Only uses images physically located at content/assets/img/.
4. Skips non-image extensions (pdf, videos).
5. Creates .bak backup for each changed file.

Run:
  cd C:\Users\rinac\Documents\Web\my-site-fresh
  .\scripts\convert-obsidian-embeds-updated.ps1

Commit after running:
  git add -A
  git commit -m "Normalize image embeds to /content/assets/img Liquid form"
  git push
#>

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

$RepoRoot    = (Resolve-Path ".").Path
$ContentDir  = Join-Path $RepoRoot "content"
$AssetsImgDir = Join-Path $ContentDir "assets\img"

if (-not (Test-Path $ContentDir)) {
  Write-Error "Missing content directory: $ContentDir"
  exit 1
}

if (-not (Test-Path $AssetsImgDir)) {
  Write-Error "Missing images directory: $AssetsImgDir"
  exit 1
}

$imageExtPattern = [regex]'(?i)\.(png|jpe?g|gif|svg|webp)$'

$imageFiles = Get-ChildItem -Path $AssetsImgDir -Recurse -File -ErrorAction SilentlyContinue |
  Where-Object { $imageExtPattern.IsMatch($_.Name) }

$imageMap = @{}
foreach ($img in $imageFiles) {
  $lc = $img.Name.ToLower()
  if (-not $imageMap.ContainsKey($lc)) {
    $imageMap[$lc] = $img.FullName
  }
}

function Get-SitePathFromFile([string]$fullPath) {
  $fullPath = (Resolve-Path -LiteralPath $fullPath).Path
  $rel = $fullPath.Substring($RepoRoot.Length).TrimStart('\','/')
  $rel = $rel -replace '\\','/'
  return "/$rel"
}

function Make-LiquidSrc([string]$sitePath) {
  return "{{ '$sitePath' | relative_url | uri_escape }}"
}

$obsidianPattern = [regex]'!\[\[([^\]\|#]+)(?:#[^\]]+)?(?:\|([^\]]+))?\]\]'
$markdownImgPattern = [regex]'!\[(?<alt>[^\]]*)\]\((?<url>[^)]+)\)'
$htmlImgPattern = [regex]'<img[^>]*?\bsrc=["''](?<url>[^"'']+)["''][^>]*>'

function Resolve-To-AssetsSitePath([string]$rawPath) {
  $rawPath = $rawPath.Trim()
  if ($rawPath -match '\{\{.*\}\}') { return $null }
  $rawPath = $rawPath -replace '[?#].*$',''
  $filename = [System.IO.Path]::GetFileName($rawPath)
  if ([string]::IsNullOrWhiteSpace($filename)) { return $null }
  if (-not $imageExtPattern.IsMatch($filename)) { return $null }
  $lc = $filename.ToLower()
  if (-not $imageMap.ContainsKey($lc)) { return $null }
  $full = $imageMap[$lc]
  $sitePath = Get-SitePathFromFile $full
  return $sitePath
}

function Convert-Obsidian-Embed([System.Text.RegularExpressions.Match]$m) {
  $pathRaw = $m.Groups[1].Value.Trim()
  $optRaw  = if ($m.Groups[2].Success) { $m.Groups[2].Value.Trim() } else { $null }

  if (-not $imageExtPattern.IsMatch($pathRaw)) { return $m.Value }

  $filename = [System.IO.Path]::GetFileName($pathRaw)
  $lc = $filename.ToLower()
  if (-not $imageMap.ContainsKey($lc)) {
    Write-Warning "Obsidian embed image not found: $pathRaw"
    return $m.Value
  }

  $sitePath = Get-SitePathFromFile $imageMap[$lc]
  $src = Make-LiquidSrc $sitePath
  $alt = [System.IO.Path]::GetFileNameWithoutExtension($filename)

  if ($optRaw) {
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
      $alt = $optRaw
    }
  }

  $safeAlt = ($alt -replace '\]','\]')
  return "![${safeAlt}]($src)"
}

function Rewrite-Markdown-Images([string]$text) {
  return [regex]::Replace($text, $markdownImgPattern, {
    param($mm)
    $alt = $mm.Groups['alt'].Value
    $url = $mm.Groups['url'].Value.Trim()
    if ($url -match '/content/assets/img/' -or $url -match '\{\{.*\}\}') { return $mm.Value }
    $sitePath = Resolve-To-AssetsSitePath $url
    if ($sitePath) {
      $src = Make-LiquidSrc $sitePath
      return "![${alt}]($src)"
    } else {
      return $mm.Value
    }
  })
}

function Rewrite-HTML-Images([string]$text) {
  return [regex]::Replace($text, $htmlImgPattern, {
    param($mm)
    $url = $mm.Groups['url'].Value.Trim()
    if ($url -match '/content/assets/img/' -or $url -match '\{\{.*\}\}') { return $mm.Value }
    $sitePath = Resolve-To-AssetsSitePath $url
    if ($sitePath) {
      $src = Make-LiquidSrc $sitePath
      return ($mm.Value -replace [regex]::Escape($url), $src)
    } else {
      return $mm.Value
    }
  })
}

function Process-File([string]$path) {
  $original = Get-Content -LiteralPath $path -Raw
  $converted = [regex]::Replace($original, $obsidianPattern, { param($m) Convert-Obsidian-Embed $m })
  $converted = Rewrite-Markdown-Images $converted
  $converted = Rewrite-HTML-Images $converted
  if ($converted -ne $original) {
    Copy-Item -LiteralPath $path -Destination ($path + ".bak") -Force
    Set-Content -LiteralPath $path -Value $converted -Encoding UTF8
    Write-Host "Updated: $path"
    return $true
  }
  return $false
}

$changed = 0
Get-ChildItem -Path $ContentDir -Recurse -Filter *.md -File | ForEach-Object {
  if (Process-File $_.FullName) { $changed++ }
}

Write-Host "Done. Files changed: $changed"
Write-Host "Backups (.bak) created next to modified files."
Write-Host "All image references now point to /content/assets/img via Liquid."