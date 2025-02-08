return {
    "Mofiqul/dracula.nvim",
    enabled = false,
    config = function()
        require("dracula").setup()
        vim.cmd.colorscheme("dracula")
    end
}
