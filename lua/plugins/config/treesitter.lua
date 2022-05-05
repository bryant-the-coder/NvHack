local status_ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not status_ok then
    return
end

local incremental_selection = require("nvim-treesitter.incremental_selection")
local parser_configs = require("nvim-treesitter.parsers").get_parser_configs()

local langs = {
    "lua",
    "json",
    "rust",
    "norg",
    "norg_meta",
    "norg_table",
    "toml",
    "html",
    "javascript",
    "scss",
}

parser_configs.norg_meta = {
    install_info = {
        url = "https://github.com/nvim-neorg/tree-sitter-norg-meta",
        files = { "src/parser.c" },
        branch = "main",
    },
}

parser_configs.norg_table = {
    install_info = {
        url = "https://github.com/nvim-neorg/tree-sitter-norg-table",
        files = { "src/parser.c" },
        branch = "main",
    },
}
require("nvim-treesitter.install").compilers = { "clang", "gcc" }
treesitter.setup({
    ensure_installed = langs,
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

require("treesitter-context").setup({
    enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
    throttle = true, -- Throttles plugin updates (may improve performance)
    max_lines = 4, -- How many lines the window should span. Values <= 0 mean no limit.
})
