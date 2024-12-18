# vivi
Simplified Neovim configuration with a focus on accessibility and ease of use.

## Installation
- Install [Neovim](https://github.com/neovim/neovim/blob/master/INSTALL.md).
- Clone this repo into Neovim's configuration directory. 
  (`~/.config/nvim/` for UNIX).

## Features
This distribution aims to simplify the learning of Neovim configuration by
*being* a simple Neovim configuration.

- All of the plugins can be found in `lua/plugins`
    - All of the pre-installed plugins have documentation coverage for the
      things you need to know to use them at the surface-level.
        - This does mean that to have a much more customized experience, you
          will have to read the documentation of the plugins themselves.
- Normal mode keymaps can be searched through using `<leader>sk`, which opens
  a Telescope fuzzy-finding buffer for keymappings.
    - Other keymaps can be found in `lua/vivi/keymaps.lua`
