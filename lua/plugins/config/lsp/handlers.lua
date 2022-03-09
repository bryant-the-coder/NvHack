local M = {}

-- Taken from max. Thanks max

local border = {
	{ "┏", "FloatBorder" },
	{ "━", "FloatBorder" },
	{ "┓", "FloatBorder" },
	{ "┃", "FloatBorder" },
	{ "┛", "FloatBorder" },
	{ "━", "FloatBorder" },
	{ "┗", "FloatBorder" },
	{ "┃", "FloatBorder" },
}

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

-- TODO: backfill this to template
M.setup = function()
	local signs = {
		{ name = "DiagnosticSignError", text = "" },
		{ name = "DiagnosticSignWarn", text = "" },
		{ name = "DiagnosticSignHint", text = "" },
		{ name = "DiagnosticSignInfo", text = "" },
	}
	for _, sign in ipairs(signs) do
		vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
	end

	local config = {
		signs = true,
		underline = true,
		severity_sort = true,
		update_in_insert = true,
		-- virtual_text = {
		-- 	prefix = "ﱢ",
		-- },
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
		},
	}

	vim.diagnostic.config(config)

	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
		border = border,
	})

	vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
		border = border,
	})
end

local function lsp_highlight_document(client)
	if client.resolved_capabilities.document_highlight then
		vim.api.nvim_exec(
			[[
            augroup lsp_document_highlight
                autocmd! * <buffer>
                autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
                autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
            augroup END
      ]],
			false
		)

		vim.api.nvim_set_hl(0, "LspReferenceText", { nocombine = true, reverse = false, underline = true })
		vim.api.nvim_set_hl(0, "LspReferenceRead", { nocombine = true, reverse = false, underline = true })
		vim.api.nvim_set_hl(0, "LspReferenceWrite", { nocombine = true, reverse = false, underline = true })
	end
end

M.on_attach = function(client, bufnr)
	if client.name == "tsserver" then
		client.resolved_capabilities.document_formatting = false
		client.resolved_capabilities.document_range_formatting = false
	end
	if client.name == "jsonls" then
		client.resolved_capabilities.document_formatting = false
		client.resolved_capabilities.document_range_formatting = false
	end
	if client.name == "html" then
		client.resolved_capabilities.document_formatting = false
		client.resolved_capabilities.document_range_formatting = false
	end
	if client.name == "sumneko_lua" then
		client.resolved_capabilities.document_formatting = false
		client.resolved_capabilities.document_range_formatting = false
	end

	lsp_highlight_document(client)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
	return
end

M.capabilities = cmp_nvim_lsp.update_capabilities(capabilities)

return M
