$BASE = Split-Path -Parent $MyInvocation.MyCommand.Path
$ok = 0; $fail = 0

function Check($path, $label) {
    $full = Join-Path $BASE $path
    if (Test-Path $full) {
        $kb = [math]::Round((Get-Item $full).Length / 1KB, 1)
        Write-Host "  [OK] $label ($kb KB)" -ForegroundColor Green
        $global:ok++
    } else {
        Write-Host "  [MISSING] $label  --> $path" -ForegroundColor Red
        $global:fail++
    }
}

Write-Host "`n=== JS Libraries ===" -ForegroundColor Cyan
Check "vendor\js\three.min.js"          "three.js r128"
Check "vendor\js\gsap.min.js"           "GSAP 3.12.5"
Check "vendor\js\ScrollTrigger.min.js"  "ScrollTrigger"
Check "vendor\js\ScrollToPlugin.min.js" "ScrollToPlugin"

Write-Host "`n=== Fonts ===" -ForegroundColor Cyan
Check "vendor\fonts\fonts.css"                  "fonts.css"
Check "vendor\fonts\Vazirmatn-ExtraLight.woff2" "Vazirmatn ExtraLight"
Check "vendor\fonts\Vazirmatn-Light.woff2"      "Vazirmatn Light"
Check "vendor\fonts\Vazirmatn-Regular.woff2"    "Vazirmatn Regular"
Check "vendor\fonts\Vazirmatn-Medium.woff2"     "Vazirmatn Medium"
Check "vendor\fonts\Vazirmatn-Bold.woff2"       "Vazirmatn Bold"
Check "vendor\fonts\Vazirmatn-Black.woff2"      "Vazirmatn Black"
Check "vendor\fonts\BebasNeue-Regular.woff2"    "Bebas Neue"
Check "vendor\fonts\JetBrainsMono-Light.woff2"  "JetBrains Mono Light"
Check "vendor\fonts\JetBrainsMono-Regular.woff2" "JetBrains Mono Regular"
Check "vendor\fonts\JetBrainsMono-Bold.woff2"   "JetBrains Mono Bold"

Write-Host "`n=== index.html CDN check ===" -ForegroundColor Cyan
$html = Get-Content "$BASE\index.html" -Raw
$cdnRefs = [regex]::Matches($html, 'https://(cdnjs|fonts\.googleapis|fonts\.gstatic)\.com[^\s"'']+')
if ($cdnRefs.Count -eq 0) {
    Write-Host "  [OK] No external CDN references found" -ForegroundColor Green
    $global:ok++
} else {
    Write-Host "  [WARN] Still has $($cdnRefs.Count) CDN reference(s):" -ForegroundColor Yellow
    $cdnRefs | ForEach-Object { Write-Host "    $_" -ForegroundColor Yellow }
    $global:fail++
}

Write-Host "`n=== Result ===" -ForegroundColor Cyan
if ($fail -eq 0) {
    Write-Host "  All $ok checks passed. Ready for offline use!" -ForegroundColor Green
} else {
    Write-Host "  $ok passed, $fail failed. Fix the issues above." -ForegroundColor Red
}
