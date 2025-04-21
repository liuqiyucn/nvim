return {
  enabled = false,
	"nvim-neo-tree/neo-tree.nvim",
	version = "*",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
	},
	cmd = "Neotree",
	init = function()
		-- Create an auto-command that checks if nvim was opened with a directory.
		vim.api.nvim_create_autocmd("BufEnter", {
			group = vim.api.nvim_create_augroup("Neotree_start_directory", { clear = true }),
			desc = "Start Neo-tree with directory",
			once = true, -- so it only fires the first time a buffer is entered
			callback = function()
				-- If neo-tree is already loaded, do nothing
				if package.loaded["neo-tree"] then
					return
				end
				-- Check if the argument is a directory
				---@diagnostic disable-next-line: param-type-mismatch
				local stats = vim.uv.fs_stat(vim.fn.argv(0))
				if stats and stats.type == "directory" then
					require("neo-tree")
				end
			end,
		})
	end,
	keys = {
		{ "\\", ":Neotree toggle=true reveal<CR>", desc = "NeoTree reveal", silent = true },
	},
	opts = {
		filesystem = {
			filtered_items = {
				visible = false,
				hide_by_name = {
					"__pycache__",
				},
			},
			window = {
				mappings = {
					-- ["H"] = "", -- Unmap Shift+H for Neo-tree
					-- ["h"] = "", -- Ensure other default mappings still work
					-- ["l"] = "", -- Ensure other default mappings still work
				},
			},
		},
	},
}
