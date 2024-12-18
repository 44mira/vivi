--[[
This plugin gives our Neovim auto-completion!

Relevant keybindings when the completion window is open:

<C-space> : show, show_documentation, hide_documentation
<C-e>     : hide
<C-y>     : select_and_accept

<C-p>     : select_prev
<C-n>     : select_next

<C-b>     : scroll_documentation_up
<C-f>     : scroll_documentation_down

<Tab>     : snippet_forward
<S-Tab>   : snippet_backward
--]]

return {
  'saghen/blink.cmp',
  version = 'v0.*',
  -- !Important! Make sure you're using the latest release of LuaSnip
  -- `main` does not work at the moment
  dependencies = { 'rafamadriz/friendly-snippets' },

  opts = {

    keymap = {
      preset = 'default',
      ['<C-Enter>'] = { 'select_and_accept' },
      ['<C-y>'] = {}
    },

    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
    },

    appearance = {
      use_nvim_cmp_as_default = true,
      nerd_font_variant = 'mono'
    },

    completion = {
      documentation = {
        auto_show = true
      }
    }
  },
}
