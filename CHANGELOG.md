# Changelog

## [1.1.0] — 2026-04-09

### Added
- **Resize output in pixels:** max width / max height fields with aspect ratio preservation (0 = auto)
- **Update checker:** calls `www.photo-toolbox.fr/api/plugin/latest` on export dialog open, shows bezel notification when a newer version is available
- Silent on network errors (double `LrTasks.pcall`)
- Bundled `JSON.lua` (rxi/json.lua, MIT license) for JSON decoding

### Changed
- Plugin version bumped from 0.1.0 to 1.1.0 in `Info.lua`
- Production `.lrplugin` now synced with `.lrdevplugin` (includes JSON.lua + update checker + resize)

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
- Distribution via GitHub Releases (ZIP + SHA256 checksum)

### Security
- Input validation: preset and metadata values checked against whitelists
- Numeric ranges clamped: quality (0–100), method (0–6)
- Windows path handling: forward slashes converted to backslashes in `buildCommand()`
- Logger outputs filenames only (`LrPathUtils.leafName`), not full paths containing usernames
