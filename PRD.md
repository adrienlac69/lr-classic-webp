# PRD — Photo Toolbox WebP Export Plugin

## Overview
A Lightroom Classic plugin that adds native WebP export capability by bundling the `cwebp` encoder. Photographers can export directly to WebP without leaving Lightroom, with full control over compression settings.

## Target Users
- Photographers using Lightroom Classic who need WebP output for web delivery
- Studios automating export workflows

## Milestones

### M1 — Core Export Functionality
- [x] Plugin scaffold and Info.lua registration
- [x] Export dialog with quality, preset, method, lossless, metadata controls
- [ ] Bundle cwebp binaries (macOS arm64/x86_64 + Windows x64)
- [ ] Working export: LR renders TIFF/JPEG → plugin converts to WebP via cwebp
- [ ] Progress bar with cancel support
- [ ] Error handling: missing binary, conversion failure, disk full

### M2 — Polish & UX
- [ ] Resize options (max dimension, percentage) passed to cwebp
- [ ] Output folder picker (export to custom location)
- [ ] File naming template support
- [ ] Batch progress: per-file status in progress bar
- [ ] Localization: complete French translation
- [ ] Plugin icon (proper branded asset)

### M3 — Advanced & Distribution
- [ ] Auto-update mechanism for cwebp binaries
- [ ] AVIF export support (via `avifenc`)
- [ ] Publish Service integration (re-export on change)
- [ ] `.lrplugin` packaging script for distribution
- [ ] Code-signing for macOS (notarization)
- [ ] Documentation & landing page

## Technical Constraints
- Lightroom SDK uses Lua 5.1 — no `goto`, limited standard library
- Binary must be bundled (users won't install cwebp separately)
- macOS Gatekeeper requires signed/notarized binaries or `xattr -cr` workaround
- Export pipeline: LR renders intermediate file → plugin converts → intermediate deleted

## Success Metrics
- Export 100 photos to WebP without errors
- File size reduction vs JPEG at equivalent visual quality
- Plugin installs without manual binary configuration
