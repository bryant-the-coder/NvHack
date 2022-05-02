local on_attach = {}

local function lsp_highlight_document(client, bufnr)
    if client.server_capabilities.documentHighlightProvider then
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

function on_attach.setup(client, bufnr)
    client.server_capabilities.document_formatting = false
    client.server_capabilities.document_range_formatting = false
    lsp_highlight_document(client, bufnr)
end

return on_attach
