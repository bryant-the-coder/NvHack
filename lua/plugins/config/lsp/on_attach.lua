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
    local map = vim.keymap.set
    map("n", "<leader>lr", vim.lsp.buf.rename)
    map("n", "<leader>ld", vim.lsp.buf.definition)
    map("n", "<leader>lt", vim.lsp.buf.type_definition)
    map("n", "<leader>lh", vim.lsp.buf.signature_help)
    map("n", "<leader>ss", vim.lsp.buf.formatting_sync)
    map("n", "<leader>qf", vim.diagnostic.setqflist)
    map("n", "<C-a>", vim.lsp.buf.references)
    -- map("n", "<C-k>", vim.diagnostic.goto_prev)
    -- map("n", "<C-j>", vim.diagnostic.goto_next)
    map("n", "<C-k>", function()
        vim.diagnostic.goto_prev({ border = "rounded" })
    end)
    map("n", "<C-j>", function()
        vim.diagnostic.goto_next({ border = "rounded" })
    end)

    client.server_capabilities.document_formatting = false
    client.server_capabilities.document_range_formatting = false
    lsp_highlight_document(client, bufnr)
end

function on_attach.utf16(client, bufnr)
    local map = vim.keymap.set
    map("n", "<leader>lr", vim.lsp.buf.rename)
    map("n", "<leader>ld", vim.lsp.buf.definition)
    map("n", "<leader>lt", vim.lsp.buf.type_definition)
    map("n", "<leader>lh", vim.lsp.buf.signature_help)
    map("n", "<leader>ss", vim.lsp.buf.formatting_sync)
    map("n", "<leader>qf", vim.diagnostic.setqflist)
    map("n", "<C-a>", vim.lsp.buf.references)
    -- map("n", "<C-k>", vim.diagnostic.goto_prev)
    -- map("n", "<C-j>", vim.diagnostic.goto_next)
    map("n", "<C-k>", function()
        vim.diagnostic.goto_prev({ border = "rounded" })
    end)
    map("n", "<C-j>", function()
        vim.diagnostic.goto_next({ border = "rounded" })
    end)

    client.server_capabilities.document_formatting = false
    client.server_capabilities.document_range_formatting = false
    client.offset_encoding = "utf-16"
    lsp_highlight_document(client, bufnr)
end

return on_attach
