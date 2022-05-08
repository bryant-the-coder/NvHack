local present, cmp = pcall(require, "cmp")
if not present then
    return
end

-- luasnip
local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local luasnip = require("luasnip")

local kind_icons = {
    Text = "",
    Method = "",
    Function = "",
    Constructor = "",
    Field = "ﰠ",
    Variable = "",
    Class = "ﴯ",
    Interface = "",
    Module = "",
    Property = "ﰠ",
    Unit = "塞",
    Value = "",
    Enum = "",
    Keyword = "",
    Snippet = "",
    Color = "",
    File = "",
    Reference = "",
    Folder = "",
    EnumMember = "",
    Constant = "",
    Struct = "פּ",
    Event = "",
    Operator = "",
    TypeParameter = "",
}

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
    { "╭", "CmpBorder" },
    { "─", "CmpBorder" },
    { "╮", "CmpBorder" },
    { "│", "CmpBorder" },
    { "╯", "CmpBorder" },
    { "─", "CmpBorder" },
    { "╰", "CmpBorder" },
    { "│", "CmpBorder" },
}
cmp.setup({
    window = {
        completion = {
            border = border,
            scrollbar = "┃",
            -- scrollbar = "║",
        },
        documentation = {
            border = border,
            -- scrollbar = "║",
            scrollbar = "┃",
        },
    },
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
        ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
        ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
        ["<C-y>"] = cmp.config.disable,
        ["<C-e>"] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        }),

        ["<CR>"] = cmp.mapping({
            i = cmp.mapping.confirm({
                select = true,
                behavior = cmp.ConfirmBehavior.Insert,
            }),
            c = cmp.mapping.confirm({
                select = false,
                behavior = cmp.ConfirmBehavior.Select,
            }),
        }),
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            elseif has_words_before() then
                cmp.complete()
            else
                fallback()
            end
        end, { "i", "s" }),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { "i", "s" }),
    }),
    sorting = {
        comparators = {
            cmp.config.compare.offset,
            cmp.config.compare.exact,
            cmp.config.compare.recently_used,
            require("clangd_extensions.cmp_scores"),
            cmp.config.compare.kind,
            cmp.config.compare.sort_text,
            cmp.config.compare.length,
            cmp.config.compare.order,
        },
    },
    formatting = {
        -- fields = { "kind", "menu", "abbr" },
        -- format = function(entry, vim_item)
        --     vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind)
        --     --[[ vim_item.menu = ({
        --         buffer = "[BUF]",
        --         nvim_lsp = "[LSP]",
        --         nvim_lua = "[API]",
        --         path = "[PATH]",
        --         luasnip = "[SNIP]",
        --         npm = "[NPM]",
        --         neorg = "[NEORG]",
        --     })[entry.source.name] ]]
        --     return vim_item
        -- end,
        fields = { "kind", "abbr", "menu" },
        format = function(_, vim_item)
            vim_item.menu = vim_item.kind
            vim_item.kind = kind_icons[vim_item.kind]
            return vim_item
        end,
    },
    sources = cmp.config.sources({
        { name = "nvim_lsp", priority = "9" },
        { name = "luasnip", priority = "8" },
        { name = "buffer", keyword_length = 5 },
        { name = "npm", keyword_length = 2 },
        { name = "neorg" },
    }),
})

-- cmp.setup.cmdline("/", {
--     sources = {
--         { name = "buffer" },
--     },
-- })

-- cmp.setup.cmdline(":", {
--     sources = {
--         { name = "cmdline" },
--     },
-- })

cmp.setup.cmdline(":", {
    sources = {
        { name = "cmdline", group_index = 1 },
        -- { name = "cmdline" },
        { name = "cmdline_history", group_index = 2 },
    },
    view = {
        entries = { name = "wildmenu", separator = " | " },
    },
    mapping = cmp.mapping.preset.cmdline(),
})

cmp.setup.cmdline("/", {
    sources = {
        { name = "cmdline_history" },
        { name = "buffer" },
    },
    view = {
        entries = { name = "wildmenu", separator = " | " },
    },
    mapping = cmp.mapping.preset.cmdline(),
})
