local present, cmp = pcall(require, "cmp")
if not present then
	return
end

-- vsnip
local feedkey = function(key, mode)
	vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

-- neogen
local has_words_before = function()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local neogen = require("neogen")
local t = function(str)
	return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local lspkind = require("lspkind")

cmp.setup({
	snippet = {
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body)
		end,
	},
	mapping = {
		["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
		["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
		["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
		["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
		["<C-e>"] = cmp.mapping({
			i = cmp.mapping.abort(),
			c = cmp.mapping.close(),
		}),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif vim.fn["vsnip#available"](1) == 1 then
				feedkey("<Plug>(vsnip-expand-or-jump)", "")
			elseif has_words_before() then
				cmp.complete()
			else
				fallback()
			end
			if neogen.jumpable() then
				vim.fn.feedkeys(t("<cmd>lua require('neogen').jump_next()<CR>"), "")
			else
				fallback()
			end
		end, { "i", "s" }),

		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif vim.fn["vsnip#jumpable"](-1) == 1 then
				feedkey("<Plug>(vsnip-jump-prev)", "")
			end
			if neogen.jumpable(-1) then
				vim.fn.feedkeys(t("<cmd>lua require('neogen').jump_prev()<CR>"), "")
			else
				fallback()
			end
		end, { "i", "s" }),
	},
	formatting = {
		-- fields = { "kind", "abbr", "menu" },
		format = lspkind.cmp_format({
			with_text = true,
			menu = {
				buffer = "[BUF]",
				nvim_lsp = "[LSP]",
				nvim_lua = "[API]",
				path = "[PATH]",
				vsnip = "[SNIP]",
				npm = "[NPM]",
			},
		}),
	},
	documentation = {
		border = "rounded",
	},
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "lspkind" },
		{ name = "vsnip" },
		{ name = "buffer", keyword_length = 2 },
		{ name = "npm", keyword_length = 2 },
	}),
})
cmp.setup.cmdline("/", {
	sources = {
		{ name = "buffer" },
	},
})
