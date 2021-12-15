-- Simple yet amazing config for statusline
-- Author: Bryant
-- Credit: glepnir & shadmansaleh

local lualine = require 'lualine'

local colors = {
  bg            = '#1c1b26',
  fg            = '#f8f8ff',
  red           = '#dd3e46',
  bred          = '#fc3235',
  blue          = '#4198c6',
  yellow        = '#dda654',
  byellow       = '#e8f402',
  green         = '#41c643',
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
  update_in_insert = true
}

-- Setup the config file~
lualine.setup(config)
