---@diagnostic disable: undefined-field
return {
    "nvim-lualine/lualine.nvim",
    event = "BufRead",
    dependencies = {
        { "yavorski/lualine-macro-recording.nvim" },
        "folke/noice.nvim",
    },
    opts = {
        options = {
            theme = "auto",
            -- globalstatus = true,
            disabled_filetypes = { statusline = { "dashboard", "alpha", "ministarter", "snacks_dashboard" } }
        },
        sections = {
            lualine_a = {'mode'},
            lualine_b = {'branch', 'diff', 'diagnostics'},
            lualine_c = {'filename'},
            -- lualine_x = { "macro_recording",'filetype'},
            lualine_x = {
                {
                    ---@diagnostic disable-next-line: deprecated
                    require("noice").api.statusline.mode.get,
                    ---@diagnostic disable-next-line: deprecated
                    cond = require("noice").api.statusline.mode.has,
                    color = { fg = "#ff9e64" },
                },
                'filetype',
            },
            lualine_y = {'progress'},
            lualine_z = {'location'}
        },
        inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = {'filename'},
            lualine_x = {},
            lualine_y = {},
            lualine_z = {}
        },
        extensions = {"neo-tree", "fzf", "lazy"},
    },
}
