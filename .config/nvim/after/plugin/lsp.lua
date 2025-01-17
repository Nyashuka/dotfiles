require("mason").setup()
require('mason-lspconfig').setup({
    ensure_installed = {
        "csharp_ls",
        "clangd",
        "lua_ls",
    },
    handlers = {
        function(server_name)
            require('lspconfig')[server_name].setup({})

            vim.keymap.set({ "n" }, "<leader>ca", vim.lsp.buf.code_action, {})
        end,
    },
})
