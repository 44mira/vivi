# vivi
Simplified Neovim configuration with a focus on accessibility and ease of use.

## Preview

| splash page | telescope |
| --- | --- |
|![image](https://github.com/user-attachments/assets/b5b4dc67-0cd7-4bba-bc92-79c8e3ec3e00) | ![image](https://github.com/user-attachments/assets/9b4c67d0-6973-471d-a8e5-e7d3b7398fa2) |

| oil buffer | theme plugin |
| --- | --- |
| ![image](https://github.com/user-attachments/assets/8b1a65ab-07e6-4475-ac71-c93f5145ad4b) | ![image](https://github.com/user-attachments/assets/ee665a05-512e-4234-b590-008ed83175ce) |


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

As an exercise, the repo does not come with a formatter plugin out-of-the-box.
You can try [`stevearc/conform.nvim`](https://github.com/stevearc/conform.nvim) for this.
