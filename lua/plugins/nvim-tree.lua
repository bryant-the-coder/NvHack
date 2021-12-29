local tree_cb = require'nvim-tree.config'.nvim_tree_callback
local g = vim.g

local present, tree = pcall(require, "nvim-tree")
if not present then
   return
end

tree.setup {
  disable_netrw       = true,
  hijack_netrw        = true,
  open_on_setup       = false,
  ignore_ft_on_setup  = {},
  auto_close          = false,
  open_on_tab         = true,
  hijack_cursor       = false,
  update_cwd          = false,
  update_to_buf_dir   = {
    enable = false,
    auto_open = true,
  },
  diagnostics = {
    enable = true,
    icons = {
      hint = " ",
      info = " ",
      warning = " ",
      error = " ",
    }
  },
  update_focused_file = {
    enable      = true,
    update_cwd  = true,
    ignore_list = {}
  },
  filters = {
    dotfiles = true,
    custom = {".git", ".gitattributes", "node_module", "package-lock.json"}
  },
  git = {
    enable = false,
  },
  view = {
    width = 24,
    height = 30,
    hide_root_folder = false,
    side = 'left',
    auto_resize = true,
    mappings = {
      custom_only = false,
      list = {}
    },
  },
  trash = {
    cmd = "trash",
    require_confirm = true
  }
}

g.nvim_tree_icons = {
  default = '',
  symlink = '',
  folder = {
    default = '',
    open = '',
    empty = '',
    empty_open = '',
    symlink = '',
    symlink_open = '',
  },
}
