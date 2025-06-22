return {
	"folke/flash.nvim",
	-- enabled = false,
	-- event = "VeryLazy",
	event = { "BufReadPre", "BufNewFile" }, -- 🔧 Lazy-load on buffer open
	keys = {
		{
			"s",
			mode = { "n", "x", "o" },
			function()
				require("flash").jump()
			end,
			desc = "Flash",
		},
	},
	config = function()
		require("flash").setup()
		pcall(vim.keymap.del, "n", "f")
		pcall(vim.keymap.set, "n", "f", "<nop>")
		pcall(vim.keymap.del, "n", ";")
		pcall(vim.keymap.del, "n", "'")
		pcall(vim.keymap.set, "n", "'", "<nop>")
	end,
}
