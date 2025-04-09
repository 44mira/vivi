return {
  "MeanderingProgrammer/render-markdown.nvim",
  dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" }, -- if you use the mini.nvim suite
  -- config {{{
  config = function(_, opts)
    -- local gruvbox_headers = {
    -- 	"#3c2322", -- H1: Darkened GruvboxMaterialRed
    -- 	"#3a2a1c", -- H2: Darkened GruvboxMaterialOrange
    -- 	"#3a321a", -- H3: Darkened GruvboxMaterialYellow
    -- 	"#2e331a", -- H4: Darkened GruvboxMaterialGreen
    -- 	"#273433", -- H5: Darkened GruvboxMaterialAqua
    -- 	"#322b36", -- H6: Darkened GruvboxMaterialPurple
    -- }
    --
    for i = 1, 6 do
      vim.api.nvim_set_hl(0, ("RenderMarkdownH%dBg"):format(i), { bg = "#242021" })
    end

    require("render-markdown").setup(opts)
  end,
  -- }}}
  ---@module 'render-markdown'
  ---@type render.md.UserConfig
  opts = {
    enabled = false,
    completions = { lsp = { enabled = true } },

    win_options = {
      conceallevel = {
        default = vim.api.nvim_get_option_value("conceallevel", {}),
        rendered = 2,
      },
      concealcursor = {
        default = vim.api.nvim_get_option_value("concealcursor", {}),
        rendered = "nvic",
      },
    },
    render_modes = { "n", "v", "i", "c" },
    anti_conceal = {
      enabled = false,
    },

    heading = {
      enabled = true,
      border = true,
    },
    bullet = {
      enabled = true,
      icons = { "•", "⦿", "⁃", "‣" },
    },
  },
}
