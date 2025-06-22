return {
	{
		"lervag/vimtex",
		-- enabled = false,
		lazy = false, -- we don't want to lazy load VimTeX
		-- tag = "v2.15", -- uncomment to pin to a specific release
		init = function()
			-- vim.g.vimtex_view_method = "zathura"
			vim.g.vimtex_view_method = "skim"
			vim.g.vimtex_syntax_enabled = 1
			-- vim.g.vimtex_compiler_latexmk = {
			-- 	continuous = 0,
			-- }
			vim.g.vimtex_quickfix_autoclose_after_keystrokes = 2
		end,
	},
}
