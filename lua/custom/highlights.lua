local fg = require("core.utils").fg
local bg = require("core.utils").bg
local fg_bg = require("core.utils").fg_bg
local colors = require("hl_themes.gruvchad")

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

bg("StatusInactive", line)
bg("StatusLineNC", darker_black)
fg_bg("StatusNormal", darker_black, green)
fg_bg("StatusReplace", darker_black, blue)
fg_bg("StatusInsert", darker_black, yellow)
fg_bg("StatusCommand", darker_black, purple)
fg_bg("StatusVisual", darker_black, purple)
fg_bg("StatusTerminal", darker_black, red)
fg_bg("FileName", darker_black, red)
fg_bg("Branch", darker_black, nord_blue)

-----------------------------------
--           Basic               --
-----------------------------------
-- Line number
fg("cursorlinenr", white)

-- same it bg, so it doesn't appear
fg("EndOfBuffer", black)

-- For floating windows
fg("FloatBorder", blue)
bg("NormalFloat", darker_black)

-- inactive statuslines as thin lines
fg("StatusLineNC", one_bg3 .. " gui=underline")

fg("LineNr", grey)
fg("NvimInternalError", red)
fg("VertSplit", one_bg2)

fg("Comment", light_grey .. " gui=italic")

-----------------------------------
--           Plugins             --
-----------------------------------
-- Lsp diagnostics
fg("DiagnosticHint", purple)
fg("DiagnosticError", red)
fg("DiagnosticWarn", yellow)
fg("DiagnosticInformation", green)

-- Pmenu
bg("Pmenu", one_bg)
bg("PmenuSbar", one_bg2)
bg("PmenuSel", pmenu_bg)
bg("PmenuThumb", nord_blue)
fg("CmpItemAbbr", white)
fg("CmpItemAbbrMatch", white)
fg("CmpItemKind", white)
fg("CmpItemMenu", white)

-- Telescope
bg("TelescopeNormal", darker_black)
bg("TelescopeSelection", black2)
fg_bg("TelescopeBorder", darker_black, darker_black)
fg_bg("TelescopePromptBorder", black2, black2)
fg_bg("TelescopePromptNormal", white, black2)
fg_bg("TelescopePromptPrefix", red, black2)
fg_bg("TelescopePreviewTitle", black, green .. " gui=italic")
fg_bg("TelescopePromptTitle", black, red .. " gui=italic")
fg_bg("TelescopeResultsTitle", black, blue .. " gui=italic")

-- NvimTree
bg("NvimTreeNormal", darker_black)
bg("NvimTreeNormalNC", darker_black)
fg("NvimTreeEmptyFolderName", folder_bg)
fg("NvimTreeEndOfBuffer", darker_black)
fg("NvimTreeFolderIcon", folder_bg)
fg("NvimTreeFolderName", folder_bg)
fg("NvimTreeGitDirty", red)
fg("NvimTreeIndentMarker", one_bg2)
fg("NvimTreeOpenedFolderName", folder_bg)
fg("NvimTreeRootFolder", red .. " gui=underline") -- enable underline for root folder in nvim tree
fg_bg("NvimTreeStatuslineNc", darker_black, darker_black)
fg_bg("NvimTreeVertSplit", darker_black, darker_black)
fg_bg("NvimTreeWindowPicker", red, black2)
