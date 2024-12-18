--[[
This plugin opens a buffer whenever a keybinding has begun to give hints
for possible following presses.
--]]

return {
  'folke/which-key.nvim',
  event = 'VimEnter',
  config = function()
    local wk = require 'which-key'
    wk.setup()
  end,
}
