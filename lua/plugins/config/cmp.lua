local present, cmp = pcall(require, "cmp")
if not present then
	return
end

local present, neogen = pcall(require, "neogen")
if not present then
	return
end

-- luasnip
local luasnip = require("luasnip")
local has_words_before = function()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local kind = cmp.lsp.CompletionItemKind

cmp.setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},
	mapping = {
		["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
		["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
		["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
		["<C-e>"] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		}),
		["<CR>"] = cmp.mapping(function(fallback)
			if not cmp.confirm({ select = true }) then
				require("pairs.enter").type()
			end
		end),
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			elseif neogen.jumpable() then
				neogen.jump_next()
			elseif has_words_before() then
				cmp.complete()
			else
				fallback()
			end
		end, { "i", "s" }),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif neogen.jumpable(true) then
				neogen.jump_prev()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),
	},
	formatting = {
		-- fields = { "kind", "menu", "abbr" },
		format = function(entry, vim_item)
			local kind_icons = {
				Text = "",
				Method = "",
				Function = "",
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
				TypeParameter = "",
			}
			vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind)
			vim_item.menu = ({
				buffer = "[BUF]",
				nvim_lsp = "[LSP]",
				nvim_lua = "[API]",
				path = "[PATH]",
				luasnip = "[SNIP]",
				npm = "[NPM]",
			})[entry.source.name]
			return vim_item
		end,
	},
	documentation = {
		border = "rounded",
	},
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "lspkind" },
		-- { name = "vsnip" },
		{ name = "luasnip" },
		{ name = "buffer", keyword_length = 5 },
		{ name = "npm", keyword_length = 2 },
	}),
})
cmp.setup.cmdline("/", {
	sources = {
		{ name = "buffer" },
	},
})

cmp.event:on("confirm_done", function(event)
	local item = event.entry:get_completion_item()
	local parensDisabled = item.data and item.data.funcParensDisabled or false
	if not parensDisabled and (item.kind == kind.Method or item.kind == kind.Function) then
		print("pairs are now active")
		require("pairs.bracket").type_left("(")
	end
end)
