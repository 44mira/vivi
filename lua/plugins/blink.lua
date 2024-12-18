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
