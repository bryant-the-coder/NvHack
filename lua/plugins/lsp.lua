local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
local lspconfig = require("lspconfig")
local capabilities1 = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
local configs = require("lspconfig/configs")

-----------------------------------
--           Icons               --
-----------------------------------
local signs = {
	{ name = "DiagnosticSignError", text = "" },
	{ name = "DiagnosticSignWarn", text = "" },
	{ name = "DiagnosticSignHint", text = "" },
	{ name = "DiagnosticSignInfo", text = "" },
}
for _, sign in ipairs(signs) do
	vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

-----------------------------------
--           Basics              --
-----------------------------------
vim.diagnostic.config({
	virtual_text = {
		source = "always",
	},
	float = {
		source = "always",
		prefix = "",
		border = "rounded",
	},
	signs = true,
	underline = true,
	severity_sort = true,
	update_in_insert = true,
})

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
	border = "rounded",
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
	border = "rounded",
})

-----------------------------------
--           Servers             --
-----------------------------------
-- html
lspconfig.html.setup({
	cmd = { "vscode-html-language-server.cmd", "--stdio" },
	capabilities = capabilities,
})

-- scss/css/ls
lspconfig.cssls.setup({
	cmd = { "vscode-css-language-server.cmd", "--stdio" },
	capabilities = capabilities,
})

-- js/typescript
lspconfig.tsserver.setup({
	cmd = { "typescript-language-server.cmd", "--stdio" },
	capabilities = capabilities1,
	filetypes = {
		"javascript",
		"javascriptreact",
		"javascript.jsx",
		"typescript",
		"typescriptreact",
		"typescript.tsx",
	},
	on_attach = function(client)
		client.resolved_capabilities.document_formatting = false
		client.resolved_capabilities.document_range_formatting = false
	end,
})

-- json
lspconfig.jsonls.setup({
	cmd = { "vscode-json-language-server.cmd", "--stdio" },
	capabilities = capabilities,
	filetypes = { "json" },
})

if not lspconfig.emmet_ls then
	configs.emmet_ls = {
		default_config = {
			cmd = { "emmet-ls.cmd", "--stdio" },
			filetypes = { "html", "css", "scss" },
		},
	}
end
lspconfig.emmet_ls.setup({ capabilities = capabilities })

-- lua
local system_name
if vim.fn.has("mac") == 1 then
	system_name = "macOS"
elseif vim.fn.has("unix") == 1 then
	system_name = "Linux"
elseif vim.fn.has("win32") == 1 then
	system_name = "Windows"
else
	print("Currently your system does not support sumneko_lua.")
end

-- set the path to the sumneko installation; if you previously installed via the now deprecated :LspInstall, use
local sumneko_root_path = "D:/projects/lua-language-server"
local sumneko_binary = sumneko_root_path .. "/bin/" .. system_name .. "/lua-language-server"

local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

require("lspconfig").sumneko_lua.setup({
	cmd = { sumneko_binary, "-E", sumneko_root_path .. "/main.lua" },
	settings = {
		Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = "LuaJIT",
				-- Setup your lua path
				path = runtime_path,
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { "vim" },
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
				checkThirdParty = false,
			},
			-- Do not send telemetry data containing a randomized but unique identifier
			telemetry = {
				enable = false,
			},
		},
	},
	on_attach = function(client)
		client.resolved_capabilities.document_formatting = false
		client.resolved_capabilities.document_range_formatting = false
	end,
})
