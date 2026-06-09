# اسکریپت دانلود کتابخونه‌ها برای ویندوز
$BASE = Split-Path -Parent $MyInvocation.MyCommand.Path
$JS = "$BASE\vendor\js"
$FONTS = "$BASE\vendor\fonts"

New-Item -ItemType Directory -Force -Path $JS | Out-Null
New-Item -ItemType Directory -Force -Path $FONTS | Out-Null

$client = New-Object System.Net.WebClient

function DL($url, $dest, $label) {
    Write-Host "  Downloading $label..." -NoNewline
    try {
        $client.DownloadFile($url, $dest)
        Write-Host " OK" -ForegroundColor Green
    } catch {
        Write-Host " FAILED: $_" -ForegroundColor Red
    }
}

Write-Host "`n=== JS Libraries ===" -ForegroundColor Cyan
DL "https://cdnjs.cloudflare.com/ajax/libs/three.js/r128/three.min.js"           "$JS\three.min.js"           "three.js r128"
DL "https://cdnjs.cloudflare.com/ajax/libs/gsap/3.12.5/gsap.min.js"              "$JS\gsap.min.js"             "gsap 3.12.5"
DL "https://cdnjs.cloudflare.com/ajax/libs/gsap/3.12.5/ScrollTrigger.min.js"     "$JS\ScrollTrigger.min.js"    "ScrollTrigger"
DL "https://cdnjs.cloudflare.com/ajax/libs/gsap/3.12.5/ScrollToPlugin.min.js"    "$JS\ScrollToPlugin.min.js"   "ScrollToPlugin"

Write-Host "`n=== Fonts ===" -ForegroundColor Cyan
DL "https://fonts.gstatic.com/s/vazirmatn/v13/Dxx78j6PP2D_kU2muiDECzBVmg.woff2"                                                        "$FONTS\Vazirmatn-Regular.woff2"     "Vazirmatn Regular"
DL "https://fonts.gstatic.com/s/vazirmatn/v13/Dxx68j6PP2D_kU2muiDECzCCmg.woff2"                                                        "$FONTS\Vazirmatn-Bold.woff2"        "Vazirmatn Bold"
DL "https://fonts.gstatic.com/s/vazirmatn/v13/Dxx48j6PP2D_kU2muiDECzAhmg.woff2"                                                        "$FONTS\Vazirmatn-Light.woff2"       "Vazirmatn Light"
DL "https://fonts.gstatic.com/s/vazirmatn/v13/Dxx28j6PP2D_kU2muiDECzAhmg.woff2"                                                        "$FONTS\Vazirmatn-ExtraLight.woff2"  "Vazirmatn ExtraLight"
DL "https://fonts.gstatic.com/s/vazirmatn/v13/Dxx58j6PP2D_kU2muiDECzBsmg.woff2"                                                        "$FONTS\Vazirmatn-Medium.woff2"      "Vazirmatn Medium"
DL "https://fonts.gstatic.com/s/vazirmatn/v13/Dxx18j6PP2D_kU2muiDECzA5mg.woff2"                                                        "$FONTS\Vazirmatn-Black.woff2"       "Vazirmatn Black"
DL "https://fonts.gstatic.com/s/bebasnue/v10/JTUSjIg69CK48gW7PXooan_5CjvQs.woff2"                                                      "$FONTS\BebasNeue-Regular.woff2"     "Bebas Neue"
DL "https://fonts.gstatic.com/s/jetbrainsmono/v18/tDbY2o-flEEny0FZhsfKu5WU4zr3E_BX0PnT8RD8yKxTOlOV.woff2"                              "$FONTS\JetBrainsMono-Regular.woff2" "JetBrains Mono Regular"
DL "https://fonts.gstatic.com/s/jetbrainsmono/v18/tDbY2o-flEEny0FZhsfKu5WU4zr3E_BX0PnT8RD8aaxTOlOV.woff2"                              "$FONTS\JetBrainsMono-Light.woff2"   "JetBrains Mono Light"
DL "https://fonts.gstatic.com/s/jetbrainsmono/v18/tDbY2o-flEEny0FZhsfKu5WU4zr3E_BX0PnT8RD8sqxTOlOV.woff2"                              "$FONTS\JetBrainsMono-Bold.woff2"    "JetBrains Mono Bold"

Write-Host "`nDone! Check vendor\ folder." -ForegroundColor Green
