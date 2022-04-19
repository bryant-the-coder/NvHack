local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
    return
end

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
}

for _, name in pairs(servers) do
    local server_is_found, server = lsp_installer.get_server(name)
    if server_is_found and not server:is_installed() then
        print("Installing " .. name)
        server:install()
    end
end

local enhance_server_opts = {
    -- Lua server
    ["sumneko_lua"] = function(opts)
        opts.settings = {
            Lua = {
                diagnostics = {
                    -- Get the language server to recognize the `vim` global
                    globals = { "vim" },
                },
                workspace = {
                    library = {
                        [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                        [vim.fn.stdpath("config") .. "/lua"] = true,
                    },
                },
            },
        }
    end,
    -- ["sumneko_lua"] = function(opts)
    --     return require("lua-dev").setup({
    --         lspconfig = vim.tbl_deep_extend("force", opts, {
    --             settings = {
    --                 Lua = {
    --                     diagnostics = {
    --                         globals = { "P", "vim" },
    --                     },
    --                 },
    --             },
    --         }),
    --     })
    -- end,
    -- JSON server
    ["jsonls"] = function(opts)
        opts.settings = {
            json = {
                schemas = require("schemastore").json.schemas(),
            },
        }
    end,
}

lsp_installer.on_server_ready(function(server)
    local opts = {
        on_attach = require("plugins.config.lsp.handlers").on_attach,
        capabilities = require("plugins.config.lsp.handlers").capabilities,
    }
    -- if server.name == "sumneko_lua" then
    --     local sumneko_opts = require("plugins.config.lsp.settings.sumneko_lua")
    --     opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
    -- end

    -- if server.name == "jsonls" then
    --     local jsonls_opts = require("plugins.config.lsp.settings.jsonls")
    --     opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
    -- end

    -- if server.name == "clangd" then
    --     local clang_opts = require("plugins.config.lsp.settings.clang")
    --     opts = vim.tbl_deep_extend("force", clang_opts, opts)
    -- end

    if enhance_server_opts[server.name] then
        -- Enhance the default opts with the server-specific ones
        enhance_server_opts[server.name](opts)
    end

    server:setup(opts)
end)
