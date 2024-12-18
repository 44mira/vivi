--[[
This plugin allows us to have a smooth scrolling animation for Neovim.
Personal preference if you want to keep this on, but I prefer it as I think
it reduces chances of you getting lost whenever you do a fast scroll.

Notable keymappings (with <leader> as <space>):

<C-u> : scroll up by half a screen (UP)
<C-d> : scroll down by half a screen (DOWN)
<C-f> : scroll down by a screen (FORWARD)
<C-b> : scroll up by a screen (BACKWARD)
zt    : scroll until current line is at the top of the screen
zz    : scroll until current line is at the center of the screen
zb    : scroll until current line is at the bottom of the screen
--]]

return {
  "karb94/neoscroll.nvim",
  opts = {
    hide_cursor = false,
    easing = "circular"
  },
  config = function()
    local neoscroll = require('neoscroll')
    local keymap = {
      ["<C-u>"] = function() neoscroll.ctrl_u({ duration = 100 }) end,
      ["<C-d>"] = function() neoscroll.ctrl_d({ duration = 100 }) end,
      ["<C-b>"] = function() neoscroll.ctrl_b({ duration = 100 }) end,
      ["<C-f>"] = function() neoscroll.ctrl_f({ duration = 100 }) end,
      ["<C-y>"] = function() neoscroll.scroll(-0.1, { move_cursor = false, duration = 100 }) end,
      ["<C-e>"] = function() neoscroll.scroll(0.1, { move_cursor = false, duration = 100 }) end,
      ["zt"]    = function() neoscroll.zt({ half_win_duration = 100 }) end,
      ["zz"]    = function() neoscroll.zz({ half_win_duration = 100 }) end,
      ["zb"]    = function() neoscroll.zb({ half_win_duration = 100 }) end,
    }
    local modes = { 'n', 'v', 'x' }
    for key, func in pairs(keymap) do
      vim.keymap.set(modes, key, func)
    end
  end
}
