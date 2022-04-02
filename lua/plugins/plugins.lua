-- ULES TO FOLLOW
-- 1. use ({})
-- 2. lazy load ( see :h events )
-- 3. add comment or sections

local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Cloning packer...\nSetup NvHack")
	vim.cmd([[packadd packer.nvim]])
end
-- local user_settings = require("user_settings").settings()

return require("packer").startup({
	function(use)
		-- Packer can manage itself
		use({
			"wbthomason/packer.nvim",
		})

		-- Better performance
		use({
			"lewis6991/impatient.nvim",
			config = function()
				require("plugins.config.other")
			end,
			-- disable = user_settings.impatient,
		})

		-- Dependencies
		use({
			"nvim-lua/plenary.nvim",
		})
		use({
			"kyazdani42/nvim-web-devicons",
			after = "nvim-base16.lua",
		})

		-- Theme
		use({
			"ThemerCorp/themer.lua",
			branch = "0.7",
		})
		use({
			"bryant-the-coder/nvim-base16.lua",
		})

		-- Bufferline
		use({
			"akinsho/bufferline.nvim",
			after = "nvim-web-devicons",
			event = "BufEnter",
			config = function()
				require("plugins.config.bufferline")
			end,
		})

		-- Neorg
		use({
			"nvim-neorg/neorg",
			ft = "norg",
			after = "nvim-treesitter",
			config = function()
				require("plugins.config.neorg")
			end,
		})

		-- Explorer menu
		use({
			"kyazdani42/nvim-tree.lua",
			cmd = "NvimTreeToggle",
			opt = true,
			config = function()
				require("plugins.config.nvim-tree")
			end,
		})

		-- Treesitter
		use({
			"nvim-treesitter/nvim-treesitter",
			event = { "BufRead", "BufNewFile" },
			module = "nvim-treesitter",
			run = ":TSUpdate",
			config = function()
				require("plugins.config.treesitter")
			end,
		})

		use({
			"p00f/nvim-ts-rainbow",
			after = "nvim-treesitter",
			event = "InsertEnter",
			opt = true,
		})

		use({
			"windwp/nvim-ts-autotag",
			opt = true,
			event = "InsertEnter",
			ft = { "html", "tsx" },
		})

		use({
			"nvim-treesitter/nvim-treesitter-textobjects",
			after = "nvim-treesitter",
			event = "InsertEnter",
			opt = true,
		})

		use({
			"windwp/nvim-autopairs",
			after = "nvim-cmp",
			event = "InsertEnter",
			opt = true,
			config = function()
				require("plugins.config.autopairs")
			end,
		})

		use({
			"nvim-treesitter/playground",
			cmd = { "TSPlaygroundToggle", "TSHighlightCapturesUnderCursor" },
			after = "nvim-treesitter",
			opt = true,
			event = { "CursorMoved", "CursorMovedI" },
		})

		-- LSP
		use({
			"neovim/nvim-lspconfig",
			module = "lspconfig",
			event = "BufRead",
			config = function()
				require("plugins.config.lsp")
			end,
		})

		use({
			"williamboman/nvim-lsp-installer",
		})

		use({
			"jose-elias-alvarez/null-ls.nvim",
			event = { "BufRead", "InsertEnter" },
			config = function()
				require("plugins.config.null-ls")
			end,
		})

		-- Completion
		use({
			"hrsh7th/nvim-cmp",
			module = "cmp",
			branch = "dev",
			commit = "5cbce7907493be1d5d14027c7eb016f63b0252f8", -- There is conflicts in dev branch
			event = { "InsertEnter", "CmdLineEnter", "InsertCharPre" }, -- InsertCharPre Due to luasnip
			after = { "LuaSnip" },
			requires = {
				{
					"saadparwaiz1/cmp_luasnip",
					after = { "nvim-cmp" },
				},
				{ "hrsh7th/cmp-nvim-lsp", after = "nvim-cmp" },
				{ "hrsh7th/cmp-buffer", after = "nvim-cmp" },
				{ "hrsh7th/cmp-path", after = "nvim-cmp" },
				{ "David-Kunz/cmp-npm", after = "nvim-cmp" },
			},
			config = function()
				require("plugins.config.cmp")
			end,
		})

		use({
			"L3MON4D3/LuaSnip",
			requires = {
				"rafamadriz/friendly-snippets",
				event = "InsertEnter",
			},
			module = "luasnip",
			event = "InsertEnter",
			config = function()
				require("plugins.config.snippets")
			end,
		})

		-- Telescope
		use({
			"nvim-telescope/telescope.nvim",
			module = "telescope",
			cmd = "Telescope",
		})
		use({
			"nvim-telescope/telescope-fzf-native.nvim",
			run = "make",
			after = "telescope.nvim",
		})

		-- Colorizer
		use({
			"norcalli/nvim-colorizer.lua",
			module = "colorizer",
			ft = { "css", "scss", "html", "js", "jsx" },
			opt = true,
		})

		-- Welcome screen
		-- use({
		-- 	"glepnir/dashboard-nvim",
		-- 	config = function()
		-- 		require("plugins.config.dashboard")
		-- 	end,
		-- })

		-- Indentation
		use({
			"lukas-reineke/indent-blankline.nvim",
			event = "BufWinEnter",
			opt = true,
			config = function()
				require("plugins.config.indent")
			end,
		})

		-- Auto-comment
		use({
			"numToStr/Comment.nvim",
			keys = {
				"gcc",
				"gc",
				"gcb",
				"gb",
			},
			opt = true,
			event = "BufEnter",
			requires = {
				"JoosepAlviste/nvim-ts-context-commentstring",
			},
			config = function()
				require("plugins.config.comment")
			end,
		})

		-- Terminal
		use({
			"akinsho/toggleterm.nvim",
			config = function()
				require("plugins.config.toggleterm")
			end,
			opt = true,
			disable = true,
		})

		-- Harpoon
		use({
			"ThePrimeagen/harpoon",
			module = "harpoon",
			opt = true,
			after = "telescope.nvim",
			config = function()
				require("harpoon").setup({
					global_settings = {
						save_on_toggle = false,
						save_on_change = true,
						enter_on_sendcmd = false,
						tmux_autoclose_windows = false,
						excluded_filetypes = { "harpoon" },
					},
				})
				require("telescope").load_extension("harpoon")
			end,
		})

		-- Disturbance free writing
		use({
			"folke/zen-mode.nvim",
			cmd = "ZenMode",
			event = "BufEnter",
			config = function()
				require("plugins.config.zen-mode")
			end,
			disable = true,
		})

		-- Finding errors easily
		use({
			"folke/trouble.nvim",
			cmd = {
				"Trouble",
				"TroubleRefresh",
				"TroubleClose",
				"TroubleToggle",
			},
			opt = true,
			event = { "InsertEnter" },
			config = function()
				require("plugins.config.trouble")
			end,
		})

		-- Neogen
		use({
			"danymat/neogen",
			after = "LuaSnip",
			config = function()
				require("neogen").setup({
					snippet_engine = "luasnip",
				})
			end,
		})

		-- Git
		use({
			"lewis6991/gitsigns.nvim",
			event = "BufRead",
			opt = true,
			config = function()
				require("plugins.config.gitsigns")
			end,
		})

		-- Show ppl code in url form
		use({
			"rktjmp/paperplanes.nvim",
			event = "BufEnter",
			cmd = "PP",
			opt = true,
			disable = true,
		})

		-- Fast speed
		use({
			"ggandor/lightspeed.nvim",
			event = "BufEnter",
			opt = true,
		})

		use({
			"shift-d/scratch.nvim",
			command = "ScratchEval",
			event = {
				"InsertEnter",
				"CmdLineEnter",
			},
			opt = true,
			disable = true,
		})

		-- Notifications
		use({
			"rcarriga/nvim-notify",
			opt = true,
			event = "BufEnter",
			config = function()
				require("plugins.config.notify")
			end,
		})

		use({
			"ThePrimeagen/refactoring.nvim",
			opt = true,
			disable = true,
		})

		-- Discord rich presence
		use({
			"andweeb/presence.nvim",
			event = "BufEnter",
			config = function()
				require("plugins.config.presence")
			end,
		})
	end,
	config = {
		profile = {
			enable = true,
			threshold = 0.0001,
		},
		display = {
			title = "Packer",
			done_sym = "",
			error_syn = "×",
		},
		max_jobs = 6,
	},
})
