-- ExportDialog.lua
-- UI sections for the WebP export dialog

local LrView = import "LrView"

local ExportDialog = {}

function ExportDialog.sectionsForTopOfDialog(f, propertyTable)
    local bind = LrView.bind

    return {
        {
            title = "WebP Settings",
            synopsis = bind { key = "webp_quality", object = propertyTable },

            f:row {
                f:static_text {
                    title = "Quality:",
                    alignment = "right",
                    width = LrView.share "label_width",
                },
                f:slider {
                    value = bind "webp_quality",
                    min   = 1,
                    max   = 100,
                    width_in_chars = 20,
                },
                f:edit_field {
                    value = bind "webp_quality",
                    width_in_chars = 4,
                },
            },

            f:row {
                f:static_text {
                    title = "Preset:",
                    alignment = "right",
                    width = LrView.share "label_width",
                },
                f:popup_menu {
                    value = bind "webp_preset",
                    items = {
                        { title = "Default", value = "default" },
                        { title = "Photo",   value = "photo" },
                        { title = "Picture", value = "picture" },
                        { title = "Drawing", value = "drawing" },
                        { title = "Icon",    value = "icon" },
                        { title = "Text",    value = "text" },
                    },
                },
            },

            f:row {
                f:static_text {
                    title = "Method (0-6):",
                    alignment = "right",
                    width = LrView.share "label_width",
                },
                f:slider {
                    value = bind "webp_method",
                    min   = 0,
                    max   = 6,
                    integral = true,
                    width_in_chars = 10,
                },
                f:edit_field {
                    value = bind "webp_method",
                    width_in_chars = 3,
                },
            },

            f:row {
                f:static_text {
                    title = "Lossless:",
                    alignment = "right",
                    width = LrView.share "label_width",
                },
                f:checkbox {
                    value = bind "webp_lossless",
                    title = "Enable lossless compression",
                },
            },

            f:row {
                f:static_text {
                    title = "Metadata:",
                    alignment = "right",
                    width = LrView.share "label_width",
                },
                f:popup_menu {
                    value = bind "webp_metadata",
                    items = {
                        { title = "All",   value = "all" },
                        { title = "EXIF",  value = "exif" },
                        { title = "XMP",   value = "xmp" },
                        { title = "ICC",   value = "icc" },
                        { title = "None",  value = "none" },
                    },
                },
            },

            f:separator { fill_horizontal = 1 },

            f:row {
                f:static_text {
                    title = "Resize:",
                    alignment = "right",
                    width = LrView.share "label_width",
                },
                f:checkbox {
                    value = bind "webp_resize",
                    title = "Limit maximum dimensions",
                },
            },

            f:row {
                f:static_text {
                    title = "Max width (px):",
                    alignment = "right",
                    width = LrView.share "label_width",
                    enabled = bind "webp_resize",
                },
                f:edit_field {
                    value = bind "webp_max_width",
                    width_in_chars = 6,
                    enabled = bind "webp_resize",
                    min = 0,
                    max = 16383,
                    increment = 1,
                    precision = 0,
                },
                f:static_text {
                    title = "0 = auto (preserve aspect ratio)",
                    enabled = bind "webp_resize",
                },
            },

            f:row {
                f:static_text {
                    title = "Max height (px):",
                    alignment = "right",
                    width = LrView.share "label_width",
                    enabled = bind "webp_resize",
                },
                f:edit_field {
                    value = bind "webp_max_height",
                    width_in_chars = 6,
                    enabled = bind "webp_resize",
                    min = 0,
                    max = 16383,
                    increment = 1,
                    precision = 0,
                },
                f:static_text {
                    title = "0 = auto (preserve aspect ratio)",
                    enabled = bind "webp_resize",
                },
            },
        },
    }
end

return ExportDialog
