$BASE = Split-Path -Parent $MyInvocation.MyCommand.Path
$FONTS = "$BASE\vendor\fonts"
New-Item -ItemType Directory -Force -Path $FONTS | Out-Null

$client = New-Object System.Net.WebClient
function DL($url, $dest, $label) {
    Write-Host "  $label..." -NoNewline
    try {
        $client.DownloadFile($url, $dest)
        Write-Host " OK" -ForegroundColor Green
    } catch {
        Write-Host " FAILED" -ForegroundColor Red
        Write-Host "    $_"
    }
}

$VZ = "https://cdn.jsdelivr.net/npm/@fontsource/vazirmatn@latest/files"
$JB = "https://cdn.jsdelivr.net/npm/@fontsource/jetbrains-mono@latest/files"
$BB = "https://cdn.jsdelivr.net/npm/@fontsource/bebas-neue@latest/files"

Write-Host "`n=== Vazirmatn ===" -ForegroundColor Cyan
DL "$VZ/vazirmatn-arabic-200-normal.woff2" "$FONTS\Vazirmatn-ExtraLight.woff2" "ExtraLight"
DL "$VZ/vazirmatn-arabic-300-normal.woff2" "$FONTS\Vazirmatn-Light.woff2"      "Light"
DL "$VZ/vazirmatn-arabic-400-normal.woff2" "$FONTS\Vazirmatn-Regular.woff2"    "Regular"
DL "$VZ/vazirmatn-arabic-500-normal.woff2" "$FONTS\Vazirmatn-Medium.woff2"     "Medium"
DL "$VZ/vazirmatn-arabic-700-normal.woff2" "$FONTS\Vazirmatn-Bold.woff2"       "Bold"
DL "$VZ/vazirmatn-arabic-900-normal.woff2" "$FONTS\Vazirmatn-Black.woff2"      "Black"

Write-Host "`n=== Bebas Neue ===" -ForegroundColor Cyan
DL "$BB/bebas-neue-latin-400-normal.woff2" "$FONTS\BebasNeue-Regular.woff2"    "Regular"

Write-Host "`n=== JetBrains Mono ===" -ForegroundColor Cyan
DL "$JB/jetbrains-mono-latin-300-normal.woff2" "$FONTS\JetBrainsMono-Light.woff2"   "Light"
DL "$JB/jetbrains-mono-latin-400-normal.woff2" "$FONTS\JetBrainsMono-Regular.woff2" "Regular"
DL "$JB/jetbrains-mono-latin-700-normal.woff2" "$FONTS\JetBrainsMono-Bold.woff2"    "Bold"

Write-Host "`nDone! Files:" -ForegroundColor Green
Get-ChildItem $FONTS | Format-Table Name, @{N="KB";E={[math]::Round($_.Length/1KB,1)}}
