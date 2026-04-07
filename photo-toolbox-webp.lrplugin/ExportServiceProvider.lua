-- ExportServiceProvider.lua
-- Main export service provider for WebP export plugin

local LrView   = import "LrView"
local LrLogger = import "LrLogger"

local logger = LrLogger("WebPExport")
logger:enable("logfile")

local ExportDialog = require "ExportDialog"
local WebPExporter = require "WebPExporter"

local exportServiceProvider = {}

exportServiceProvider.allowFileFormats        = nil
exportServiceProvider.allowColorSpaces        = nil
exportServiceProvider.hideSections            = { "fileNaming", "fileSettings", "imageSettings" }
exportServiceProvider.canExportVideo          = false
exportServiceProvider.exportPresetFields      = {
    { key = "webp_quality",    default = 80 },
    { key = "webp_preset",     default = "photo" },
    { key = "webp_method",     default = 4 },
    { key = "webp_lossless",   default = false },
    { key = "webp_metadata",   default = "all" },
}

function exportServiceProvider.sectionsForTopOfDialog(f, propertyTable)
    return ExportDialog.sectionsForTopOfDialog(f, propertyTable)
end

function exportServiceProvider.processRenderedPhotos(functionContext, exportContext)
    return WebPExporter.processRenderedPhotos(functionContext, exportContext)
end

return exportServiceProvider
