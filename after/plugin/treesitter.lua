require("nvim-treesitter").setup({
    install_dir = vim.fn.stdpath("data") .. "/site",
})
-- Enable Tree-sitter highlighting for these filetypes
vim.api.nvim_create_autocmd("FileType", {
    pattern = {
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
        "c",
        "lua",
        "rust",
        "help",
    },
    callback = function()
        vim.treesitter.start()
    end,
})
