local actions = require("telescope.actions")
local putils = require("telescope.previewers.utils")
-- Disable highlighting for certain files
local previewers = require('telescope.previewers')
local mappings   = require('telescope.mappings')
local pickers    = require('telescope.pickers')
local _bad = { '.*%.exe', '.git', '.node_modules', '.gitattributes' }
local bad_files = function(filepath)
  for _, v in ipairs(_bad) do
    if filepath:match(v) then
      return false
    end
  end

  return true
end

local new_maker = function(filepath, bufnr, opts)
  opts = opts or {}
  if opts.use_ft_detect == nil then opts.use_ft_detect = true end
  opts.use_ft_detect = opts.use_ft_detect == false and false or bad_files(filepath)
  previewers.buffer_previewer_maker(filepath, bufnr, opts)
end

require("telescope").setup{
  defaults = {
    layout_config = {
      width = 0.75,
      prompt_position = "bottom",
      preview_cutoff = 120,
      horizontal = {mirror = false},
      vertical = {mirror = false},
    },
    find_command = {'rg', '--no-heading', '--with-filename', '--line-number', '--column', '--smart-case'},
    prompt_prefix = " ",
    selection_caret = " ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "ascending",
    layout_strategy = "horizontal",
    border = {},
    borderchars = {'─', '│', '─', '│', '╭', '╮', '╯', '╰'},
    color_devicons = true,
    buffer_previewer_maker = new_maker,
    mappings = {
        i = {
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
            ["<esc>"] = actions.close,
        },
        n = {
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
        }
    },
    pickers = {
        find_files = {
            hidden = true,
        },
        live_grep = {
            path_display = { 'shorten' }
        }
    }
  },
}

