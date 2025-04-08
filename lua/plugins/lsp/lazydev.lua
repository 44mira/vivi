return {
  ---@module "lazdev"
  ---@type lazydev.Config
  "folke/lazydev.nvim",
  ft = "lua", -- only load on lua files
  opts = {
    runtime = vim.env.VIMRUNTIME --[[@as string]],
    library = {
      -- See the configuration section for more details
      -- Load luvit types when the `vim.uv` word is found
      { path = "${3rd}/luv/library", words = { "vim%.uv" } },
    },
    integrations = {
      lspconfig = true,
      cmp = true,
    },
  },
}
