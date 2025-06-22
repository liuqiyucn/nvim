return {
	"stevearc/conform.nvim",
	-- enabled = false,
	dependencies = {},

	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "ruff_format" },
				tex = { "latexindent" },
			},

			format_on_save = {
				-- These options will be passed to conform.format()
				timeout_ms = 500,
				async = false,
				lsp_format = "fallback",
			},
		})

		vim.keymap.set("n", "<leader>cf", function()
			require("conform").format()
		end, { desc = "Conform: format" })
	end,
}
