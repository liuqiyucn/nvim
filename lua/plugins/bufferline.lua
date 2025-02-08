return {
    "akinsho/bufferline.nvim",
    event = { "BufReadPost", "BufNewFile" },
    enabled = true,
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
        vim.opt.termguicolors = true
        require("bufferline").setup({
            options = {
                mode = "buffers",
                offsets = {
                    {
                        filetype = "neo-tree",
                        text = "File Explorer",
                        separator = true,
                        text_align = "center",
                    },
                },
                -- diagnostics = "nvim_lsp",
                modified_icon = "●",
                show_close_icon = false,
                show_buffer_close_icons = true,
            },
        })
    end,
}
