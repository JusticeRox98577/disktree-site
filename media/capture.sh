#!/bin/bash
# Captures all media HTML files as PNGs using Chrome headless.
# Run from the website/media/ directory:  bash capture.sh

CHROME="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
DIR="$(cd "$(dirname "$0")" && pwd)"
OUT="$DIR/png"
mkdir -p "$OUT"

capture() {
  local file="$1" size="$2" out="$3"
  echo "→ Capturing $out ($size)…"
  "$CHROME" \
    --headless=new \
    --screenshot="$OUT/$out" \
    --window-size="$size" \
    --hide-scrollbars \
    --disable-gpu \
    --no-sandbox \
    "file://$DIR/$file" 2>/dev/null
  echo "  ✓ Saved to png/$out"
}

capture "og-image.html"           "1200,630"  "og-image.png"
capture "product-hero.html"       "1600,900"  "product-hero.png"
capture "screenshot-diagnosis.html" "1440,900" "screenshot-diagnosis.png"

echo ""
echo "All done — PNG files are in website/media/png/"
echo ""
echo "Use these as:"
echo "  og-image.png          → <meta property=\"og:image\"> on the website"
echo "  product-hero.png      → Lemon Squeezy product thumbnail / gallery image 1"
echo "  screenshot-diagnosis.png → Lemon Squeezy gallery image 2"
