# CLAUDE.md — Photo Toolbox WebP Export Plugin

## Goal
Lightroom Classic export plugin that converts photos to WebP format using bundled `cwebp` binaries. Supports lossy/lossless compression with full control over quality, preset, method, and metadata options.

## Stack
- **Language:** Lua 5.1 (Lightroom SDK runtime)
- **SDK:** Lightroom Classic SDK 14.x
- **Binary dependency:** `cwebp` from libwebp (bundled per-platform)
  - macOS: arm64 + x86_64 (universal or separate)
  - Windows: x64
- **Plugin format:** `.lrdevplugin` (development) / `.lrplugin` (production)

## Owner
Adrien Lacour / Photo Toolbox

## Current Milestone
**M1 — Core export functionality**

## Conventions
- Always use `local` for variables — no globals except LR SDK imports
- Use `LrTasks` for all async operations (file I/O, shell exec)
- Use `LrLogger("WebPExport")` for debug logging
- Use `LrPathUtils` for all path manipulation (never raw string concat)
- Plugin identifier: `com.photo-toolbox.webp-export`
- Naming: `photo-toolbox-webp.lrdevplugin` (dev) → `photo-toolbox-webp.lrplugin` (prod)

## Project Structure
```
photo-toolbox-webp.lrdevplugin/
├── Info.lua                  # Plugin metadata & registration
├── ExportServiceProvider.lua # Export service entry point
├── ExportDialog.lua          # UI for export settings
├── WebPExporter.lua          # Core cwebp invocation logic
├── bin/
│   ├── mac/cwebp             # macOS binary (added at build)
│   └── win/cwebp.exe         # Windows binary (added at build)
├── resources/
│   └── icon.png              # Plugin icon (24x19)
└── strings/
    ├── en.lua                # English strings
    └── fr.lua                # French strings
```

## Build & Test
- **Dev install:** Symlink or copy `.lrdevplugin` folder into LR Classic plugin directory
- **macOS:** `~/Library/Application Support/Adobe/Lightroom/Modules/`
- **Windows:** `%APPDATA%\Adobe\Lightroom\Modules\`
- **Logs:** Check `~/Documents/LrClassicLogs/` or LR plugin manager log
