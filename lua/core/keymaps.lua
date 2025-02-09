-- For conciseness
local opts = { noremap = true, silent = true }

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- exiting insert mode
vim.keymap.set({ "i" }, "jk", "<Esc>", { silent = true, desc = "Exiting Insert Mode" })

vim.keymap.set("n", "<Esc>", function()
	if vim.v.hlsearch == 1 then
		vim.cmd("nohlsearch")
	else
		vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", true)
	end
end, { silent = true, desc = "Clear search highlight or behave as normal <Esc>" })

-- vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })
-- vim.keymap.set("n", "q:", "<Nop>", { silent = true })

-- Lazy
vim.keymap.set("n", "<leader>l", "<cmd> Lazy <CR>", {silent = true, desc = "Lazy"})

-- Quit file
vim.keymap.set("n", "<leader>qq", "<cmd>qa<CR>", {silent = true, desc = "Quit Neovim"})
vim.keymap.set("n", "<leader>qw", "<cmd> close<CR>", {silent = true, desc = "Close Current Window"})

-- Delete single character without copying into register
vim.keymap.set("n", "x", '"_x', opts)

-- Vertical scroll and center
vim.keymap.set("n", "<C-d>", "<C-d>zz", opts)
vim.keymap.set("n", "<C-u>", "<C-u>zz", opts)

-- Resize with arrows
vim.keymap.set("n", "<Up>", ":resize -2<CR>", opts)
vim.keymap.set("n", "<Down>", ":resize +2<CR>", opts)
vim.keymap.set("n", "<Left>", ":vertical resize -2<CR>", opts)
vim.keymap.set("n", "<Right>", ":vertical resize +2<CR>", opts)

vim.keymap.set("n", "]b", "<cmd> bnext <CR>",{silent = true, desc = "Go to Next Buffer"})
vim.keymap.set("n", "[b", "<cmd> bprevious <CR>", {silent = true, desc = "Go to Previous Buffer"})

-- Window management
vim.keymap.set("n", "<leader>wv", "<C-w>v", {silent = true, desc = "Open Vertical Window Split"}) -- Split window vertically
vim.keymap.set("n", "<leader>wh", "<C-w>s", {silent = true, desc = "Open Horizontal Window Split"}) -- Split window horizontally
vim.keymap.set("n", "<leader>w=", "<C-w>=", {silent = true, desc = "Make split windows equal width & height"}) -- Make split windows equal width & height
vim.keymap.set("n", "<leader>wd", "<cmd> close<CR>",{silent = true, desc = "Close current split window"}) -- Close current split window

-- Navigate between splits
vim.keymap.set("n", "<C-k>", "<cmd> wincmd k<CR>", opts) -- Config 2
vim.keymap.set("n", "<C-j>", "<cmd> wincmd j<CR>", opts)
vim.keymap.set("n", "<C-h>", "<cmd> wincmd h<CR>", opts)
vim.keymap.set("n", "<C-l>", "<cmd> wincmd l<CR>", opts)

-- Stay in indent mode
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

-- Keep last yanked text when pasting
vim.keymap.set("v", "p", '"_dP', opts)


-- Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
-- Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
-- Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
-- Snacks.toggle.diagnostics():map("<leader>ud")
-- Snacks.toggle.line_number():map("<leader>ul")
-- Snacks.toggle.treesitter():map("<leader>uT")
-- Snacks.toggle.option("background", { off = "light", on = "dark" , name = "Dark Background" }):map("<leader>ub")
-- Snacks.toggle.dim():map("<leader>uD")
-- Snacks.toggle.animate():map("<leader>ua")
-- Snacks.toggle.indent():map("<leader>ug")
-- Snacks.toggle.scroll():map("<leader>uS")

