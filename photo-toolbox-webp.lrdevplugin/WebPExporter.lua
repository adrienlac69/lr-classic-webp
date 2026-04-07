-- WebPExporter.lua
-- Core conversion logic: calls cwebp binary to produce WebP files

local LrTasks       = import "LrTasks"
local LrFileUtils   = import "LrFileUtils"
local LrPathUtils   = import "LrPathUtils"
local LrLogger      = import "LrLogger"
local LrDialogs     = import "LrDialogs"
local LrStringUtils = import "LrStringUtils"

local logger = LrLogger("WebPExport")
logger:enable("logfile")

local WebPExporter = {}

--- Resolve the platform-specific path to the bundled cwebp binary.
-- @return string path to cwebp executable
local function getCwebpPath()
    local pluginDir = _PLUGIN.path
    local binDir    = LrPathUtils.child(pluginDir, "bin")

    if WIN_ENV then
        return LrPathUtils.child(LrPathUtils.child(binDir, "win"), "cwebp.exe")
    else
        return LrPathUtils.child(LrPathUtils.child(binDir, "mac"), "cwebp")
    end
end

--- Build the cwebp command-line arguments from export settings.
-- @param srcPath   string  source image file (TIFF/JPEG from LR)
-- @param dstPath   string  destination .webp file
-- @param settings  table   export preset fields
-- @return string   shell command to execute
local function buildCommand(srcPath, dstPath, settings)
    local cwebp = getCwebpPath()
    local args  = {}

    if settings.webp_lossless then
        args[#args + 1] = "-lossless"
    else
        args[#args + 1] = "-q " .. tostring(settings.webp_quality)
    end

    args[#args + 1] = "-preset " .. settings.webp_preset
    args[#args + 1] = "-m " .. tostring(settings.webp_method)

    if settings.webp_metadata ~= "none" then
        args[#args + 1] = "-metadata " .. settings.webp_metadata
    end

    args[#args + 1] = '"' .. srcPath .. '"'
    args[#args + 1] = "-o"
    args[#args + 1] = '"' .. dstPath .. '"'

    if WIN_ENV then
        return '"' .. cwebp .. '" ' .. table.concat(args, " ")
    else
        return '"' .. cwebp .. '" ' .. table.concat(args, " ")
    end
end

--- Process all rendered photos from Lightroom and convert them to WebP.
function WebPExporter.processRenderedPhotos(functionContext, exportContext)
    local exportSession  = exportContext.exportSession
    local nPhotos        = exportSession:countRenditions()
    local progressScope  = exportContext:configureProgress {
        title = nPhotos > 1
            and LOC("$$$/WebP/Export/Progress=Converting ^1 photos to WebP", nPhotos)
            or  LOC("$$$/WebP/Export/ProgressOne=Converting 1 photo to WebP"),
    }

    for i, rendition in exportContext:renditions { stopIfCanceled = true } do
        progressScope:setPortionComplete(i - 1, nPhotos)

        local success, pathOrMessage = rendition:waitForRender()
        if not success then
            rendition:renditionIsDone(false, pathOrMessage)
        else
            local srcPath = pathOrMessage
            local dstDir  = LrPathUtils.parent(srcPath)
            local dstName = LrPathUtils.removeExtension(LrPathUtils.leafName(srcPath)) .. ".webp"
            local dstPath = LrPathUtils.child(dstDir, dstName)

            local cmd    = buildCommand(srcPath, dstPath, exportContext.propertyTable)
            local result = LrTasks.execute(cmd)

            if result ~= 0 then
                logger:error("cwebp failed with code " .. tostring(result) .. " for " .. srcPath)
                rendition:renditionIsDone(false, "WebP conversion failed (code " .. tostring(result) .. ")")
            else
                -- Remove the intermediate file (TIFF/JPEG) from LR
                LrFileUtils.delete(srcPath)
                rendition:renditionIsDone(true, dstPath)
                logger:info("Converted: " .. dstPath)
            end
        end

        progressScope:setPortionComplete(i, nPhotos)
    end
end

return WebPExporter
