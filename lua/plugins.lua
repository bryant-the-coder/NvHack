local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function()
    -- Packer can manage itself
    use "wbthomason/packer.nvim"

    -- Dependencies
    use "nvim-lua/plenary.nvim"
    use "kyazdani42/nvim-web-devicons"

    -- Theme
    use "folke/tokyonight.nvim"
    use "morhetz/gruvbox"
    use "drewtempelmeyer/palenight.vim"
    use "joshdick/onedark.vim"
    use "arcticicestudio/nord-vim"
    use {"rose-pine/neovim", as = "rose-pine"}

    -- Explorer menu
    use {"kyazdani42/nvim-tree.lua"}

    -- Treesitter
    use {
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
    }
    use "p00f/nvim-ts-rainbow"
    use "nvim-treesitter/playground"
    use "windwp/nvim-ts-autotag"
    use "windwp/nvim-autopairs"

    -- Statusline
    use "nvim-lualine/lualine.nvim"

    -- Telescope
    use {"nvim-telescope/telescope.nvim"}

    -- Dashboard
    use "glepnir/dashboard-nvim"

    -- Bufferline
    use "akinsho/bufferline.nvim"

    -- Colorizer
    use "norcalli/nvim-colorizer.lua"

    -- LSP
    use "neovim/nvim-lspconfig"
    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"
    use "onsails/lspkind-nvim"
    use "folke/lsp-colors.nvim"
    use "David-Kunz/cmp-npm"
    use "hrsh7th/cmp-vsnip"
    use "hrsh7th/vim-vsnip"

    -- Indentation
    use "lukas-reineke/indent-blankline.nvim"

    -- Auto-comment
    use "numToStr/Comment.nvim"
    use "JoosepAlviste/nvim-ts-context-commentstring"

    -- Terminal
    use "akinsho/toggleterm.nvim"

    -- Harpoon
    use "ThePrimeagen/harpoon"

    -- Disturbance free writing
    use {
    "folke/twilight.nvim",
    "folke/zen-mode.nvim"
    }

    -- Git
    use "lewis6991/gitsigns.nvim"

end)
