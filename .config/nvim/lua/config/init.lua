require("config.set")
require("config.remap")
require("config.lazy")

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = "*.razor",
    command = "set filetype=razor",
})

