local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
    return
end

-- Taken from max. Thanks max

-- local border = {
--     { "┏", "FloatBorder" },
--     { "━", "FloatBorder" },
--     { "┓", "FloatBorder" },
--     { "┃", "FloatBorder" },
--     { "┛", "FloatBorder" },
--     { "━", "FloatBorder" },
--     { "┗", "FloatBorder" },
--     { "┃", "FloatBorder" },
-- }

-- local border = {
-- 	{ "╔", "FloatBorder" },
-- 	{ "═", "FloatBorder" },
-- 	{ "╗", "FloatBorder" },
-- 	{ "║", "FloatBorder" },
-- 	{ "╝", "FloatBorder" },
-- 	{ "═", "FloatBorder" },
-- 	{ "╚", "FloatBorder" },
-- 	{ "║", "FloatBorder" },
-- }

local border = {
    { "╭", "FloatBorder" },
    { "─", "FloatBorder" },
    { "╮", "FloatBorder" },
    { "│", "FloatBorder" },
    { "╯", "FloatBorder" },
    { "─", "FloatBorder" },
    { "╰", "FloatBorder" },
    { "│", "FloatBorder" },
}

-- Code from max
local codes = {
    no_matching_function = {
        message = " Can't find a matching function",
        "redundant-parameter",
        "ovl_no_viable_function_in_call",
    },
    empty_block = {
        message = " That shouldn't be empty here",
        "empty-block",
    },
    missing_symbol = {
        message = " Here should be a symbol",
        "miss-symbol",
    },
    expected_semi_colon = {
        message = " Please put the `;` or `,`",
        "expected_semi_declaration",
        "miss-sep-in-table",
        "invalid_token_after_toplevel_declarator",
    },
    redefinition = {
        message = " That variable was defined before",
        "redefinition",
        "redefined-local",
    },
    no_matching_variable = {
        message = " Can't find that variable",
        "undefined-global",
        "reportUndefinedVariable",
    },
    trailing_whitespace = {
        message = " Whitespaces are useless",
        "trailing-whitespace",
        "trailing-space",
    },
    unused_variable = {
        message = " Don't define variables you don't use",
        "unused-local",
    },
    unused_function = {
        message = " Don't define functions you don't use",
        "unused-function",
    },
    useless_symbols = {
        message = " Remove that useless symbols",
        "unknown-symbol",
    },
    wrong_type = {
        message = " Try to use the correct types",
        "init_conversion_failed",
    },
    undeclared_variable = {
        message = " Have you delcared that variable somewhere?",
        "undeclared_var_use",
    },
    lowercase_global = {
        message = " Should that be a global? (if so make it uppercase)",
        "lowercase-global",
    },
}

local signs = {
    { name = "DiagnosticSignError", text = "" },
    { name = "DiagnosticSignWarn", text = "" },
    { name = "DiagnosticSignInfo", text = "" },
    { name = "DiagnosticSignHint", text = "" },
}
for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

local config = {
    signs = true,
    underline = true,
    severity_sort = true,
    update_in_insert = true,
    virtual_text = false,

    float = {
        focusable = false,
        scope = "cursor",
        source = true,
        border = border,
        header = { "Mistakes you made:", "DiagnosticHeader" },
        prefix = function(diagnostic, i, total)
            local icon, highlight
            if diagnostic.severity == 1 then
                icon = ""
                highlight = "DiagnosticError"
            elseif diagnostic.severity == 2 then
                icon = ""
                highlight = "DiagnosticWarn"
            elseif diagnostic.severity == 3 then
                icon = ""
                highlight = "DiagnosticInfo"
            elseif diagnostic.severity == 4 then
                icon = ""
                highlight = "DiagnosticHint"
            end
            return i .. "/" .. total .. " " .. icon .. "  ", highlight
        end,
        -- Code from max
        format = function(diagnostic)
            -- dump(diagnostic)
            if diagnostic.user_data == nil then
                return diagnostic.message
            elseif vim.tbl_isempty(diagnostic.user_data) then
                return diagnostic.message
            end
            local code = diagnostic.user_data.lsp.code
            for _, table in pairs(codes) do
                if vim.tbl_contains(table, code) then
                    return table.message
                end
            end
            return diagnostic.message
        end,

        -- Code from TJ
        -- format = function(d)
        --     local t = vim.deepcopy(d)
        --     local code = d.code or d.user_data.lsp.code
        --     if code then
        --         t.message = string.format("%s -> (%s)", t.message, code):gsub("1. ", "")
        --     end
        --     return t.message
        -- end,

        -- Code from santigo-zero
        -- format = function(diagnostic)
        --     return string.format(
        --         "%s (%s) [%s]",
        --         diagnostic.message,
        --         diagnostic.source,
        --         diagnostic.code or diagnostic.user_data.lsp.code
        --     )
        -- end,
    },
}

vim.diagnostic.config(config)

local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

local completion = capabilities.textDocument.completion.completionItem
capabilities.textDocument.completion.completionItem.preselectSupport = true
capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
capabilities.textDocument.completion.completionItem.deprecatedSupport = true
capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
capabilities.textDocument.completion.completionItem.tagSupport = {
    valueSet = { 1 },
}
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = { "documentation", "detail", "additionalTextEdits" },
}
capabilities.textDocument.codeAction = {
    dynamicRegistration = false,
    codeActionLiteralSupport = {
        codeActionKind = {
            valueSet = {
                "",
                "quickfix",
                "refactor",
                "refactor.extract",
                "refactor.inline",
                "refactor.rewrite",
                "source",
                "source.organizeImports",
            },
        },
    },
}

local function lsp_highlight_document(client, bufnr)
    if client.resolved_capabilities.document_highlight then
        vim.api.nvim_create_augroup("lsp_document_highlight", { clear = true })
        vim.api.nvim_create_autocmd("CursorHold", {
            callback = function()
                vim.lsp.buf.document_highlight()
            end,
            buffer = bufnr,
        })
        vim.api.nvim_create_autocmd("CursorMoved", {
            callback = function()
                vim.lsp.buf.clear_references()
            end,
            buffer = bufnr,
        })
    end

    vim.api.nvim_set_hl(0, "LspReferenceText", { nocombine = true, reverse = false, underline = true })
    vim.api.nvim_set_hl(0, "LspReferenceRead", { nocombine = true, reverse = false, underline = true })
    vim.api.nvim_set_hl(0, "LspReferenceWrite", { nocombine = true, reverse = false, underline = true })
end

local servers = {
    "emmet_ls",
    "html",
    "tsserver",
    "jsonls",
    "cssls",
    "clangd",
    "rust_analyzer",
    "sumneko_lua",
    "yamils",
    "ltex",
}

-- Setting up installer
require("nvim-lsp-installer").setup({
    ensure_installed = servers,
})

local function on_attach(client, bufnr)
    require("plugins.config.lsp.on_attach").setup(client, bufnr)
end

-- sumneko_lua
local sumneko = {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" },
            },
            workspace = {
                library = {
                    [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                    [vim.fn.stdpath("config") .. "/lua"] = true,
                },
            },
        },
    },
}
local use_lua_dev = false
if use_lua_dev then
    local luadev = require("lua-dev").setup({
        library = {
            vimruntime = true,
            types = true,
            plugins = { "nvim-treesitter", "plenary.nvim", "telescope.nvim" },
        },
        lspconfig = sumneko,
    })

    lspconfig.sumneko_lua.setup(luadev)
else
    lspconfig.sumneko_lua.setup(sumneko)
end

-- JSON
lspconfig.jsonls.setup({
    on_attach = on_attach,
})

-- Clangd / C++
local clangd_defaults = require("lspconfig.server_configurations.clangd")
local clangd_configs = vim.tbl_deep_extend("force", clangd_defaults["default_config"], {
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = {
        "clangd",
        "-j=4",
        "--background-index",
        "--clang-tidy",
        "--fallback-style=llvm",
        "--all-scopes-completion",
        "--completion-style=detailed",
        "--header-insertion=iwyu",
        "--header-insertion-decorators",
        "--pch-storage=memory",
    },
})
require("clangd_extensions").setup({
    server = clangd_configs,
    extensions = {
        -- defaults:
        -- Automatically set inlay hints (type hints)
        autoSetHints = true,
        -- Whether to show hover actions inside the hover window
        -- This overrides the default hover handler
        hover_with_actions = true,
        -- These apply to the default ClangdSetInlayHints command
        inlay_hints = {
            -- Only show inlay hints for the current line
            only_current_line = false,
            -- Event which triggers a refersh of the inlay hints.
            -- You can make this "CursorMoved" or "CursorMoved,CursorMovedI" but
            -- not that this may cause  higher CPU usage.
            -- This option is only respected when only_current_line and
            -- autoSetHints both are true.
            only_current_line_autocmd = "CursorHold",
            -- whether to show parameter hints with the inlay hints or not
            show_parameter_hints = true,
            -- prefix for parameter hints
            parameter_hints_prefix = "<- ",
            -- prefix for all the other hints (type, chaining)
            other_hints_prefix = "=> ",
            -- whether to align to the length of the longest line in the file
            max_len_align = false,
            -- padding from the left if max_len_align is true
            max_len_align_padding = 1,
            -- whether to align to the extreme right or not
            right_align = false,
            -- padding from the right if right_align is true
            right_align_padding = 7,
            -- The color of the hints
            highlight = "Comment",
            -- The highlight group priority for extmark
            priority = 100,
        },
        ast = {
            role_icons = {
                type = "",
                declaration = "",
                expression = "",
                specifier = "",
                statement = "",
                ["template argument"] = "",
            },

            kind_icons = {
                Compound = "",
                Recovery = "",
                TranslationUnit = "",
                PackExpansion = "",
                TemplateTypeParm = "",
                TemplateTemplateParm = "",
                TemplateParamObject = "",
            },

            highlights = {
                detail = "Comment",
            },
            memory_usage = {
                border = border,
            },
            symbol_info = {
                border = border,
            },
        },
    },
})

-- Rust
lspconfig.rust_analyzer.setup({
    on_attach = on_attach,
    capabilities = capabilities,
})
