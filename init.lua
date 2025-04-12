-- set line numbers
vim.o.number = true
vim.o.relativenumber = true

-- use system clipboard
vim.o.clipboard = "unnamedplus"

-- tab settings
vim.o.softtabstop = 0
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true

-- set gitsigns column
vim.o.signcolumn = "yes"
vim.o.colorcolumn = "80"
vim.o.numberwidth = 3
vim.o.ruler = false

-- Add hanging indent
vim.o.breakindent = true
vim.o.breakindentopt = "list:-1"
vim.o.linebreak = true
vim.o.formatlistpat = [[\v^\zs\s*([-*]|\d+\.)+\s+\ze]]

-- keep history
vim.opt.undofile = true

-- Decrease update time
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

-- highlight the line your cursor is on
vim.opt.cursorline = true

-- vertical padding for cursor
vim.opt.scrolloff = 1

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight text when yanking",
	group = vim.api.nvim_create_augroup("vivi-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

require("vivi.keymaps")
require("vivi.lazy")
require("vivi.ft_overrides")
