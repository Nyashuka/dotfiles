require("mason").setup()
require('mason-lspconfig').setup({
    ensure_installed = {
        "csharp_ls",
        "omnisharp",
        "clangd",
        "lua_ls",
    },
    handlers = {
        function(server_name)
            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            require("lspconfig")[server_name].setup {
                capabilities = capabilities,
            }
            vim.keymap.set({ "n" }, "<leader>ca", vim.lsp.buf.code_action, {})
        end,
    },
})

