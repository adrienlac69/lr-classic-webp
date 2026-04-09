-- ExportServiceProvider.lua
-- Main export service provider for WebP export plugin

local LrView    = import "LrView"
local LrLogger  = import "LrLogger"
local LrTasks   = import "LrTasks"
local LrHttp    = import "LrHttp"
local LrDialogs = import "LrDialogs"

local logger = LrLogger("WebPExport")
logger:enable("logfile")

local ExportDialog = require "ExportDialog"
local WebPExporter = require "WebPExporter"
local json         = require "JSON"

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
    { key = "webp_resize",     default = false },
    { key = "webp_max_width",  default = 0 },
    { key = "webp_max_height", default = 0 },
}

function exportServiceProvider.startDialog(props)
    -- Update checker (silent on network errors)
    LrTasks.startAsyncTask(function()
        local ok, body = LrTasks.pcall(function()
            local result, _ = LrHttp.get(
                "https://www.photo-toolbox.fr/api/plugin/latest"
            )
            return result
        end)
        if ok and body then
            local parsed_ok, data = LrTasks.pcall(function()
                return json.decode(body)
            end)
            if parsed_ok and data and data.version then
                local current = "1.1.0"
                if data.version ~= current then
                    LrDialogs.showBezel(
                        "Photo Toolbox WebP v" .. data.version
                        .. " available \xe2\x80\x94 www.photo-toolbox.fr",
                        4
                    )
                end
            end
        end
    end)
end

function exportServiceProvider.sectionsForTopOfDialog(f, propertyTable)
    return ExportDialog.sectionsForTopOfDialog(f, propertyTable)
end

function exportServiceProvider.processRenderedPhotos(functionContext, exportContext)
    return WebPExporter.processRenderedPhotos(functionContext, exportContext)
end

return exportServiceProvider
