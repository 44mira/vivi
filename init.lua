
-- set line numbers
vim.o.number = true
vim.o.relativenumber = true

-- use system clipboard
vim.o.clipboard = "unnamedplus"

-- tab settings
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true

-- set gitsigns column
vim.o.signcolumn = "yes"

-- keep history
vim.opt.undofile = true

-- set horizontal rule
vim.o.colorcolumn = ""

-- Decrease update time
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

-- highlight the line your cursor is on
vim.opt.cursorline = true

-- vertical padding for cursor
vim.opt.scrolloff = 2

-- highlight on yank
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = "Highlight text when yanking",
  group = vim.api.nvim_create_augroup('vivi-highlight-yank', { clear = true }),
  callback = function ()
    vim.highlight.on_yank()
  end
})

require('vivi.keymaps')
require('vivi.lazy')
