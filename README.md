# vivi
Simplified Neovim configuration with a focus on accessibility and ease of use.

## Installation
- Install [Neovim](https://github.com/neovim/neovim/blob/master/INSTALL.md).
- Clone this repo into Neovim's configuration directory
  (`~/.config/nvim/` for UNIX).

## Features
This distribution aims to simplify the learning of Neovim configuration by
*being* a simple Neovim configuration.

- Default settings can be found in `init.lua`
- All of the plugins can be found in `lua/plugins`
    - All of the pre-installed plugins have documentation coverage for the
      things you need to know to use them at the surface-level.
        - This does mean that to have a much more customized experience, you
          will have to read the documentation of the plugins themselves.
- Normal mode keymaps can be searched through using `<leader>sk`, which opens
  a Telescope fuzzy-finding buffer for keymappings.
    - Other keymaps can be found in `lua/vivi/keymaps.lua`

## Installing plugins
The simplified workflow for adding plugins is to create a `<plugin>.lua` file
in `lua/plugins`. (`<plugin>` can be whatever name you want it to be for the
plugin you want to install).

The `.lua` file will the have to return a Lua table containing the name of
the plugin in the format `<author>/<plugin-name>` (this can be found as the
tail end of their Github URL) and various [options](https://lazy.folke.io/spec)
you can set.

Example:
```lua
return {
  'stevearc/oil.nvim',
  opts = {},
  dependencies = { { "echasnovski/mini.icons", opts = {} } },
  keys = {
    { "<leader>f", "<cmd>Oil<cr>", { desc = "Open Oil buffer" } }
  }
}
```
