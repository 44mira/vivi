local settings = require('settings.mini')

return {
  'echasnovski/mini.nvim',
  version = '*',
  init = function()
    -- around-inside text objects
    require('mini.ai').setup()

    -- auto pairing
    require('mini.pairs').setup()

    -- surround actions
    require('mini.surround').setup()

    -- statusline
    require('mini.statusline').setup()
  end
}
