return {
  'kevinhwang91/nvim-ufo',
  dependencies = {
    'kevinhwang91/promise-async'
  },
  config = function(_, opts)
    vim.o.foldcolumn = '1' -- '0' is not bad
    vim.o.foldlevel = 99   -- Using ufo provider need a large value, feel free to decrease the value
    vim.o.foldlevelstart = 99
    vim.o.foldenable = true
    vim.o.foldmethod = "expr"

    local ftmap = {
      org = '',
    }

    require('ufo').setup({
      provider_selector = function(bufnr, filetype, buftype)
        -- if you prefer treesitter provider rather than lsp,
        -- return ftMap[filetype] or {'treesitter', 'indent'}
        return ftmap[filetype]

        -- refer to ./doc/example.lua for detail
      end
    })
  end
}
