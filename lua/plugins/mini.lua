return
{
    "echasnovski/mini.nvim",
    version = false,
    event = { "BufReadPost", "BufNewFile" },
    config = function()
        require("mini.pairs").setup({
            modes = { insert = true, command = true, terminal = false },
            skip_next = [=[[%w%%%'%[%"%.%`%$]]=],
            skip_ts = { "string" },
            skip_unbalanced = true,
            markdown = true,
        })
        require("mini.ai").setup({})
        require("mini.surround").setup({})
    end,
}
