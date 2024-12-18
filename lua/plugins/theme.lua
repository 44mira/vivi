--[[
This plugin allows us to set the theme for our Neovim. You can obtain themes
from vimcolorschemes.com.
--]]

return {
  -- DO NOT remove these 2 lines, these ensure that the theme is loaded before
  -- everything else.
  lazy = false,
  priority = 1000,

  -- you can replace the code below with your theme of choice
  'sainnhe/gruvbox-material',

  -- this attribute allows us to specify extra things to run after loading
  -- and setting up our theme.
  init = function()
    -- these options are defined in gruvbox-material documentation.
    vim.g.gruvbox_material_enable_italic = true
    vim.g.gruvbox_material_enable_bold = true

    -- this is the line that sets the vim theme to gruvbox-material
    vim.cmd.colorscheme 'gruvbox-material'

    -- these are extra overriding highlights
    -- I've set the line numbers to be brighter.
    vim.api.nvim_set_hl(0, 'LineNr', { fg = '#958877' })
    vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = '#CD605A' })
  end,
}
