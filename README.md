# Photo Toolbox WebP Export — Lightroom Classic Plugin

Export your photos directly to **WebP** format from Adobe Lightroom Classic. Free, open-source, no setup required.

> **Download:** [photo-toolbox.vercel.app/lightroom-plugin](https://photo-toolbox.vercel.app/lightroom-plugin)

## Features

- **Lossy & lossless** WebP compression via bundled `cwebp` 1.4.0
- Quality slider (0–100), preset selection (photo, drawing, icon, text)
- Compression method control (0–6: speed vs size tradeoff)
- Metadata preservation: EXIF, XMP, ICC profiles, or strip all
- Batch export with progress bar and cancel support
- macOS Apple Silicon and Windows 10/11 x64

## Export Dialog

<!-- TODO: Replace with actual screenshot -->
```
┌─ WebP Settings ──────────────────────────────┐
│ Quality:    [====████████░░░░░] 80  [80]     │
│ Preset:     [Photo          ▾]               │
│ Method:     [====████░░] 4       [4]         │
│ Lossless:   [ ] Enable lossless compression  │
│ Metadata:   [All            ▾]               │
└──────────────────────────────────────────────┘
```

## Installation

1. [Download the ZIP](https://photo-toolbox.vercel.app/lightroom-plugin) and extract it
2. In Lightroom Classic: **File → Plug-in Manager → Add**
3. Select the `photo-toolbox-webp.lrplugin` folder
4. Export via **File → Export** → choose **WebP (Photo Toolbox)**

See [INSTALL.md](INSTALL.md) for detailed instructions and troubleshooting.

## Development

```bash
# macOS — symlink dev plugin
ln -s "$(pwd)/photo-toolbox-webp.lrdevplugin" \
  ~/Library/Application\ Support/Adobe/Lightroom/Modules/

# Windows (admin cmd)
mklink /D "%APPDATA%\Adobe\Lightroom\Modules\photo-toolbox-webp.lrdevplugin" "%CD%\photo-toolbox-webp.lrdevplugin"

# Check Lua syntax
luac -p photo-toolbox-webp.lrdevplugin/*.lua
```

## Project Structure

```
photo-toolbox-webp.lrdevplugin/
├── Info.lua                  # Plugin metadata
├── ExportServiceProvider.lua # Export service entry point
├── ExportDialog.lua          # Settings UI
├── WebPExporter.lua          # cwebp invocation
├── bin/
│   ├── mac/cwebp             # macOS arm64 (cwebp 1.4.0)
│   └── win/cwebp.exe         # Windows x64 (cwebp 1.4.0)
├── resources/icon.png
└── strings/{en,fr}.lua
```

## License

MIT
