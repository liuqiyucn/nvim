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

vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })
vim.keymap.set({ "n", "v" }, "q:", "<Nop>", { silent = true })

-- Save file with auto-formatting
vim.keymap.set("n", "<leader>sn", "<cmd> w <CR>", opts)

-- Save file without auto-formatting
vim.keymap.set("n", "<D-s>", "<cmd>noautocmd w <CR>", opts)

-- Quit file
vim.keymap.set("n", "<leader>xx", ":qa<CR>", opts)
vim.keymap.set("n", "<leader>q", ":q<CR>", opts)

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

-- Buffers
-- local ui = require("utils.ui")
-- vim.keymap.set("n", "<leader>bd", ui.bufremove, { desc = "Delete buffer", silent = true })

vim.keymap.set("n", "<leader>bd", function()
  local ok, snacks = pcall(require, "snacks")
  if ok and snacks.bufdelete then
    snacks.bufdelete()
  else
    vim.notify("snacks.nvim not loaded", vim.log.levels.ERROR)
  end
end, { desc = "Delete buffer", silent = true })

-- Window management
vim.keymap.set("n", "<leader>v", "<C-w>v", opts) -- Split window vertically
vim.keymap.set("n", "<leader>h", "<C-w>s", opts) -- Split window horizontally
vim.keymap.set("n", "<leader>se", "<C-w>=", opts) -- Make split windows equal width & height
vim.keymap.set("n", "<leader>xs", ":close<CR>", opts) -- Close current split window

-- Navigate between splits
vim.keymap.set('n', '<C-k>', '<cmd> wincmd k<CR>', opts) -- Config 2
vim.keymap.set('n', '<C-j>', '<cmd> wincmd j<CR>', opts)
vim.keymap.set('n', '<C-h>', '<cmd> wincmd h<CR>', opts)
vim.keymap.set('n', '<C-l>', '<cmd> wincmd l<CR>', opts)

-- Stay in indent mode
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

-- Keep last yanked text when pasting
vim.keymap.set("v", "p", '"_dP', opts)



