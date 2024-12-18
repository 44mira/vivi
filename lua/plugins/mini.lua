--[[
This plugin is a collection of mini-plugins that aim to have miscellaneous
functions for Neovim.

Notable keybindings (with <leader> as <space>):

<text-object> ::= these are motions that form a selection such as `aw`, `i)`

sa<text-object><character> : surround <text-object> with <character>
sa<text-object>t           : surround <text-object> with an HTML tag
sa<text-object>f           : surround <text-object> with parentheses and a
                             function name
sd<character>              : delete surrounding <character>
sr<character>              : replace surrounding <character>
--]]

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
