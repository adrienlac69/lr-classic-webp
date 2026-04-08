#!/bin/bash
set -euo pipefail

# Photo Toolbox WebP Export — Release v1.0.0
# Run this from the project root with gh authenticated

TAG="v1.0.0"
ZIP="photo-toolbox-webp-v1.0.0.zip"
CHECKSUM="checksum.txt"

echo "=== Step 1: Verify assets ==="
ls -lh "$ZIP" "$CHECKSUM"
sha256sum -c "$CHECKSUM"

echo ""
echo "=== Step 2: Create & push tag ==="
git tag -a "$TAG" -m "Photo Toolbox WebP Export v1.0.0

- cwebp 1.4.0 bundled (macOS arm64, Windows x64)
- Quality 0-100, lossless mode, presets, metadata
- Batch export with progress bar
- No external dependencies"

git push origin "$TAG"

echo ""
echo "=== Step 3: Create GitHub Release ==="
gh release create "$TAG" \
  "$ZIP" \
  "$CHECKSUM" \
  --title "Photo Toolbox WebP Export v1.0.0" \
  --notes "$(cat <<'EOF'
## Photo Toolbox — WebP Export Plugin v1.0.0

Export photos as WebP directly from Lightroom Classic.
No external dependencies — cwebp encoder bundled.

### Installation
1. Download the ZIP below
2. Unzip and add via LR Classic → File → Plug-in Manager → Add
3. Select 'WebP (Photo Toolbox)' in Export dialog

### Compatibility
- Lightroom Classic 6.0+
- macOS arm64 (Apple Silicon) + Windows x64
- cwebp 1.4.0 (Google libwebp)

### SHA256
See checksum.txt asset.

**Docs:** https://www.photo-toolbox.fr/lightroom-plugin
EOF
)"

echo ""
echo "=== Step 4: Verify ==="
gh release view "$TAG"

echo ""
echo "✅ Release v1.0.0 published!"
