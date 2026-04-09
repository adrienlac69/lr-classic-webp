# CLAUDE.md — Photo Toolbox WebP Export Plugin

## Goal
Lightroom Classic export plugin that converts photos to WebP format using bundled `cwebp` binaries. Supports lossy/lossless compression with full control over quality, preset, method, and metadata options.

## Stack
- **Language:** Lua 5.1 (Lightroom SDK runtime)
- **SDK:** Lightroom Classic SDK 14.x
- **Binary dependency:** `cwebp` 1.4.0 from libwebp (bundled per-platform)
  - macOS: arm64
  - Windows: x64
- **Plugin format:** `.lrdevplugin` (development) / `.lrplugin` (production)
- **Web:** Next.js + Tailwind (landing page in `site/`)

## Owner
Adrien Lacour / Photo Toolbox

## Current Milestone
**M2 IN PROGRESS — Photo Toolbox integration**

Done: Vercel hosting, update checker, resize in pixels
Next: output folder picker, file naming, batch progress, localization

## Binaries
- `cwebp` 1.4.0 bundled in `bin/mac/cwebp` and `bin/win/cwebp.exe`
- Downloaded from official Google libwebp releases

## Conventions
- Always use `local` for variables — no globals except LR SDK imports
- Use `LrTasks` for all async operations (file I/O, shell exec)
- Use `LrLogger("WebPExport")` for debug logging — log filenames only, never full paths
- Use `LrPathUtils` for all path manipulation (never raw string concat)
- Validate all user inputs against whitelists before shell concatenation
- Plugin identifier: `com.photo-toolbox.webp-export`
- Naming: `photo-toolbox-webp.lrdevplugin` (dev) → `photo-toolbox-webp.lrplugin` (prod)

## Project Structure
```
photo-toolbox-webp.lrdevplugin/
├── Info.lua                  # Plugin metadata & registration
├── ExportServiceProvider.lua # Export service entry point
├── ExportDialog.lua          # UI for export settings
├── WebPExporter.lua          # Core cwebp invocation logic + resize
├── JSON.lua                  # JSON decoder (rxi/json.lua, MIT)
├── bin/
│   ├── mac/cwebp             # macOS arm64 binary (cwebp 1.4.0)
│   └── win/cwebp.exe         # Windows x64 binary (cwebp 1.4.0)
├── resources/
│   └── icon.png              # Plugin icon (24x19)
└── strings/
    ├── en.lua                # English strings
    └── fr.lua                # French strings
```

## Distribution
- **Distribution method:** GitHub Releases only (no ZIP in repo)
- **Latest release:** [v1.0.0](https://github.com/adrienlac69/lr-classic-webp/releases/tag/v1.0.0)
- **Release workflow:** tag → `gh release create` with ZIP + checksum as assets

## Build & Test
- **Dev install:** Symlink or copy `.lrdevplugin` folder into LR Classic plugin directory
- **macOS:** `~/Library/Application Support/Adobe/Lightroom/Modules/`
- **Windows:** `%APPDATA%\Adobe\Lightroom\Modules\`
- **Logs:** Check `~/Library/Logs/Adobe/Lightroom/LrClassicLogs/` or LR plugin manager log
- **Lua syntax check:** `luac -p *.lua` (requires lua5.1)
- **Package release:** ZIP the `.lrplugin` folder, generate SHA256 checksum, upload via `gh release create`
