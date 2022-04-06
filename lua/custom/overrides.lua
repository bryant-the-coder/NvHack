local hl = vim.api.nvim_set_hl
local colors = require("core.utils").get()

-- Code from nvchad
local black = colors.black
local black2 = colors.black2
local blue = colors.blue
local darker_black = colors.darker_black
local folder_bg = colors.folder_bg
local green = colors.green
local grey = colors.grey
local grey_fg = colors.grey_fg
local light_grey = colors.light_grey
local line = colors.line
local nord_blue = colors.nord_blue
local one_bg = colors.one_bg
local one_bg2 = colors.one_bg2
local pmenu_bg = colors.pmenu_bg
local purple = colors.purple
local red = colors.red
local white = colors.white
local yellow = colors.yellow
local orange = colors.orange
local one_bg3 = colors.one_bg3

-- Define bg color
-- @param group Group
-- @param color Color
local function bg(group, color, args)
    local arg = {}
    if args then
        vim.tbl_extend("keep", arg, args)
    end
    arg["bg"] = color
    vim.api.nvim_set_hl(0, group, arg)
end

-- Define fg color
-- @param group Group
-- @param color Color
local function fg(group, color, args)
    local arg = {}
    if args then
        arg = args
    end
    arg["fg"] = color
    vim.api.nvim_set_hl(0, group, arg)
end

-- Define bg and fg color
-- @param group Group
-- @param fgcol Fg Color
-- @param bgcol Bg Color
local function fg_bg(group, fgcol, bgcol, args)
    local arg = {}
    if args then
        arg = args
    end
    arg["fg"] = bgcol
    arg["bg"] = fgcol
    vim.api.nvim_set_hl(0, group, arg)
end

-- Toggle transparency / ui right here :D
local ui = {
    transparency = false,
    italic = true,
}
hl(0, "StatusNormal", { fg = "#181a1f", bg = "#98c379" })
hl(0, "StatusReplace", { fg = "#181a1f", bg = "#E5C07B" })
hl(0, "StatusInsert", { fg = "#181a1f", bg = "#61AFEF" })
hl(0, "StatusCommand", { fg = "#181a1f", bg = "#56B6C2" })
hl(0, "StatusVisual", { fg = "#181a1f", bg = "#C678DD" })
hl(0, "StatusTerminal", { fg = "#181a1f", bg = "#E06C75" })
hl(0, "Filename", { fg = "#a9b1d6" })
hl(0, "Branch", { fg = "#181a1f", bg = "#ff69b4" })
hl(0, "Error", { fg = "#181a1f", bg = "#EE6D85", bold = true })
hl(0, "Warning", { fg = "#181a1f", bg = "#D7A65F", bold = true })
hl(0, "Clock", { fg = "#181a1f", bg = "#41a6b5" })

if ui.italic then
    fg("Comment", light_grey, { italic = true, bold = true })
    fg("DiagnosticHeader", "#2cb27f", { italic = true, bold = true })
    fg("GitSignsCurrentLineBlame", light_grey, { italic = true, bold = true })
    fg_bg("TelescopePreviewTitle", green, black, { italic = true })
    fg_bg("TelescopePromptTitle", red, black, { italic = true })
    fg("CmpItemAbbr", white, { italic = true })
else
    fg("Comment", light_grey, { bold = true })
    fg("DiagnosticHeader", "#2cb27f", { bold = true })
    fg("GitSignsCurrentLineBlame", light_grey, { bold = true })
    fg_bg("TelescopePreviewTitle", green, black)
    fg_bg("TelescopePromptTitle", red, black)
    fg("CmpItemAbbr", white)
end

if ui.transparency then
    bg("Normal", "none")
    hl(0, "StatuslineNC", { bg = "none" })
else
    hl(0, "StatusLineNC", { bg = "#15171c" })
end

-----------------------------------
--           Basic               --
-----------------------------------
-- Line Number
fg("cursorlinenr", grey)

-- Same as bg, so it doesn't appear
fg("EndOfBuffer", black)

-- For floating windows
-- fg("FloatBorder", blue)
bg("NormalFloat", darker_black)

-- testing
fg("FloatBorder", light_grey)
fg("WinSeparator", blue)

-- Inactive statuslines as thin lines
fg("StatuslineNC", one_bg3)
fg("LineNr", light_grey)
fg("NvimInternalError", red)
fg("VertSplit", one_bg2)

-- testing
fg("Visual", blue)

-----------------------------------
--           Plugins             --
-----------------------------------
-- Neorg
bg("NeorgCodeBlock", darker_black)

-- Lsp diagnostics
fg("DiagnosticHint", purple)
fg("DiagnosticError", red)
fg("DiagnosticWarn", yellow)
fg("DiagnosticInformation", green)

-- Pmenu
bg("Pmenu", one_bg)
bg("PmenuSbar", one_bg2)
bg("PmenuThumb", nord_blue)
bg("PmenuSel", pmenu_bg)

-- GitSigns
fg("GitSignsAdd", green)
fg("GitSignsChange", orange)
fg("GitSignsDelete", red)
fg("GitSignsCurrentLineBlame", light_grey, { italic = true, bold = true })

-- Neotree
fg("NeoTreeDirectoryIcon", folder_bg)
fg("NeoTreeDirectoryName", folder_bg)
fg("NeoTreeRootName", red, { underline = true })
fg("NeoTreeDirectoryName", folder_bg)
fg("NeoTreeFileNameOpened", folder_bg)

-- CMP
fg("CmpItemAbbrDeprecated", "#808080", { strikethrough = true })

fg("CmpItemAbbrMatch", "#569CD6")
fg("CmpItemAbbrMatchFuzzy", "#569CD6")

fg("CmpItemKindVariable", "#9CDCFE")
fg("CmpItemMenuInterface", "#9CDCFE")
fg("CmpItemMenuText", "#9CDCFE")

fg("CmpItemKindFunction", "#C586C0")
fg("CmpItemKindMethod", "#C586C0")

fg("CmpItemKindKeyword", "#D4D4D4")
fg("CmpItemKindProperty", "#D4D4D4")
fg("CmpItemKindUnit", "#D4D4D4")

fg("CmpCompletionWindowBorder", light_grey)
fg("CmpDocumentationWindowBorder", light_grey)

-- Telescope
bg("TelescopeNormal", darker_black)
bg("TelescopeSelection", black2)
fg_bg("TelescopeBorder", darker_black, darker_black)
fg_bg("TelescopePromptBorder", black2, black2)
fg_bg("TelescopePromptNormal", black2, white)
fg_bg("TelescopePromptPrefix", black2, red)
fg_bg("TelescopeResultsTitle", darker_black, darker_black)
bg("TelescopePreviewLine", "#353b45")

-- Nvim-Tree
bg("NvimTreeNormal", darker_black)
bg("NvimTreeNormalNC", darker_black)
fg("NvimTreeEmptyFolderName", folder_bg)
fg("NvimTreeFolderName", folder_bg)
fg("NvimTreeFolderIcon", folder_bg)
fg("NvimTreeOpenedFolderName", folder_bg)
fg("NvimTreeEndOfBuffer", darker_black)
fg("NvimTreeGitDirty", red)
fg("NvimTreeIndentMarker", one_bg2)
fg("NvimTreeRootFolder", red, { underline = true })
fg_bg("NvimTreeStatuslineNc", darker_black, darker_black)
fg_bg("NvimTreeVertSplit", darker_black, darker_black)
fg_bg("NvimTreeWindowPicker", red, black2)
