-- ULES TO FOLLOW
-- 1. use ({})
-- 2. lazy load ( see :h events )
-- 3. add comment or sections
-- 4. add disable option

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
    print("Cloning packer...\nSettting up NvHack")
    vim.cmd([[packadd packer.nvim]])
end

-- For future packer
-- local border = {
--     { "╭", "CmpBorder" },
--     { "─", "CmpBorder" },
--     { "╮", "CmpBorder" },
--     { "│", "CmpBorder" },
--     { "╯", "CmpBorder" },
--     { "─", "CmpBorder" },
--     { "╰", "CmpBorder" },
--     { "│", "CmpBorder" },
-- }

return require("packer").startup({
    function(use)
        -- Packer can manage itself
        use({
            "wbthomason/packer.nvim",
        })

        -- Better performance
        use({
            "lewis6991/impatient.nvim",
            disable = false,
            config = function()
                require("plugins.config.other")
            end,
        })

        -- Dependencies
        use({
            "nvim-lua/plenary.nvim",
            disable = false,
        })
        use({
            "kyazdani42/nvim-web-devicons",
            after = "nvim-base16.lua",
            disable = false,
        })
        use({
            "MunifTanjim/nui.nvim",
            disable = false,
        })

        -- Theme
        use({
            "ThemerCorp/themer.lua",
            branch = "0.7",
            disable = true,
        })
        use({
            "bryant-the-coder/nvim-base16.lua",
            disable = false,
        })

        -- Bufferline
        use({
            "akinsho/bufferline.nvim",
            after = "nvim-web-devicons",
            event = "BufEnter",
            disable = false,
            config = function()
                require("plugins.config.bufferline")
            end,
        })

        -- Neorg
        -- Notes taking
        use({
            "nvim-neorg/neorg",
            ft = "norg",
            after = "nvim-treesitter",
            disable = false,
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
            disable = true,
        })
        use({
            "nvim-neo-tree/neo-tree.nvim",
            branch = "v2.x",
            cmd = {
                "Neotree",
            },
            disable = true,
            config = function()
                require("plugins.config.explorer")
            end,
        })

        -- Treesitter
        use({
            "nvim-treesitter/nvim-treesitter",
            event = { "BufRead", "BufNewFile" },
            module = "nvim-treesitter",
            disable = false,
            run = ":TSUpdate",
            config = function()
                require("plugins.config.treesitter")
            end,
        })

        -- Vscode like rainbow parenthesis
        use({
            "p00f/nvim-ts-rainbow",
            after = "nvim-treesitter",
            event = "InsertEnter",
            opt = true,
            disable = false,
        })

        -- Auto complete tag
        use({
            "windwp/nvim-ts-autotag",
            opt = true,
            event = "InsertEnter",
            ft = { "html", "tsx" },
            disable = false,
        })

        use({
            "nvim-treesitter/nvim-treesitter-textobjects",
            after = "nvim-treesitter",
            event = "InsertEnter",
            opt = true,
            disable = false,
        })

        -- Complete pairs automatically
        use({
            "windwp/nvim-autopairs",
            after = "nvim-cmp",
            event = "InsertEnter",
            opt = true,
            disable = false,
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
            disable = false,
        })

        -- LSP
        use({
            "neovim/nvim-lspconfig",
            module = "lspconfig",
            event = "BufRead",
            disable = false,
            config = function()
                require("plugins.config.lsp")
            end,
        })

        -- LSP installer
        use({
            "williamboman/nvim-lsp-installer",
            disable = false,
        })

        -- JSON
        use({
            "b0o/schemastore.nvim",
            after = "nvim-lspconfig",
            event = "InsertEnter",
            disable = false,
        })

        use({
            "kosayoda/nvim-lightbulb",
            after = "nvim-lspconfig",
            event = "BufEnter",
            config = function()
                require("plugins.config.lightbulb")
            end,
            disable = true,
        })

        use({
            "weilbith/nvim-code-action-menu",
            cmd = "CodeActionMenu",
            event = "BufEnter",
            after = "nvim-lspconfig",
            disable = true,
        })

        -- Formatting
        use({
            "jose-elias-alvarez/null-ls.nvim",
            event = { "BufRead", "InsertEnter" },
            disable = false,
            config = function()
                require("plugins.config.null-ls")
            end,
        })

        -- Completion
        use({
            "hrsh7th/nvim-cmp",
            module = "cmp",
            -- branch = "dev",
            -- commit = "5cbce7907493be1d5d14027c7eb016f63b0252f8", -- There is conflicts in dev branch
            event = { "InsertEnter", "CmdLineEnter", "InsertCharPre" }, -- InsertCharPre Due to luasnip
            after = { "LuaSnip" },
            disable = false,
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

        -- Snippet
        use({
            "L3MON4D3/LuaSnip",
            requires = {
                "rafamadriz/friendly-snippets",
                event = "InsertEnter",
            },
            module = "luasnip",
            event = "InsertEnter",
            disable = false,
            config = function()
                require("plugins.config.snippets")
            end,
        })

        -- Telescope
        -- Fuzzy-finder
        use({
            "nvim-telescope/telescope.nvim",
            disable = false,
            module = "telescope",
            cmd = "Telescope",
        })
        use({
            "nvim-telescope/telescope-fzf-native.nvim",
            run = "make",
            disable = false,
            after = "telescope.nvim",
        })

        -- Colorizer
        use({
            "norcalli/nvim-colorizer.lua",
            disable = false,
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
            disable = false,
            opt = true,
            config = function()
                require("plugins.config.indent")
            end,
        })

        -- Comment
        use({
            "numToStr/Comment.nvim",
            keys = {
                "gcc",
                "gc",
                "gcb",
                "gb",
            },
            opt = true,
            requires = {
                "JoosepAlviste/nvim-ts-context-commentstring",
                event = "InsertEnter",
            },
            disable = false,
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
            "bryant-the-coder/harpoon",
            module = "harpoon",
            opt = true,
            after = "telescope.nvim",
            disable = false,
            config = function()
                require("harpoon").setup({
                    global_settings = {
                        save_on_toggle = false,
                        save_on_change = true,
                        enter_on_sendcmd = false,
                        tmux_autoclose_windows = false,
                        excluded_filetypes = { "harpoon", "package.lock.json" },
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
        use({
            "folke/twilight.nvim",
            cmd = {
                "Twilight",
                "TwilightEnable",
                "TwilightDisable",
            },
            event = "BufEnter",
            after = "nvim-cmp",
            config = function()
                require("plugins.config.twilight")
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
            disable = false,
            config = function()
                require("plugins.config.trouble")
            end,
        })

        -- Neogen
        use({
            "danymat/neogen",
            after = "LuaSnip",
            disable = false,
            config = function()
                require("neogen").setup({
                    snippet_engine = "luasnip",
                })
            end,
        })

        -- Git intergrations
        use({
            "lewis6991/gitsigns.nvim",
            event = "BufRead",
            opt = true,
            disable = false,
            config = function()
                require("plugins.config.gitsigns")
            end,
        })

        -- Share code
        use({
            "rktjmp/paperplanes.nvim",
            event = "BufEnter",
            cmd = "PP",
            opt = true,
            disable = false,
            -- disable = true,
        })

        -- Faster movement
        use({
            "ggandor/lightspeed.nvim",
            event = "BufEnter",
            opt = true,
            disable = false,
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
            disable = false,
            config = function()
                require("plugins.config.notify")
            end,
        })

        -- Refactoring purposes
        use({
            "ThePrimeagen/refactoring.nvim",
            opt = true,
            disable = true,
        })

        -- Discord rich presence
        use({
            "andweeb/presence.nvim",
            event = "BufEnter",
            disable = false,
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
            title = "Downloading / Updating", -- Packer, Installing
            done_sym = "",
            error_syn = "×",
            -- open_fn = function()
            --     return require("packer.util").float({ border = border })
            -- end,
        },
        max_jobs = 6,
    },
})
