-- Leader Key
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.have_nerd_font = true

-- Numbering Options
vim.wo.number = true -- Enable line numbers
vim.o.relativenumber = true -- Set relative numbered lines

-- Clipboard and Input
vim.o.clipboard = "unnamedplus" -- Sync clipboard between OS and Neovim
vim.o.mouse = "a" -- Enable mouse mode

-- Indentation
vim.o.shiftwidth = 2 -- The number of spaces inserted for each indentation
vim.o.tabstop = 2 -- Insert n spaces for a tab
vim.o.softtabstop = 2 -- Number of spaces a tab counts for in editing
vim.o.expandtab = true -- Convert tabs to spaces
-- vim.o.shiftwidth = 2 -- Spaces per indent
-- vim.o.tabstop = 2 -- Spaces per tab

-- Scrolling
vim.o.scrolloff = 999 -- Minimal lines to keep above and below the cursor
vim.o.sidescrolloff = 8 -- Minimal columns to keep on either side of the cursor

-- Cursor and Splits
vim.o.cursorline = true -- Highlight the current line
vim.o.splitbelow = true -- Force horizontal splits to go below current window
vim.o.splitright = true -- Force vertical splits to go to the right of current window

-- Searching
vim.o.ignorecase = true -- Case-insensitive searching unless \C or uppercase used
vim.o.smartcase = true -- Use smart case

-- Visual and Terminal Settings
vim.opt.termguicolors = true -- Enable highlight groups with GUI colors
vim.o.wrap = false -- Display lines as one long line
vim.o.linebreak = true -- Don't break words when wrapping
vim.o.cursorline = true -- Highlight the current line

-- File Handling
vim.o.swapfile = false -- Disable swap files
vim.o.writebackup = true -- Allow editing if another program edits the same file
vim.o.undofile = true -- Enable undo history
vim.o.fileencoding = "utf-8" -- File encoding
vim.opt.confirm = true

-- Search and Commands
vim.o.showmode = false -- Disable "-- INSERT --" messages
vim.o.hlsearch = true -- Disable search highlighting
vim.api.nvim_set_hl(0, "Search", { bg = "#ffcc00", fg = "#000000", bold = true, underline = true })
vim.api.nvim_set_hl(0, "IncSearch", { bg = "#ff8700", fg = "#000000", bold = true, underline = true })
vim.o.cmdheight = 1 -- Command-line height
vim.o.pumheight = 10 -- Popup menu height
vim.o.conceallevel = 0 -- Ensure all markdown content is visible

-- Other Settings
vim.o.autoindent = true -- Copy indent from current line
vim.o.smartindent = true -- Make indenting smarter
vim.o.breakindent = true -- Enable break indent
vim.o.timeoutlen = 300
vim.o.ttimeoutlen = 50
vim.o.updatetime = 250 -- Faster updates
vim.o.numberwidth = 4 -- Number column width
vim.o.completeopt = "menuone,noselect" -- Completion menu options
vim.o.showtabline = 2 -- Always show tabline

-- Format Options
vim.opt.formatoptions:remove({ "c", "r", "o" }) -- Avoid auto-wrapping comments

-- Keywords
vim.opt.iskeyword:append("-") -- Treat hyphenated words as single words

-- Short Messages
vim.opt.shortmess:append("c") -- Avoid ins-completion-menu messages

-- Path Adjustments
vim.opt.runtimepath:remove("/usr/share/vim/vimfiles") -- Separate Vim from Neovim runtime paths

-- Whitespace Characters
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Live Preview Substitutions
vim.opt.inccommand = "split"
