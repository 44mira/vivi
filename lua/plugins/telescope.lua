--[[
This plugin gives Neovim a fuzzy-finder panel. This allows us to search on
various groups and perform actions based on pre-defined functions.

Try out `<leader>sk` to search for normal mode keymaps!

Relevant keybindings can be found in the code below, all inside `bind` calls.
--]]

local function bind(lhs, rhs, opt)
  vim.keymap.set('n', lhs, rhs, opt)
end

return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = { 'nvim-lua/plenary.nvim', 'nvim-tree/nvim-web-devicons' },
  config = function()
    require("telescope").setup {}

    local ts = require('telescope.builtin')

    bind('<leader>sf', ts.find_files, { desc = "Telescope: Find files" })
    bind('<leader>sg', ts.live_grep, { desc = "Telescope: Live GREP" })
    bind('<leader>sb', ts.buffers, { desc = "Telescope: Buffers" })
    bind('<leader>sc', ts.commands, { desc = "Telescope: Commands" })
    bind('<leader>sk', ts.keymaps, { desc = "Telescope: Normal mode keymaps" })
    bind('<leader>sd', ts.diagnostics, { desc = "Telescope: Diagnostics" })
  end
}
