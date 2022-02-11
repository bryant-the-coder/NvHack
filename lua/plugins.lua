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
		-- Packer can manage itself
		use("wbthomason/packer.nvim")

		-- Dependencies
		use("nvim-lua/plenary.nvim")
		use("kyazdani42/nvim-web-devicons")

		-- Theme
		use({
			"ThemerCorp/themer.lua",
		})
		use({ "srcery-colors/srcery-vim", as = "srcery" })
		use("LunarVim/onedarker.nvim")

		-- Explorer menu
		use({
			"kyazdani42/nvim-tree.lua",
			cmd = {
				"NvimTreeClipboard",
				"NvimTreeClose",
				"NvimTreeFindFile",
				"NvimTreeFindFileToggle",
				"NvimTreeFocus",
				"NvimTreeOpen",
				"NvimTreeRefresh",
				"NvimTreeResize",
				"NvimTreeToggle",
			},
			config = [[require("plugins.nvim-tree")]],
		})

		-- Treesitter
		use({
			"nvim-treesitter/nvim-treesitter",
			run = ":TSUpdate",
			requires = {
				"p00f/nvim-ts-rainbow",
				"nvim-treesitter/playground",
				"windwp/nvim-ts-autotag",
				{ "windwp/nvim-autopairs", event = "InsertEnter", config = [[require("plugins.autopairs")]] },
			},
			config = [[require("plugins.treesitter")]],
		})

		-- Telescope
		use({
			"nvim-telescope/telescope.nvim",
			config = [[require("plugins.telescope")]],
		})

		-- Dashboard
		use({ "glepnir/dashboard-nvim", config = [[require("plugins.dashboard")]] })

		-- Bufferline
		use({
			"akinsho/bufferline.nvim",
			after = "nvim-web-devicons",
			config = [[require("plugins.bufferline")]],
		})

		-- Colorizer
		use({
			"norcalli/nvim-colorizer.lua",
			config = [[require("plugins.other")]],
		})

		-- LSP
		use({
			"neovim/nvim-lspconfig",
			config = [[require("plugins.lsp")]],
		})
		use({
			"williamboman/nvim-lsp-installer",
		})
		use({
			"hrsh7th/nvim-cmp",
			requires = {
				"hrsh7th/cmp-nvim-lsp",
				"onsails/lspkind-nvim",
				{ "L3MON4D3/LuaSnip", config = [[require("plugins.snippets")]] },
				{ "saadparwaiz1/cmp_luasnip", after = "nvim-cmp" },
				{ "hrsh7th/cmp-nvim-lsp", after = "nvim-cmp" },
				{ "hrsh7th/cmp-buffer", after = "nvim-cmp" },
				{ "hrsh7th/cmp-path", after = "nvim-cmp" },
				{ "David-Kunz/cmp-npm", after = "nvim-cmp" },
			},
			config = [[require("plugins.cmp")]],
		})
		use({
			"rafamadriz/friendly-snippets",
			config = [[require("plugins.snippets")]],
		})

		use({
			"jose-elias-alvarez/null-ls.nvim",
			event = "BufRead",
			config = [[require("plugins.null-ls")]],
		})

		-- LSP highlight
		use({ "folke/lsp-colors.nvim", config = [[require("plugins.other")]] })

		-- Indentation
		use({
			"lukas-reineke/indent-blankline.nvim",
			config = [[require("plugins.indent")]],
		})

		-- Auto-comment
		use({
			"numToStr/Comment.nvim",
			requires = {
				"JoosepAlviste/nvim-ts-context-commentstring",
			},
			config = [[require("plugins.comment")]],
		})

		-- Terminal
		use({ "akinsho/toggleterm.nvim", config = [[require("plugins.toggleterm")]] })

		-- Harpoon
		use("ThePrimeagen/harpoon")

		-- Disturbance free writing
		use({
			"folke/zen-mode.nvim",
			config = [[require("plugins.zen-mode")]],
			event = "BufEnter",
		})

		use({
			"folke/trouble.nvim",
			cmd = {
				"Trouble",
				"TroubleRefresh",
				"TroubleClose",
				"TroubleToggle",
			},
			config = [[require("plugins.trouble")]],
		})

		-- Neogen
		use({
			"danymat/neogen",
		})

		-- Git
		use({
			"lewis6991/gitsigns.nvim",
			event = "BufRead",
			config = function()
				vim.cmd([[highlight GitSignsCurrentLineBlame gui=bold,italic guifg=#938f8f]])
				require("gitsigns").setup({
					current_line_blame_opts = {
						virt_text = true,
						virt_text_pos = "eol", -- "eol" | "overlay" | "right_align"
						delay = 1000,
						ignore_whitespace = false,
					},
					current_line_blame = true,
					add = { hl = "GitSignsAdd", text = "│", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
					change = {
						hl = "GitSignsChange",
						text = "│",
						numhl = "GitSignsChangeNr",
						linehl = "GitSignsChangeLn",
					},
					delete = {
						hl = "GitSignsDelete",
						text = "│",
						numhl = "GitSignsDeleteNr",
						linehl = "GitSignsDeleteLn",
					},
					topdelete = {
						hl = "GitSignsDelete",
						text = "│",
						numhl = "GitSignsDeleteNr",
						linehl = "GitSignsDeleteLn",
					},
					changedelete = {
						hl = "GitSignsChange",
						text = "│",
						numhl = "GitSignsChangeNr",
						linehl = "GitSignsChangeLn",
					},
					current_line_blame_formatter_opts = {
						relative_time = true,
					},
					debug_mode = true,
				})
			end,
		})

		-- Better performance :)
		use({
			"lewis6991/impatient.nvim",
		})
		use("nathom/filetype.nvim")

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
