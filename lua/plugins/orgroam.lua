return {
  "chipsenkbeil/org-roam.nvim",
  dependencies = {
    {
      "nvim-orgmode/orgmode",
    },
  },
  config = function()
    require("org-roam").setup({
      directory = "~/orgfiles/roam",
      org_files = {
        "~/orgfiles/**/*.org",
      },
    })
  end,
}
