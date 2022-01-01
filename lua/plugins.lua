local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- Dependencies
    use 'nvim-lua/plenary.nvim'
    use 'kyazdani42/nvim-web-devicons'

    -- Theme
    use 'folke/tokyonight.nvim'
    use 'morhetz/gruvbox'
    use {'rose-pine/neovim', as = "rose-pine"}
    use 'shaunsingh/moonlight.nvim'

    -- Explorer menu
    use {'kyazdani42/nvim-tree.lua', config = [[require('plugins.nvim-tree')]]}

    -- Treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ":TSUpdate",
        requires = {
         'p00f/nvim-ts-rainbow',
         'nvim-treesitter/playground',
         'windwp/nvim-ts-autotag',
         {'windwp/nvim-autopairs', config = [[require('plugins.autopairs')]]},
      },
      config = [[require('plugins.treesitter')]]
    }

    -- Statusline
    use {'nvim-lualine/lualine.nvim', config = [[require('plugins.lualine')]]}

    -- Telescope
    use {
      'nvim-telescope/telescope.nvim',
      cmd = 'Telescope',
      module = 'telescope',
      config = [[require('plugins.telescope')]],
    }

    -- Dashboard
    use {'glepnir/dashboard-nvim', config = [[require('plugins.dashboard')]]}

    -- Bufferline
    use {'akinsho/bufferline.nvim'--[[ , config = [[require('plugins.bufferline')]] }

    -- Colorizer
    use {
      'norcalli/nvim-colorizer.lua',
      config = [[require('plugins.other')]]
    }

    -- LSP
    use {'neovim/nvim-lspconfig', config = [[require('plugins.lsp')]]}
    use {
      'hrsh7th/nvim-cmp',
      requires = {
        'hrsh7th/cmp-vsnip',
        'hrsh7th/cmp-nvim-lsp',
        'onsails/lspkind-nvim',
        {'hrsh7th/vim-vsnip', after = 'nvim-cmp'},
        {'hrsh7th/cmp-nvim-lsp', after = 'nvim-cmp'},
        {'hrsh7th/cmp-buffer', after = 'nvim-cmp'},
        {'hrsh7th/cmp-path', after = 'nvim-cmp'},
        {'hrsh7th/cmp-path', after = 'nvim-cmp'},
        {'David-Kunz/cmp-npm', after = 'nvim-cmp'}
      },
      config = [[require('plugins.cmp')]]
    }

    -- LSP highlight
    use {'folke/lsp-colors.nvim', config = [[require('plugins.other')]]}

    -- Indentation
    use {
      'lukas-reineke/indent-blankline.nvim',
      config = [[require('plugins.other')]]
    }

    -- Auto-comment
    use {
      'numToStr/Comment.nvim',
      'JoosepAlviste/nvim-ts-context-commentstring',
      config = [[require('plugins.comment')]]
    }

    -- Terminal
    use {'akinsho/toggleterm.nvim', config = [[require('plugins.toggleterm')]]}

    -- Harpoon
    use 'ThePrimeagen/harpoon'

    -- Disturbance free writing
    use {
    'folke/twilight.nvim',
    'folke/zen-mode.nvim'
    }

    -- Git
    use {
      'lewis6991/gitsigns.nvim',
      config = [[require('plugins.other')]]
    }

  if packer_bootstrap then
    require('packer').sync()
  end
end)
