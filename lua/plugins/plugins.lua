-- RULES TO FOLLOW
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

		-- Better performance :)
		use({
			"lewis6991/impatient.nvim",
		})

		-- Dependencies
		use("nvim-lua/plenary.nvim")
		use("kyazdani42/nvim-web-devicons")

		-- Theme
		use({ "ThemerCorp/themer.lua" })
		use({
			"folke/tokyonight.nvim",
		})
		use({ "bryant-the-coder/astron.nvim" })

		-- Bufferline
		use({
			"akinsho/bufferline.nvim",
			after = "nvim-web-devicons",
			event = "BufWinEnter",
			config = function()
				require("plugins.config.bufferline")
			end,
		})

		-- Statusline
		-- use("rebelot/heirline.nvim")

		-- Explorer menu
		use({
			"kyazdani42/nvim-tree.lua",
			cmd = "NvimTreeToggle",
			config = function()
				require("plugins.config.nvim-tree")
			end,
		})

		-- Treesitter
		use({
			"nvim-treesitter/nvim-treesitter",
			event = "BufRead",
			run = ":TSUpdate",
			config = function()
				require("plugins.config.treesitter")
			end,
		})

		use({
			"p00f/nvim-ts-rainbow",
			after = "nvim-treesitter",
			event = "InsertEnter",
		})

		use({
			"windwp/nvim-ts-autotag",
			event = "InsertEnter",
			ft = { "html", "tsx" },
		})

		use({
			"nvim-treesitter/nvim-treesitter-textobjects",
			after = "nvim-treesitter",
			event = "InsertEnter",
		})

		use({
			"ZhiyuanLck/smart-pairs",
			event = "InsertEnter",
			after = "nvim-cmp",
			config = function()
				require("plugins.config.smartpairs")
			end,
		})

		use({
			"nvim-treesitter/playground",
			cmd = { "TSPlaygroundToggle", "TSHighlightCapturesUnderCursor" },
			after = "nvim-treesitter",
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
				{ "saadparwaiz1/cmp_luasnip", after = { "nvim-cmp", "LuaSnip" } },
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
			event = "BufEnter",
			config = function()
				require("plugins.config.telescope")
			end,
		})

		-- Colorizer
		use({
			"norcalli/nvim-colorizer.lua",
		})

		-- Welcome screen
		use({
			"glepnir/dashboard-nvim",
			config = function()
				require("plugins.config.dashboard")
			end,
		})
		use("goolord/alpha-nvim")

		-- LSP highlight
		use({
			"folke/lsp-colors.nvim",
			config = function()
				require("plugins.config.other")
			end,
		})

		-- Indentation
		use({
			"lukas-reineke/indent-blankline.nvim",
			event = "BufWinEnter",
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
			event = "InsertEnter",
			config = function()
				require("plugins.config.toggleterm")
			end,
		})

		-- Harpoon
		use({
			"ThePrimeagen/harpoon",
			event = "InsertEnter",
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
				require("neogen").setup({})
			end,
		})

		-- Git
		use({
			"lewis6991/gitsigns.nvim",
			event = "BufRead",
			config = function()
				require("plugins.config.gitsigns")
			end,
		})

		-- Smooth escaping
		use({
			"max397574/better-escape.nvim",
			event = { "InsertEnter" },
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
		})

		use({
			"ggandor/lightspeed.nvim",
			event = "CmdLineEnter",
		})

		use({
			"andweeb/presence.nvim",
		})

		use({
			"shift-d/scratch.nvim",
			command = "ScratchEval",
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
