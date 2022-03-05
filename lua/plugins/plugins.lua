-- ULES TO FOLLOW
-- 1. use ({})
-- 2. lazy load ( see :h events )
-- 3. add comment or sections

local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Packer installed")
end

vim.cmd([[packadd packer.nvim]])

return require("packer").startup({
	function(use)
		-- Packer can managee itself
		use({
			"wbthomason/packer.nvim",
		})

		-- Better performance
		use({
			"lewis6991/impatient.nvim",
			config = function()
				require("plugins.config.other")
			end,
		})

		-- Dependencies
		use({
			"nvim-lua/plenary.nvim",
		})
		use({
			"kyazdani42/nvim-web-devicons",
		})

		-- Theme
		use({
			"ThemerCorp/themer.lua",
			branch = "dev",
		})
		use({
			"NvChad/nvim-base16.lua",
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

		-- Completion
		use({
			"hrsh7th/nvim-cmp",
			module = "cmp",
			event = { "InsertEnter", "CmdLineEnter", "InsertCharPre" }, -- InsertCharPre Due to luasnip
			after = { "LuaSnip" },
			requires = {
				{
					"saadparwaiz1/cmp_luasnip",
					after = { "nvim-cmp", "LuaSnip" },
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

		use({
			"jose-elias-alvarez/null-ls.nvim",
			event = { "BufRead", "InsertEnter" },
			config = function()
				require("plugins.config.null-ls")
			end,
		})

		-- Telescope
		use({
			"nvim-telescope/telescope.nvim",
			module = "telescope",
			opt = true,
			event = "BufEnter",
			config = function()
				require("plugins.config.telescope")
			end,
		})

		-- Colorizer
		use({
			"norcalli/nvim-colorizer.lua",
			module = "colorizer",
			opt = true,
		})

		-- Welcome screen
		use({
			"glepnir/dashboard-nvim",
			config = function()
				require("plugins.config.dashboard")
			end,
		})

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
			opt = true,
			event = "InsertEnter",
			config = function()
				require("plugins.config.toggleterm")
			end,
		})

		-- Harpoon
		use({
			"ThePrimeagen/harpoon",
			opt = true,
		})

		-- Disturbance free writing
		use({
			"folke/zen-mode.nvim",
			cmd = "ZenMode",
			event = "BufEnter",
			config = function()
				require("plugins.config.zen-mode")
			end,
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

		-- Smooth escaping
		use({
			"max397574/better-escape.nvim",
			event = { "InsertEnter" },
			opt = true,
			config = function()
				require("better_escape").setup({
					mapping = { "jj", "jk", "kj" },
					timeout = vim.o.timeoutlen,
					keys = "<ESC>",
				})
			end,
		})

		-- Show ppl code in url form
		use({
			"rktjmp/paperplanes.nvim",
			event = "BufEnter",
			cmd = "PP",
			opt = true,
		})

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
