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

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border })
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border })
