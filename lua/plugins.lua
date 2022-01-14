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

return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	-- Dependencies
	use("nvim-lua/plenary.nvim")
	use("kyazdani42/nvim-web-devicons")

	-- Theme
	use( "folke/tokyonight.nvim")
  use( "tiagovla/tokyodark.nvim" )
  use( "rebelot/kanagawa.nvim" )
  use({ "rose-pine/neovim", as = "rose-pine" })
  use({ "catppuccin/nvim", as = "catppuccin" })

	-- Explorer menu
	use({ "kyazdani42/nvim-tree.lua", config = [[require("plugins.nvim-tree")]] })

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		requires = {
			"p00f/nvim-ts-rainbow",
			"nvim-treesitter/playground",
			"windwp/nvim-ts-autotag",
			{ "windwp/nvim-autopairs", config = [[require("plugins.autopairs")]] },
		},
		config = [[require("plugins.treesitter")]],
	})

	-- Statusline
  use({ "nvim-lualine/lualine.nvim", config = [[require("plugins.lualine")]] })

	-- Telescope
	use({
		"nvim-telescope/telescope.nvim",
		cmd = "Telescope",
		module = "telescope",
		config = [[require("plugins.telescope")]],
	})

	-- Dashboard
	use({ "glepnir/dashboard-nvim", config = [[require("plugins.dashboard")]] })

	-- Bufferline
	use({ "akinsho/bufferline.nvim", config = [[require("plugins.bufferline")]] })

	-- Colorizer
	use({
		"norcalli/nvim-colorizer.lua",
		config = [[require("plugins.other")]],
	})

	-- LSP
	use({ "neovim/nvim-lspconfig", config = [[require("plugins.lsp")]] })
	use({
		"hrsh7th/nvim-cmp",
		requires = {
			"hrsh7th/cmp-vsnip",
			"hrsh7th/cmp-nvim-lsp",
			"onsails/lspkind-nvim",
			{ "hrsh7th/vim-vsnip", after = "nvim-cmp" },
			{ "hrsh7th/cmp-nvim-lsp", after = "nvim-cmp" },
			{ "hrsh7th/cmp-buffer", after = "nvim-cmp" },
			{ "hrsh7th/cmp-path", after = "nvim-cmp" },
			{ "hrsh7th/cmp-path", after = "nvim-cmp" },
			{ "David-Kunz/cmp-npm", after = "nvim-cmp" },
		},
		config = [[require("plugins.cmp")]],
	})

	use({
		"jose-elias-alvarez/null-ls.nvim",
		config = [[require("plugins.null-ls")]],
	})

	-- LSP highlight
	use({ "folke/lsp-colors.nvim", config = [[require("plugins.other")]] })

	-- Indentation
	use({
		"lukas-reineke/indent-blankline.nvim",
		config = [[require("plugins.other")]],
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
		"folke/twilight.nvim",
		config = [[require("plugins.twilight")]],
	})

	use({
		"folke/zen-mode.nvim",
		config = [[require("plugins.zen-mode")]],
	})

  use ({
    "folke/trouble.nvim",
    config = [[require("plugins.trouble")]],
  })

	-- Git
	use({
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup({
				current_line_blame_opts = {
					virt_text = true,
					virt_text_pos = "right_align", -- "eol" | "overlay" | "right_align"
					delay = 1000,
					ignore_whitespace = false,
				},
				current_line_blame = true,
				signs = {
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
				},
				current_line_blame_formatter_opts = {
					relative_time = true,
				},
        debug_mode = true
			})
		end,
	})
  use "tpope/vim-fugitive"

  use ({
    "nvim-neorg/neorg",
    config = [[require("plugins.neorg")]]
  })

if packer_bootstrap then
		require("packer").sync()
	end
end)
