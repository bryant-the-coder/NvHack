local servers = {
    "emmet_ls",
    "html",
    "tsserver",
    "jsonls",
    "cssls",
    "clangd",
    "rust_analyzer",
    "sumneko_lua",
    "yamils",
    "ltex",
}

-- Setting up installer
require("nvim-lsp-installer").setup({
    ensure_installed = servers,
})
