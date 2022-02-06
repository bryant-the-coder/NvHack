local null_ls = require("null-ls")
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
	debug = false,
	sources = {
		formatting.prettier.with({
			extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" },
		}),
		formatting.stylua,
	},
	-- Format on save (laggy)
	-- on_attach = function(client)
	-- 	if client.resolved_capabilities.document_formatting then
	-- 		vim.cmd([[
	--            augroup LspFormatting
	--                autocmd! * <buffer>
	--                autocmd BufWritePre <buffer> vim.lsp.buf.formatting_sync(nil, 2000)
	--            augroup END
	--            ]])
	-- 	end
	-- end,
})
