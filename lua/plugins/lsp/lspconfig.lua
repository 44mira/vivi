--[[
This plugin is where our configuration for our Language Server Protocols live.
These protocols are what define code actions and various other things related
to specific languages. I urge you to research more about them as it is a pretty
cool topic!

You won't necessarily need to change anything here.

You can find and install more language servers using the `:Mason` command.
If the language server itself requires more setting up, you can define a
setup_handler for it down in the code below with the line that does a call to
`require("mason-lspconfig").setup_handlers`.

(Refer to `:h mason-lspconfig-automatic-server-setup`)

You can refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md
with regards to setting up an LSP.

Relevant keymaps (with <leader> as <space>):

'gd'          : '[G]oto [D]efinition'
'gr'          : '[G]oto [R]eferences'
'gI'          : '[G]oto [I]mplementation'
'<leader>ds'  : '[D]ocument [S]ymbols'
'<leader>ws'  : '[W]orkspace [S]ymbols'
'<leader>rn'  : '[R]e[n]ame'
'<leader>ca'  : '[C]ode [A]ction'
'K'           : 'Hover Documentation'
'gD'          : '[G]oto [D]eclaration'

--]]

local function bind(lhs, rhs, desc)
  vim.keymap.set('n', lhs, rhs, { desc = desc })
end

return {
  'neovim/nvim-lspconfig',
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "saghen/blink.cmp",
    "nvim-telescope/telescope.nvim",
    {
      "folke/lazydev.nvim",
      ft = "lua", -- only load on lua files
      opts = {
        library = {
          -- See the configuration section for more details
          -- Load luvit types when the `vim.uv` word is found
          { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        },
      },
    },
  },
  config = function()
    local ts = require('telescope.builtin')

    require('mason').setup {}
    require('mason-lspconfig').setup {
      ensure_installed = { 'lua_ls', 'pyright' },
      automatic_installation = false,
    }

    vim.keymap.set('i', '<C-j>', vim.lsp.buf.signature_help, { desc = "Signature help" })
    bind('gd', ts.lsp_definitions, '[G]oto [D]efinition')
    bind('gr', ts.lsp_references, '[G]oto [R]eferences')
    bind('gI', ts.lsp_implementations, '[G]oto [I]mplementation')
    bind('<leader>ds', ts.lsp_document_symbols, '[D]ocument [S]ymbols')
    bind('<leader>ws', ts.lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
    bind('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
    bind('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
    bind('K', vim.lsp.buf.hover, 'Hover Documentation')
    bind('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

    require("mason-lspconfig").setup_handlers {
      function(server_name)
        local capabilities = require('blink.cmp').get_lsp_capabilities({})
        require("lspconfig")[server_name].setup(capabilities)
      end,
    }

    vim.api.nvim_create_autocmd('LspAttach', {
      callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if not client then return end

        if client.supports_method('textDocument/formatting') then
          vim.api.nvim_create_autocmd('BufWritePre', {
            buffer = args.buf,
            callback = function()
              vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
            end
          })
        end
      end
    })
  end
}
