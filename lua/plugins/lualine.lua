-- Simple yet amazing config for statusline
-- Author: Bryant
-- Credit: glepnir & shadmansaleh

local lualine = require 'lualine'

local colors = {
  bg            = '#191724',
  fg            = '#f8f8ff',
  red           = '#dd3e46',
  bred          = '#fc3235',
  blue          = '#4198c6',
  yellow        = '#dda654',
  byellow       = '#e8f402',
  green         = '#41c643',
  cyber_green   = '#32b53d',
  orange        = '#c67f41',
  cyan          = '#41c684',
  purple        = '#cd8fe0',
}

-- Centering files
local function center()
  return '%='
end

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
    lualine_y = {},
    lualine_z = {},
    lualine_c = {},
    lualine_x = {},
  },
  inactive_sections = {
    lualine_a = {},
    lualine_v = {},
    lualine_y = {},
    lualine_z = {},
    lualine_c = {},
    lualine_x = {},
  },
  extensions = {'nvim-tree', 'toggleterm'}
}

local function left(component)
  table.insert(config.sections.lualine_c, component)
end

local function right(component)
  table.insert(config.sections.lualine_x, component)
end

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

left {
  -- mode component
  function()
    -- auto change color according to neovims mode
    local mode_color = {
      n = colors.red,
      i = colors.green,
      v = colors.blue,
      [''] = colors.blue,
      V = colors.blue,
      c = colors.magenta,
      no = colors.red,
      s = colors.orange,
      S = colors.orange,
      [''] = colors.orange,
      ic = colors.yellow,
      R = colors.violet,
      Rv = colors.violet,
      cv = colors.red,
      ce = colors.red,
      r = colors.cyan,
      rm = colors.cyan,
      ['r?'] = colors.cyan,
      ['!'] = colors.red,
      t = colors.red,
    }
    local mode = {
      ['n']    = ' NORMAL',
      ['no']   = ' NORMAL',
      ['nov']  = ' NORMAL',
      ['noV']  = ' NORMAL',
      ['no'] = ' NORMAL',
      ['niI']  = ' NORMAL',
      ['niR']  = ' NORMAL',
      ['niV']  = ' NORMAL',

      ['i']   = ' INSERT',
      ['ic']  = ' INSERT ',
      ['ix']  = ' INSERT ',
      ['s']   = ' INSERT ',
      ['S']   = ' INSERT ',

      ['v']   = ' VISUAL',
      ['V']   = ' V-LINE',
      ['']  = ' ',
      ['r']   = '﯒ ',
      ['r?']  = ' ',
      ['c']   = ' ',
      ['t']   = ' ',
      ['!']   = ' ',
      ['R']   = ' ',
    }
    vim.api.nvim_command('hi! LualineMode guifg=' .. mode_color[vim.fn.mode()] .. ' guibg=' .. colors.bg)
    return mode[vim.fn.mode()] or 'default'
  end,
  color = 'LualineMode',
  padding = { left = 1 , right = 1},
}
left {
  'branch',
  icon = '',
  fmt = string.upper,
  color = {fg = colors.bg, bg = colors.yellow}
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
  icon = '',
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
