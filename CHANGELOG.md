# Changelog

## [Unreleased]

### Added
- Update checker: calls `photo-toolbox.vercel.app/api/plugin/latest` on export dialog open
- Shows Lightroom bezel notification when a newer version is available
- Silent on network errors (double `LrTasks.pcall`)
- Bundled `JSON.lua` (rxi/json.lua, MIT license) for JSON decoding

## [1.0.0] — 2026-04-07 — M1 Core Export Plugin

### Added
- `Info.lua` — plugin registration (SDK 14.x, min 6.0, identifier `com.photo-toolbox.webp-export`)
- `ExportServiceProvider.lua` — export service with 5 preset fields (quality, preset, method, lossless, metadata)
- `ExportDialog.lua` — full UI with slider, popup menus, checkbox for all export options
- `WebPExporter.lua` — core conversion engine calling bundled cwebp binary
- cwebp 1.4.0 binaries: macOS arm64 (2.5 MB) + Windows x64 (726 KB)
- Localization strings: English and French
- Progress bar with cancel support during batch export
- Landing page at `/lightroom-plugin` with download CTA and feature grid
- `INSTALL.md` with setup instructions and troubleshooting guide
- Distribution ZIP (`photo-toolbox-webp-v1.0.0.zip`) with SHA256 checksum

### Security
- Input validation: preset and metadata values checked against whitelists
- Numeric ranges clamped: quality (0–100), method (0–6)
- Windows path handling: forward slashes converted to backslashes in `buildCommand()`
- Logger outputs filenames only (`LrPathUtils.leafName`), not full paths containing usernames
