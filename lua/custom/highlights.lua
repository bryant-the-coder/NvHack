local fg = require("core.utils").fg
local bg = require("core.utils").bg
local fg_bg = require("core.utils").fg_bg
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

-- bg("StatusInactive", line)
-- bg("StatusLineNC", darker_black)
-- fg_bg("StatusNormal", darker_black, green)
-- fg_bg("StatusReplace", darker_black, blue)
-- fg_bg("StatusInsert", darker_black, yellow)
-- fg_bg("StatusCommand", darker_black, purple)
-- fg_bg("StatusVisual", darker_black, purple)
-- fg_bg("StatusTerminal", darker_black, red)
-- fg_bg("FileName", darker_black, red)
-- fg_bg("Branch", darker_black, nord_blue)
-- fg_bg("Error", darker_black, red)
-- bg("StatusInactive", "#282c34")
bg("StatusLineNC", "#15171c")
fg_bg("StatusNormal", "#181a1f", "#98c379")
fg_bg("StatusReplace", "#181a1f", "#E5C07B")
fg_bg("StatusInsert", "#181a1f", "#61AFEF")
fg_bg("StatusCommand", "#181a1f", "#56B6C2")
fg_bg("StatusVisual", "#181a1f", "#C678DD")
fg_bg("StatusTerminal", "#181a1f", "#E06C75")
fg("FileName", "#a9b1d6")
fg_bg("Branch", "#181a1f", "#ff69b4")
fg_bg("Error", "#18171F", "#EE6D85" .. " gui=bold")
fg_bg("Warning", "#18171F", "#D7A65F" .. " gui=bold")
fg_bg("Clock", "#18171F", "#41a6b5")

-----------------------------------
--           Basic               --
-----------------------------------
-- Line number
fg("cursorlinenr", white)

-- same it bg, so it doesn't appear
fg("EndOfBuffer", black)

-- For floating windows
fg("FloatBorder", light_grey)
bg("NormalFloat", darker_black)

-- inactive statuslines as thin lines
fg("StatusLineNC", one_bg3 .. " gui=underline")

bg("Visual", light_grey)

fg("LineNr", light_grey)
fg("NvimInternalError", red)
fg("VertSplit", one_bg2)

-- fg("Comment", light_grey .. " gui=italic")

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
fg_bg("TelescopeResultsTitle", darker_black, darker_black)

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
