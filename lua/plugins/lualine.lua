-- Simple yet amazing config for statusline
-- Author: Bryant
-- Credit: glepnir & shadmansaleh

local lualine = require 'lualine'
local colors = require('colors').colors.lualine

-- Centering files
local function center()
  return '%='
end

-- Filename with icons
local my_filename = require('lualine.components.filename'):extend()
my_filename.apply_icon = require('lualine.components.filetype').apply_icon

-- clock
local clock = 'os.date("%I:%M:%S", os.time())'
if _G.Statusline_timer == nil then
    _G.Statusline_timer = vim.loop.new_timer()
else
    _G.Statusline_timer:stop()
end
_G.Statusline_timer:start(0, 1000, vim.schedule_wrap(
                              function() vim.api.nvim_command('redrawstatus') end))

-- Config
local config = {
  options = {
    component_separators = '',
    section_separators = '',
    theme = {
      normal = { c = { fg = colors.fg, bg = colors.bg } },
      inactive = { c = { fg = colors.fg, bg = colors.bg } },
    },
  },
  sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {{my_filename, colored = true}},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
  extensions = {'nvim-tree', 'toggleterm'}
}

local function left(component)
  table.insert(config.sections.lualine_c, component)
end

local function right(component)
  table.insert(config.sections.lualine_x, component)
end



left {
  'branch',
  icon = '',
  fmt = string.upper,
  color = {fg = colors.yellow}
}


left {
    center
}

left {
    my_filename,
    colored = true,
}

right {
  'diagnostics',
  sources = { 'nvim_diagnostic' },
  sections = { 'error', 'warn', 'info'},
  symbols = {error = ' ', warn = ' ', info = ' '},
  diagnostics_color = {
    color_error  = { fg = colors.bred },
    color_warn   = { fg = colors.byellow },
    color_info   = { fg = colors.bgreen },
  },
  always_visible = true,
  update_in_insert = true,
  padding = {right = 2}
}

right {
  clock,
  icon = '',
  color = {fg = colors.cyber_green},
  padding = {right = 1}
}

right {
  function()
	local current_line = vim.fn.line(".")
	local total_lines = vim.fn.line("$")
	local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
	local line_ratio = current_line / total_lines
	local index = math.ceil(line_ratio * #chars)
	return chars[index]
end,
  padding = 0,
  color = {fg = colors.yellow}
}

-- Setup the config file / source it?
lualine.setup(config)
