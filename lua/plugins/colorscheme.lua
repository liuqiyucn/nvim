return {
	{
		"loctvl842/monokai-pro.nvim", -- Ensure the plugin name matches your setup
		lazy = false,
		-- enabled = false,
		opts = {
			transparent_background = false,
			terminal_colors = true,
			devicons = true, -- highlight the icons of `nvim-web-devicons`
			styles = {
				comment = { italic = true },
				keyword = { italic = true }, -- any other keyword
				type = { italic = true }, -- (preferred) int, long, char, etc
				storageclass = { italic = true }, -- static, register, volatile, etc
				structure = { italic = true }, -- struct, union, enum, etc
				parameter = { italic = true }, -- parameter pass in function
				annotation = { italic = true },
				tag_attribute = { italic = true }, -- attribute of tag in reactjs
			},
			filter = "pro", -- classic | octagon | pro | machine | ristretto | spectrum
			day_night = {
				enable = false, -- turn off by default
				day_filter = "pro", -- classic | octagon | pro | machine | ristretto | spectrum
				night_filter = "pro", -- classic | octagon | pro | machine | ristretto | spectrum
			},
			inc_search = "underline", -- underline | background
			background_clear = {
				"toggleterm",
				"telescope",
				"renamer",
				-- "notify",
				-- "neo-tree",
				"bufferline",
				"which-key",
				-- "lualine",
				"float_win",
				"which-key",
			},
			plugins = {
				bufferline = {
					underline_selected = false,
					underline_visible = false,
				},
				indent_blankline = {
					context_highlight = "pro", -- default | pro
					context_start_underline = true,
				},
			},
			-- overridePalette = function(filter)
			-- 	return {
			-- 		dark2 = "#101014",
			-- 		dark1 = "#16161E",
			-- 		background = "#1A1B26",
			-- 		text = "#C0CAF5",
			-- 		accent1 = "#f7768e",
			-- 		accent2 = "#7aa2f7",
			-- 		accent3 = "#e0af68",
			-- 		accent4 = "#9ece6a",
			-- 		accent5 = "#0DB9D7",
			-- 		accent6 = "#9d7cd8",
			-- 		dimmed1 = "#737aa2",
			-- 		dimmed2 = "#787c99",
			-- 		dimmed3 = "#363b54",
			-- 		dimmed4 = "#363b54",
			-- 		dimmed5 = "#16161e",
			-- 	}
			-- end,
		},
		config = function(_, opts)
			require("monokai-pro").setup(opts)
			require("monokai-pro").load()
		end,
	},
	{
		"ellisonleao/gruvbox.nvim",
		enabled = false,
		config = function()
			vim.cmd.colorscheme("gruvbox")
			-- Default options:
			require("gruvbox").setup({
				terminal_colors = false, -- add neovim terminal colors
				undercurl = true,
				underline = true,
				bold = true,
				italic = {
					strings = true,
					emphasis = true,
					comments = true,
					operators = false,
					folds = true,
				},
				strikethrough = true,
				invert_selection = false,
				invert_signs = false,
				invert_tabline = false,
				invert_intend_guides = false,
				inverse = true, -- invert background for search, diffs, statuslines and errors
				contrast = "", -- can be "hard", "soft" or empty string
				palette_overrides = {},
				overrides = {},
				dim_inactive = false,
				transparent_mode = false,
			})
			vim.cmd("colorscheme gruvbox")
		end,
	},
	{
		"Mofiqul/dracula.nvim",
		enabled = false,
		config = function()
			vim.cmd.colorscheme("dracula")
		end,
	},
}
