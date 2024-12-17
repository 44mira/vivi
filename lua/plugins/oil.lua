return {
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {},
  dependencies = { { "echasnovski/mini.icons", opts = {} } },
  keys = {
    {"<leader>f", "<cmd>Oil<cr>", { desc = "Open Oil buffer" }}
  }
}
