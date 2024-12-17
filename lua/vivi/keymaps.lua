local bind = vim.keymap.set

-- map the leader key to space
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- reload/source current file
bind('n', '<leader><leader>x', function()
  vim.cmd [[source %]]
  print("Reloaded vivi.")
end, { desc = 'Source current file' })

-- ergonomic normal mode
bind('i', 'jk', '<Esc>', { desc = 'Normal mode' })

-- sanity binds
bind('n', '<Esc>', '<cmd>nohl<cr>', { desc = 'Clear highlight' })

---@deprecated Use oil.nvim
-- bind('n', '<leader>f', '<cmd>Ex<cr>', { desc = 'Open file explorer' })

-- window navigation
for direction in ("hjkl"):gmatch"." do
  bind('n', ('<C-%s>'):format(direction), ('<C-w><C-%s>'):format(direction), {
    desc = "Window" .. direction
  })
end

-- buffer navigation
bind('n', '<leader>[', '<cmd>bp<cr>', { desc = 'Previous buffer' })
bind('n', '<leader>]', '<cmd>bn<cr>', { desc = 'Next buffer' })
bind('n', 'bd', '<cmd>bd<cr>', { desc = 'Buffer delete'} )


-- assign a colorcolumn to column <count>. defaults to 80
bind('n', '<leader>cc', function()
	if vim.o.colorcolumn ~= "" then
		vim.o.colorcolumn = ""
    return
	end

  if vim.v.count ~= 0 then
    vim.o.colorcolumn = vim.v.count .. ""
  else
    vim.o.colorcolumn = "80"
  end
end, { desc = 'Toggle colorcolumn' })
