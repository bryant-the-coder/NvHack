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

hl(0, "StatuslineNC", { bg = "#15171C" })
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

-----------------------------------
--           Basic               --
-----------------------------------
-- Line Number
hl(0, "cursorlinenr", { fg = white })

-- Same as bg, so it doesn't appear
hl(0, "EndOfBuffer", { fg = black })

-- For floating windows
hl(0, "FloatBorder", { fg = blue })
hl(0, "NormalFloat", { bg = darker_black })

-- Inactive statuslines as thin lines
hl(0, "StatuslineNC", { fg = one_bg3 })
hl(0, "LineNr", { fg = light_grey })
hl(0, "NvimInternalError", { fg = red })
hl(0, "VertSplit", { fg = one_bg2 })

-- Comments
hl(0, "Comment", { fg = grey, italic = true, bold = true })

-----------------------------------
--           Plugins             --
-----------------------------------
-- Lsp diagnostics
hl(0, "DiagnosticHint", { fg = purple })
hl(0, "DiagnosticError", { fg = red })
hl(0, "DiagnosticWarn", { fg = yellow })
hl(0, "DiagnosticInformation", { fg = green })
hl(0, "DiagnosticHeader", { fg = "#2cb27f", bold = true, italic = true })

-- Pmenu
hl(0, "Pmenu", { bg = one_bg })
hl(0, "PmenuSbar", { bg = one_bg2 })
hl(0, "PmenuSel", { bg = pmenu_bg })
hl(0, "PmenuThumb", { bg = nord_blue })

-- CMP
hl(0, "CmpItemAbbrDeprecated", { fg = "#808080", strikethrough = true })
hl(0, "CmpItemAbbr", { fg = white })

hl(0, "CmpItemAbbrMatch", { fg = "#569CD6" })
hl(0, "CmpItemAbbrMatchFuzzy", { fg = "#569CD6" })

hl(0, "CmpItemKIndVariable", { fg = "#9CDCFE" })
hl(0, "CmpItemMenuInterface", { fg = "#9CDCFE" })
hl(0, "CmpItemMenuText", { fg = "#9CDCFE" })

hl(0, "CmpItemKindFunction", { fg = "#C586C0" })
hl(0, "CmpItemKindMethod", { fg = "#C586C0" })

hl(0, "CmpItemKindKeyword", { fg = "#D4D4D4" })
hl(0, "CmpItemKindProperty", { fg = "#D4D4D4" })
hl(0, "CmpItemKindUnit", { fg = "#D4D4D4" })

-- Telescope
hl(0, "TelescopeNormal", { bg = darker_black })
hl(0, "TelescopeSelection", { bg = black2 })
hl(0, "TelescopeBorder", { bg = darker_black, fg = darker_black })
hl(0, "TelescopePromptBorder", { bg = black2, fg = black2 })
hl(0, "TelescopePromptNormal", { fg = white, bg = black2 })
hl(0, "TelescopePromptNormal", { fg = white, bg = black2 })
hl(0, "TelescopePromptPrefix", { fg = red, bg = black2 })
hl(0, "TelescopePreviewTitle", { fg = black, bg = green, italic = true })
hl(0, "TelescopePromptTitle", { fg = black, bg = red, italic = true })
hl(0, "TelescopeResultsTitle", { fg = darker_black, bg = darker_black })

-- Nvim-Tree
hl(0, "NvimTreeNormal", { bg = darker_black })
hl(0, "NvimTreeNormalNC", { bg = darker_black })
hl(0, "NvimTreeEmptyFolderName", { fg = folder_bg })
hl(0, "NvimTreeFolderName", { fg = folder_bg })
hl(0, "NvimTreeFolderIcon", { fg = folder_bg })
hl(0, "NvimTreeOpenedFolderName", { fg = folder_bg })
hl(0, "NvimTreeEndOfBuffer", { fg = darker_black })
hl(0, "NvimTreeGitDirty", { fg = red })
hl(0, "NvimTreeIndentMarker", { fg = one_bg2 })
hl(0, "NvimTreeRootFolder", { fg = red, underline = true })
hl(0, "NvimTreeStatuslineNc", { fg = darker_black, bg = darker_black })
hl(0, "NvimTreeVertSplit", { fg = darker_black, bg = darker_black })
hl(0, "NvimTreeWindowPicker", { fg = red, bg = black2 })
