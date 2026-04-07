# Photo Toolbox WebP Export — Lightroom Classic Plugin

Export your photos directly to **WebP** format from Adobe Lightroom Classic.

## Features

- **Lossy & lossless** WebP compression
- Quality slider (1–100), preset selection, compression method control
- Metadata preservation options (EXIF, XMP, ICC, all, none)
- Bundled `cwebp` binaries — no external dependencies
- macOS (Apple Silicon + Intel) and Windows support

## Installation

1. Download the latest release (`.lrplugin` folder)
2. In Lightroom Classic: **File → Plugin Manager → Add**
3. Select the `photo-toolbox-webp.lrplugin` folder
4. The "WebP Export" option appears in **File → Export**

## Development

The `.lrdevplugin` folder is the development version. To install for development:

```bash
# macOS
ln -s "$(pwd)/photo-toolbox-webp.lrdevplugin" \
  ~/Library/Application\ Support/Adobe/Lightroom/Modules/

# Windows (admin cmd)
mklink /D "%APPDATA%\Adobe\Lightroom\Modules\photo-toolbox-webp.lrdevplugin" "%CD%\photo-toolbox-webp.lrdevplugin"
```

## License

MIT
