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
local teal = colors.teal
local grey_fg2 = colors.grey_fg2
local cyan = colors.cyan

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
    arg["fg"] = fgcol
    arg["bg"] = bgcol
    vim.api.nvim_set_hl(0, group, arg)
end

-- Toggle transparent / ui right here :D
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
    -- local light_grey = "#a9a9a9"
    fg("Comment", light_grey, { italic = true, bold = true })
    fg("DiagnosticHeader", "#2cb27f", { italic = true, bold = true })
    fg("GitSignsCurrentLineBlame", light_grey, { italic = true, bold = true })
    fg("CmpItemAbbr", white, { italic = true })
    fg_bg("TelescopePreviewTitle", black, green, { italic = true })
    fg_bg("TelescopePromptTitle", black, red, { italic = true })
    fg_bg("BufferlineBufferSelected", white, black, { italic = true, bold = true })
    fg_bg("BufferlineBufferVisible", light_grey, black2, { italic = true, bold = true })
    fg_bg("BufferlineDuplicateSelected", white, grey, { italic = true, bold = true })
    fg_bg("BufferlineDuplicateVisible", white, black2, { italic = true, bold = true })
else
    fg("Comment", light_grey, { bold = true })
    fg("DiagnosticHeader", "#2cb27f", { bold = true })
    fg("GitSignsCurrentLineBlame", light_grey, { bold = true })
    fg("CmpItemAbbr", white)
    fg_bg("TelescopePreviewTitle", black, green)
    fg_bg("TelescopePromptTitle", black, red)
    fg_bg("BufferlineBufferSelected", white, black, { bold = true })
    fg_bg("BufferlineBufferVisible", light_grey, black2, { bold = true })
    fg_bg("BufferlineDuplicateSelected", white, grey, { bold = true })
    fg_bg("BufferlineDuplicateVisible", white, black2, { bold = true })
end

if ui.transparency then
    -- bg("Normal", "none")
    fg_bg("Normal", "NONE", "none")
    bg("StatuslineNC", "NONE")
    fg_bg("BufferlineFill", grey_fg, "NONE")
    fg_bg("Folded", white, "NONE")
else
    fg_bg("StatusLineNC", "#15171c")
    fg_bg("BufferlineFill", grey_fg, darker_black)
    fg_bg("Folded", white, grey)
end

-----------------------------------
--           Basic               --
-----------------------------------
-- Line Number
fg("CursorLineNr", yellow)
fg("LineNr", light_grey)

-- Same as bg, so it doesn't appear
fg("EndOfBuffer", black)

-- For floating windows
-- fg("FloatBorder", blue)
bg("NormalFloat", darker_black)

-- testing
fg("FloatBorder", grey_fg)
fg("WinSeparator", blue)

-- Inactive statuslines as thin lines
fg("StatuslineNC", one_bg3)
fg("NvimInternalError", red)
fg("VertSplit", one_bg2)

-- Visual mode highlighting
fg("Visual", blue)

-----------------------------------
--           Plugins             --
-----------------------------------
-- Neorg
bg("NeorgCodeBlock", darker_black)

-- Bufferline
fg("BufferLineRightCustomAreaText1", red)

-- Lsp diagnostics
fg("DiagnosticHint", purple)
fg("DiagnosticError", red)
fg("DiagnosticWarn", yellow)
fg("DiagnosticInformation", green)

-- Pmenu
bg("Pmenu", black)
bg("PmenuSbar", one_bg)
bg("PmenuThumb", grey)
fg_bg("PmenuSel", black, pmenu_bg)

-- GitSigns
fg("GitSignsAdd", green)
fg("GitSignsChange", orange)
fg("GitSignsDelete", red)

-- Neotree
fg("NeoTreeDirectoryIcon", folder_bg)
fg("NeoTreeDirectoryName", folder_bg)
fg("NeoTreeRootName", red, { underline = true })
fg("NeoTreeDirectoryName", folder_bg)
fg("NeoTreeFileNameOpened", folder_bg)

-- CMP
fg("CmpItemAbbrDeprecated", "#808080", { strikethrough = true })

-- fg("CmpItemAbbrMatch", "#569CD6")
fg("CmpItemAbbrMatch", blue, { bold = true })
fg("CmpItemAbbrMatchFuzzy", "#569CD6")

fg("CmpItemKindVariable", yellow)
fg("CmpItemMenuInterface", "#9CDCFE")
fg("CmpItemMenuText", light_grey)

fg("CmpItemKindFunction", red)
fg("CmpItemKindMethod", red)

fg("CmpItemKindKeyword", orange)
fg("CmpItemKindProperty", orange)
fg("CmpItemKindUnit", orange)

fg("CmpItemKindFile", blue)
fg("CmpItemKindModule", blue)

fg("CmpItemKindSnippet", purple)

-- fg("CmpBorder", blue)
fg("CmpBorder", grey)
fg("CmpDocumentationWindowBorder", grey)

-- Telescope
bg("TelescopeNormal", darker_black)
bg("TelescopeSelection", black2)
fg_bg("TelescopeBorder", darker_black, darker_black)
fg_bg("TelescopePromptBorder", black2, black2)
fg_bg("TelescopePromptNormal", white, black2)
fg_bg("TelescopePromptPrefix", red, black2)
fg_bg("TelescopeResultsTitle", darker_black, darker_black)
bg("TelescopePreviewLine", light_grey)

-- Nvim-Tree
bg("NvimTreeNormal", darker_black)
bg("NvimTreeCursorLine", darker_black)
bg("NvimTreeNormalNC", darker_black)
fg("NvimTreeEmptyFolderName", folder_bg)
fg("NvimTreeFolderName", folder_bg)
fg("NvimTreeFolderIcon", folder_bg)
fg("NvimTreeOpenedFolderName", folder_bg)
fg("NvimTreeEndOfBuffer", darker_black)
fg("NvimTreeGitDirty", red)
fg("NvimTreeIndentMarker", grey_fg)
fg("NvimTreeRootFolder", red, { underline = true })
fg_bg("NvimTreeStatuslineNc", darker_black, darker_black)
fg_bg("NvimTreeVertSplit", darker_black, darker_black)
fg_bg("NvimTreeWindowPicker", black2, red)
