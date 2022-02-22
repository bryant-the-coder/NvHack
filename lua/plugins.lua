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

		-- Better performance :)
		use({
			"lewis6991/impatient.nvim",
		})

		-- Dependencies
		use("nvim-lua/plenary.nvim")
		use("kyazdani42/nvim-web-devicons")

		-- Theme
		use({ "ThemerCorp/themer.lua" })
		use({ "ellisonleao/gruvbox.nvim" })
		use({
			"folke/tokyonight.nvim",
		})
		use({ "bryant-the-coder/astron.nvim" })

		-- Bufferline
		use({
			"akinsho/bufferline.nvim",
			after = "nvim-web-devicons",
			config = [[require("plugins.bufferline")]],
		})

		-- Statusline
		use("rebelot/heirline.nvim")

		-- Explorer menu
		use({
			"kyazdani42/nvim-tree.lua",
			cmd = "NvimTreeToggle",
			config = [[require("plugins.nvim-tree")]],
		})

		-- Treesitter
		use({
			"nvim-treesitter/nvim-treesitter",
			run = ":TSUpdate",
			config = [[require("plugins.treesitter")]],
		})

		use({
			"p00f/nvim-ts-rainbow",
			after = "nvim-treesitter",
		})

		use({
			"windwp/nvim-ts-autotag",
			event = "InsertEnter",
			ft = { "html", "tsx" },
		})

		use({
			"ZhiyuanLck/smart-pairs",
			event = "InsertEnter",
			config = [[require('plugins.smartpairs')]],
		})

		use({
			"nvim-treesitter/playground",
			cmd = { "TSPlaygroundToggle", "TSHighlightCapturesUnderCursor" },
		})

		-- LSP
		use({
			"neovim/nvim-lspconfig",
			config = [[require("plugins.lsp")]],
		})
		use({
			"williamboman/nvim-lsp-installer",
		})

		-- Completion
		use({
			"hrsh7th/nvim-cmp",
			module = "cmp",
			event = { "InsertEnter", "CmdLineEnter" },
			requires = {
				"hrsh7th/cmp-nvim-lsp",
				"onsails/lspkind-nvim",
				{ "saadparwaiz1/cmp_luasnip", after = "nvim-cmp" },
				{ "hrsh7th/cmp-nvim-lsp", after = "nvim-cmp" },
				{ "hrsh7th/cmp-buffer", after = "nvim-cmp" },
				{ "hrsh7th/cmp-path", after = "nvim-cmp" },
				{ "David-Kunz/cmp-npm", after = "nvim-cmp" },
			},
			config = [[require("plugins.cmp")]],
		})
		use({
			"L3MON4D3/LuaSnip",
			requires = {
				"rafamadriz/friendly-snippets",
				after = "LuaSnip",
			},
			config = [[require("plugins.snippets")]],
		})

		use({
			"jose-elias-alvarez/null-ls.nvim",
			event = "BufRead",
			config = [[require("plugins.null-ls")]],
		})

		-- Telescope
		use({
			"nvim-telescope/telescope.nvim",
			module = "telescope",
			event = "BufEnter",
			config = [[require("plugins.telescope")]],
		})

		-- Colorizer
		use({
			"norcalli/nvim-colorizer.lua",
		})

		-- Dashboard
		use({ "glepnir/dashboard-nvim", config = [[require("plugins.dashboard")]] })

		-- LSP highlight
		use({ "folke/lsp-colors.nvim", config = [[require("plugins.other")]] })

		-- Indentation
		use({
			"lukas-reineke/indent-blankline.nvim",
			event = "BufWinEnter",
			config = [[require("plugins.indent")]],
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
			requires = {
				"JoosepAlviste/nvim-ts-context-commentstring",
			},
			config = [[require("plugins.comment")]],
		})

		-- Terminal
		use({
			"akinsho/toggleterm.nvim",
			event = "InsertEnter",
			config = [[require("plugins.toggleterm")]],
		})

		-- Harpoon
		use({
			"ThePrimeagen/harpoon",
			event = "InsertEnter",
		})

		-- Disturbance free writing
		use({
			"folke/zen-mode.nvim",
			config = [[require("plugins.zen-mode")]],
			cmd = "ZenMode",
			event = "BufEnter",
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
			event = { "InsertEnter" },
			config = [[require("plugins.trouble")]],
		})

		-- Neogen
		use({
			"danymat/neogen",
			config = function()
				require("neogen").setup({})
			end,
		})

		-- Git
		use({
			"lewis6991/gitsigns.nvim",
			event = "BufRead",
			config = [[require("plugins.gitsigns")]],
		})

		-- Smooth escaping
		use({
			"max397574/better-escape.nvim",
			event = { "InsertEnter" },
			config = function()
				require("better_escape").setup({
					mapping = { "ii", "jj", "jk", "kj" },
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
		})

		use({
			"ggandor/lightspeed.nvim",
		})

		use({
			"andweeb/presence.nvim",
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
	},
})
