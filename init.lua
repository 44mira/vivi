
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

-- set horizontal rule
vim.o.colorcolumn = ""

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
