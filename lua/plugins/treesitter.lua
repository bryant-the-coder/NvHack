local status_ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

local incremental_selection = require("nvim-treesitter.incremental_selection")
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	underline = true,
	virtual_text = {
		spacing = 5,
		severity_limit = "Warning",
	},
	update_in_insert = true,
})

require("nvim-treesitter.install").compilers = { "clang" }
treesitter.setup({
	ensure_installed = { "html", "javascript", "lua", "scss" },
	sync_install = false,
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "gnn",
			node_incremental = "grn",
			scope_incremental = "grc",
			node_decremental = "grm",
		},
	},
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	rainbow = {
		enable = true,
		extended_mode = false,
	},
	autotag = {
		enable = true,
	},
	autopairs = {
		enable = true,
	},
	indent = {
		enable = false,
	},
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},
	query_linter = {
		enable = true,
		use_virtual_text = true,
		lint_events = { "BufWrite", "CursorHold" },
	},
	textobjects = {
		select = {
			enable = true,
			lookahead = true,
		},
		move = {
			enable = true,
			set_jumps = true,
			goto_next_start = {
				["]m"] = "@function.outer",
				["]]"] = "@class.outer",
			},
			goto_next_end = {
				["]M"] = "@function.outer",
				["]["] = "@class.outer",
			},
			goto_previous_start = {
				["[m"] = "@function.outer",
				["[["] = "@class.outer",
			},
			goto_previous_end = {
				["[M"] = "@function.outer",
				["[]"] = "@class.outer",
			},
		},
	},
})
