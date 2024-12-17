return {
  'sainnhe/gruvbox-material',
  lazy = false,
  priority = 1000,
  init = function()
    vim.g.gruvbox_material_enable_italic = true
    vim.g.gruvbox_material_enable_bold = true
    vim.cmd.colorscheme 'gruvbox-material'

    vim.api.nvim_set_hl(0, 'LineNr', { fg = '#958877' })
    vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = '#CD605A' })
  end,
}
