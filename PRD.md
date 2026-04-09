# PRD — Photo Toolbox WebP Export Plugin

## Overview
A Lightroom Classic plugin that adds native WebP export capability by bundling the `cwebp` encoder. Photographers can export directly to WebP without leaving Lightroom, with full control over compression settings.

## Target Users
- Photographers using Lightroom Classic who need WebP output for web delivery
- Studios automating export workflows

## Milestones

### M1 — Core Export Functionality ✓ COMPLETE
- [x] Plugin scaffold and Info.lua registration
- [x] Export dialog with quality, preset, method, lossless, metadata controls
- [x] Bundle cwebp 1.4.0 binaries (macOS arm64 + Windows x64)
- [x] Working export: LR renders TIFF/JPEG → plugin converts to WebP via cwebp
- [x] Progress bar with cancel support
- [x] Error handling: conversion failure with error codes
- [x] Security: input validation (whitelist presets/metadata, clamp numeric ranges)
- [x] Security: log filenames only (no full paths with PII)
- [x] Packaging: .lrplugin production build + ZIP distribution + SHA256 checksum
- [x] Landing page at /lightroom-plugin with download CTA
- [x] INSTALL.md with setup and troubleshooting guide

### M2 — Photo Toolbox Integration
- [x] Host ZIP download on Vercel (www.photo-toolbox.fr)
- [x] Update checker via `/api/plugin/latest` (silent on network errors)
- [x] Resize output in pixels (max width/height via cwebp `-resize`, aspect ratio preserved)
- [ ] Output folder picker (export to custom location)
- [ ] File naming template support
- [ ] Batch progress: per-file status in progress bar
- [ ] Localization: complete French translation
- [ ] Plugin icon (proper branded asset)

### M3 — Advanced & Distribution
- [ ] AVIF export support (via `avifenc`)
- [ ] Auto-update mechanism for cwebp binaries
- [ ] Publish Service integration (re-export on change)
- [ ] Code-signing for macOS (notarization)
- [ ] Marketing page on Photo Toolbox site

## Technical Constraints
- Lightroom SDK uses Lua 5.1 — no `goto`, limited standard library
- Binary must be bundled (users won't install cwebp separately)
- macOS Gatekeeper requires signed/notarized binaries or `xattr -cr` workaround
- Export pipeline: LR renders intermediate file → plugin converts → intermediate deleted

## Success Metrics
- Export 100 photos to WebP without errors
- File size reduction vs JPEG at equivalent visual quality
- Plugin installs without manual binary configuration
