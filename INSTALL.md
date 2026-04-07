# Installation Guide — Photo Toolbox WebP Export Plugin

## Requirements

- Adobe Lightroom Classic **6.0** or later
- macOS (Apple Silicon or Intel) or Windows 10/11 (64-bit)

## Install the Plugin

1. **Download** the latest release from [photo-toolbox.vercel.app](https://photo-toolbox.vercel.app/lightroom-plugin) and unzip it.
2. Open Lightroom Classic.
3. Go to **File → Plug-in Manager**.
4. Click **Add** and select the `photo-toolbox-webp.lrplugin` folder (or `.lrdevplugin` for the development version).
5. The plugin appears in the list with a green status indicator.
6. Close the Plug-in Manager.

## Export to WebP

1. Select photos in your Library or Develop module.
2. **File → Export** (or `Ctrl+Shift+E` / `Cmd+Shift+E`).
3. In the Export dialog, choose **WebP (Photo Toolbox)** at the top.
4. Configure your settings:
   - **Quality** (1–100): lossy compression level
   - **Lossless**: check for lossless compression
   - **Preset**: photo, drawing, icon, text, etc.
   - **Method** (0–6): higher = slower but smaller files
   - **Metadata**: all, EXIF, XMP, ICC, or none
5. Choose your export destination and click **Export**.

## Troubleshooting

### Check Plugin Logs

- **macOS:** `~/Library/Logs/Adobe/Lightroom/LrClassicLogs/`
- **Windows:** `%APPDATA%\Adobe\Lightroom\Logs\`

Look for lines from `WebPExport` logger.

### macOS Gatekeeper Warning

If macOS blocks the bundled `cwebp` binary:

```bash
xattr -cr ~/Library/Application\ Support/Adobe/Lightroom/Modules/photo-toolbox-webp.lrplugin
```

Then restart Lightroom.

### Plugin Not Showing in Export

- Verify the plugin status is green in Plug-in Manager
- Make sure you selected the `.lrplugin` or `.lrdevplugin` **folder**, not a file inside it
- Restart Lightroom Classic

## Links

- Plugin page: [photo-toolbox.vercel.app/lightroom-plugin](https://photo-toolbox.vercel.app/lightroom-plugin)
- Source: [github.com/adrienlac69/lr-classic-webp](https://github.com/adrienlac69/lr-classic-webp)
