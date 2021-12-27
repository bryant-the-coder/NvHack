local cmd = vim.cmd

local colors = {
  red = "#FF0000",
  white = " #f5f5dc",
  grey = "#696969"
}

-- Highlight functions
local bg = function(group, col)
   cmd("hi " .. group .. " guibg=" .. col)
end

local fg = function(group, col)
   cmd("hi " .. group .. " guifg=" .. col)
end

local fg_bg = function(group, fgcol, bgcol)
   cmd("hi " .. group .. " guifg=" .. fgcol .. " guibg=" .. bgcol)
end


-- Telescope
-- fg_bg("TelescopeBorder", darker_black, darker_black)
-- fg_bg("TelescopePromptBorder", black2, black2)

-- fg_bg("TelescopePromptNormal", white, black2)
-- fg_bg("TelescopePromptPrefix", red, black2)

-- bg("TelescopeNormal", darker_black)

-- fg_bg("TelescopePreviewTitle", black, green)
-- fg_bg("TelescopePromptTitle", black, red)
-- fg_bg("TelescopeResultsTitle", darker_black, darker_black)

-- bg("TelescopeSelection", black2)

-- Dashboard
-- fg("DashboardCenter", colors.red)
-- fg("DashboardFooter", colors.white)
-- fg("DashboardHeader", colors.grey)
-- fg("DashboardShortcut", colors.white)

