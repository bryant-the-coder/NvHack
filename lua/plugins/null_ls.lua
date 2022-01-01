local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

-- Thanks to ChrisAtMachine neovim-from-scratch
local formatting = null_ls.builtins.formatting
local formatting = null_ls.builtins.formatting

null_ls.setup({
	debug = false,
	sources = {
		formatting.prettier.with({ extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } }),
		formatting.stylua,
	},
})
