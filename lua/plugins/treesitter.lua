--[[
This plugin allows us to install pre-defined highlighting parsers for various
languages found in https://github.com/nvim-treesitter/nvim-treesitter.

Relevant information:

You can install new treesitter parsers using the command `:TSInstall`,
or you can add them to the table below for ensuring their installation if you
want to distribute your neovim configuration.
--]]

return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local configs = require('nvim-treesitter.configs')

    configs.setup({
      ensure_installed = { "lua", "python", "markdown", "vim", "vimdoc", "javascript", "html" },
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end
}
