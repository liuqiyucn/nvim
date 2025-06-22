return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	dependencies = {
		"folke/noice.nvim",
	},
	opts = {
		options = {
			theme = "auto",
			globalstatus = true,
			disabled_filetypes = { statusline = { "dashboard", "alpha", "snacks_dashboard" } },
			ignore_focus = { "TelescopePrompt" },
		},
		sections = {
			lualine_a = { { "mode", icon = "" } },
			-- lualine_a = {{'mode', icon = ""}},
			lualine_b = { "branch", "diff", "diagnostics" },
			lualine_c = { "filename" },
			lualine_x = {
				{
					require("noice").api.statusline.mode.get,
					cond = require("noice").api.statusline.mode.has,
					color = { fg = "#ab9df2" },
				},
				{
					require("noice").api.status.command.get,
					cond = require("noice").api.status.command.has,
					color = { fg = "#c1c0c0" },
				},
				"filetype",
			},
			lualine_y = {
				"progress",
				{
					function()
						local starts = vim.fn.line("v")
						local ends = vim.fn.line(".")
						local count = starts <= ends and ends - starts + 1 or starts - ends + 1
						local wc = vim.fn.wordcount()
						return count .. ":" .. wc["visual_chars"]
					end,
					cond = function()
						return vim.fn.mode():find("[Vv]") ~= nil
					end,
				},
			},
			lualine_z = { "location" },
		},

		inactive_sections = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = { "filename" },
			lualine_x = {},
			lualine_y = {},
			lualine_z = {},
		},

		extensions = { "neo-tree", "fzf", "lazy" },
	},
}
