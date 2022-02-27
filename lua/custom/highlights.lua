local fg = require("core.utils").fg
local bg = require("core.utils").bg
local fg_bg = require("core.utils").fg_bg
local colors = require("hl_themes.onedark")
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

bg("StatusInactive", "#282c34")
bg("StatusLineNC", "#15171c")
fg_bg("StatusNormal", "#181a1f", "#98c379")
fg_bg("StatusReplace", "#181a1f", "#E5C07B")
fg_bg("StatusInsert", "#181a1f", "#61AFEF")
fg_bg("StatusCommand", "#181a1f", "#56B6C2")
fg_bg("StatusVisual", "#181a1f", "#C678DD")
fg_bg("StatusTerminal", "#181a1f", "#E06C75")
fg_bg("FileName", "#181a1f", "#E06C75")
fg("Branch", "#ffcc00")
bg("error", "#FF0000")

-- Floating borders
fg("FloatBorder", blue)
bg("NormalFloat", darker_black)

-- Make the bg same so it doesnt show
fg("EndOfBuffer", black)

-- Telescope
fg_bg("TelescopeBorder", darker_black, darker_black)
fg_bg("TelescopePromptBorder", black2, black2)
fg_bg("TelescopePromptNormal", white, black2)
fg_bg("TelescopePromptPrefix", red, black2)
bg("TelescopeNormal", darker_black)
fg_bg("TelescopePreviewTitle", black, green)
fg_bg("TelescopePromptTitle", black, red)
fg_bg("TelescopeResultsTitle", darker_black, darker_black)
bg("TelescopeSelection", black2)

-- NvimTree
fg("NvimTreeEmptyFolderName", folder_bg)
fg("NvimTreeEndOfBuffer", darker_black)
fg("NvimTreeFolderIcon", folder_bg)
fg("NvimTreeFolderName", folder_bg)
fg("NvimTreeGitDirty", red)
fg("NvimTreeIndentMarker", one_bg2)
bg("NvimTreeNormal", darker_black)
bg("NvimTreeNormalNC", darker_black)
fg("NvimTreeOpenedFolderName", folder_bg)
fg("NvimTreeRootFolder", red .. " gui=underline") -- enable underline for root folder in nvim tree
fg_bg("NvimTreeStatuslineNc", darker_black, darker_black)
fg_bg("NvimTreeVertSplit", darker_black, darker_black)
fg_bg("NvimTreeWindowPicker", red, black2)

-- Lsp diagnostics
fg("DiagnosticHint", purple)
fg("DiagnosticError", red)
fg("DiagnosticWarn", yellow)
fg("DiagnosticInformation", green)

-- Dashboard
fg("DashboardCenter", grey_fg)
fg("DashboardFooter", grey_fg)
fg("DashboardHeader", grey_fg)
fg("DashboardShortcut", grey_fg)
