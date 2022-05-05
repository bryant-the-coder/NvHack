local g = vim.g

local present, tree = pcall(require, "nvim-tree")
if not present then
    return
end

g.nvim_tree_icons = {
    default = "",
    symlink = "",
    git = {
        deleted = "",
        ignored = "◌",
        renamed = "➜",
        staged = "✓",
        unmerged = "",
        unstaged = "✗",
        untracked = "★",
    },
    folder = {
        default = "",
        empty = "",
        empty_open = "",
        open = "",
        symlink = "",
        symlink_open = "",
        arrow_open = "",
        arrow_closed = "",
    },
}

tree.setup({
    disable_netrw = true,
    hijack_netrw = true,
    open_on_setup = false,
    open_on_tab = true,
    hijack_cursor = false,
    update_cwd = false,
    view = {
        width = 30,
        height = 30,
        hide_root_folder = false,
        side = "right",
        preserve_window_proportions = true,
        mappings = {
            custom_only = false,
            list = {},
        },
    },
    hijack_directories = {
        enable = true,
        auto_open = true,
    },
    update_focused_file = {
        enable = true,
        update_cwd = true,
        ignore_list = {},
    },
    ignore_ft_on_setup = {},
    system_open = {
        cmd = nil,
        args = {},
    },
    renderer = {
        indent_markers = {
            enable = true,
        },
    },
    filters = {
        dotfiles = false,
        custom = { ".git", ".gitattributes", "node_module", "package.lock.json" },
    },
    git = {
        enable = false,
    },
    trash = {
        cmd = "trash",
        require_confirm = true,
    },
    actions = {
        use_system_clipboard = true,
        change_dir = {
            enable = true,
            global = false,
            restrict_above_cwd = false,
        },
        open_file = {
            quit_on_open = false,
            resize_window = false,
            window_picker = {
                enable = true,
                chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
                exclude = {
                    filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
                    buftype = { "nofile", "terminal", "help" },
                },
            },
        },
    },
})
