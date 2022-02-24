local g = vim.g

local present, tree = pcall(require, "nvim-tree")
if not present then
	return
end

g.nvim_tree_indent_markers = 1

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
		open = "",
		symlink = "",
		symlink_open = "",
	},
}

tree.setup({
	disable_netrw = true,
	hijack_netrw = true,
	open_on_setup = false,
	ignore_ft_on_setup = {},
	auto_close = false,
	open_on_tab = true,
	hijack_cursor = false,
	update_cwd = false,
	update_to_buf_dir = {
		enable = false,
		auto_open = true,
	},
	diagnostics = {
		enable = false,
		icons = {
			hint = " ",
			info = " ",
			warning = " ",
			error = " ",
		},
	},
	update_focused_file = {
		enable = true,
		update_cwd = true,
		ignore_list = {},
	},
	filters = {
		dotfiles = false,
		custom = { ".git", ".gitattributes", "node_module", "package-lock.json" },
	},
	git = {
		enable = false,
	},
	view = {
		width = 24,
		height = 30,
		hide_root_folder = false,
		side = "left",
		auto_resize = true,
		mappings = {
			custom_only = false,
			list = {},
		},
	},
	trash = {
		cmd = "trash",
		require_confirm = true,
	},
})
