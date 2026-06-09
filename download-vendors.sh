#!/bin/bash
# اسکریپت دانلود کتابخونه‌ها برای آفلاین کردن پرتفولیو
# یه بار اجرا کن، بعد نیازی به اینترنت نیست

set -e
BASE="$(cd "$(dirname "$0")" && pwd)"
JS_DIR="$BASE/vendor/js"
FONTS_DIR="$BASE/vendor/fonts"

mkdir -p "$JS_DIR" "$FONTS_DIR"

echo "📦 دانلود کتابخونه‌های JS..."

curl -L "https://cdnjs.cloudflare.com/ajax/libs/three.js/r128/three.min.js" \
  -o "$JS_DIR/three.min.js" && echo "  ✅ three.js r128"

curl -L "https://cdnjs.cloudflare.com/ajax/libs/gsap/3.12.5/gsap.min.js" \
  -o "$JS_DIR/gsap.min.js" && echo "  ✅ gsap 3.12.5"

curl -L "https://cdnjs.cloudflare.com/ajax/libs/gsap/3.12.5/ScrollTrigger.min.js" \
  -o "$JS_DIR/ScrollTrigger.min.js" && echo "  ✅ ScrollTrigger"

curl -L "https://cdnjs.cloudflare.com/ajax/libs/gsap/3.12.5/ScrollToPlugin.min.js" \
  -o "$JS_DIR/ScrollToPlugin.min.js" && echo "  ✅ ScrollToPlugin"

echo ""
echo "🔤 دانلود فونت‌ها..."

# Vazirmatn
curl -L "https://fonts.gstatic.com/s/vazirmatn/v13/Dxx78j6PP2D_kU2muiDECzBVmg.woff2" \
  -o "$FONTS_DIR/Vazirmatn-Regular.woff2" && echo "  ✅ Vazirmatn Regular"

curl -L "https://fonts.gstatic.com/s/vazirmatn/v13/Dxx68j6PP2D_kU2muiDECzCCmg.woff2" \
  -o "$FONTS_DIR/Vazirmatn-Bold.woff2" && echo "  ✅ Vazirmatn Bold"

curl -L "https://fonts.gstatic.com/s/vazirmatn/v13/Dxx48j6PP2D_kU2muiDECzAhmg.woff2" \
  -o "$FONTS_DIR/Vazirmatn-Light.woff2" && echo "  ✅ Vazirmatn Light"

curl -L "https://fonts.gstatic.com/s/vazirmatn/v13/Dxx28j6PP2D_kU2muiDECzAhmg.woff2" \
  -o "$FONTS_DIR/Vazirmatn-ExtraLight.woff2" && echo "  ✅ Vazirmatn ExtraLight"

curl -L "https://fonts.gstatic.com/s/vazirmatn/v13/Dxx58j6PP2D_kU2muiDECzBsmg.woff2" \
  -o "$FONTS_DIR/Vazirmatn-Medium.woff2" && echo "  ✅ Vazirmatn Medium"

curl -L "https://fonts.gstatic.com/s/vazirmatn/v13/Dxx18j6PP2D_kU2muiDECzA5mg.woff2" \
  -o "$FONTS_DIR/Vazirmatn-Black.woff2" && echo "  ✅ Vazirmatn Black"

# Bebas Neue
curl -L "https://fonts.gstatic.com/s/bebasnuebold/v1/JTUSjIg69CK48gW7PXooan_5CjvQs.woff2" \
  -o "$FONTS_DIR/BebasNeue-Regular.woff2" && echo "  ✅ Bebas Neue"

# JetBrains Mono
curl -L "https://fonts.gstatic.com/s/jetbrainsmono/v18/tDbY2o-flEEny0FZhsfKu5WU4zr3E_BX0PnT8RD8yKxTOlOV.woff2" \
  -o "$FONTS_DIR/JetBrainsMono-Regular.woff2" && echo "  ✅ JetBrains Mono Regular"

curl -L "https://fonts.gstatic.com/s/jetbrainsmono/v18/tDbY2o-flEEny0FZhsfKu5WU4zr3E_BX0PnT8RD8aaxTOlOV.woff2" \
  -o "$FONTS_DIR/JetBrainsMono-Light.woff2" && echo "  ✅ JetBrains Mono Light"

curl -L "https://fonts.gstatic.com/s/jetbrainsmono/v18/tDbY2o-flEEny0FZhsfKu5WU4zr3E_BX0PnT8RD8sqxTOlOV.woff2" \
  -o "$FONTS_DIR/JetBrainsMono-Bold.woff2" && echo "  ✅ JetBrains Mono Bold"

echo ""
echo "✅ همه فایل‌ها دانلود شدن!"
echo "📁 JS: $JS_DIR"
echo "📁 Fonts: $FONTS_DIR"
