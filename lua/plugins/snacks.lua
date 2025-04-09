-- Dashboard config {{{
local dashboard_config = {
  enabled = true,

  width = 70,

  -- Preset keys {{{2
  preset = {
    keys = {
      {
        icon = "󰏢",
        key = "o",
        desc = "Orgmode Notes",
        action = ":cd ~/orgfiles | e .",
      },
      {
        icon = " ",
        key = "n",
        desc = "Configure Neovim",
        action = ":cd ~/.config/nvim | e .",
      },
      {
        icon = "󰄛",
        key = "t",
        desc = "Configure Kitty",
        action = ":cd ~/.config/kitty | e .",
      },
      {
        icon = "󰨇",
        key = "w",
        desc = "Configure Hyprland",
        action = ":cd ~/.config/hypr | e .",
      },
      { icon = " ", key = "q", desc = "Quit", action = ":qa" },
    },
  }, -- }}}2

  sections = {
    { section = "header" },
    {
      section = "terminal",
      pane = 2,
      cmd = "pipes.sh -p 2 -t 3",
      height = 3,
      padding = 1,
    },
    { icon = "■", title = "Recent Files", section = "recent_files", pane = 1, indent = 2, padding = 1 },
    { section = "keys", padding = 3 },
    -- Git info {{{2
    function()
      local in_git = Snacks.git.get_root() ~= nil
      local has_remote = vim.system({ "git", "remote" }, { text = true }):wait().stdout ~= ""
      -- templates {{{3
      local issue_template =
      [['{{range .}}{{tablerow (printf "#%v" .number | autocolor "green") .title .headRefName (timeago .updatedAt)}}{{else}} No Issues found. {{end}}']]
      local prs_template =
      [['{{range .}}{{tablerow (printf "#%v" .number | autocolor "green") .title .headRefName (timeago .updatedAt)}}{{else}} No PRs found. {{end}}']]
      -- }}}3
      local cmds = {
        {
          title = "Open Issues",
          enabled = has_remote,
          cmd = "gh issue list --json number,title,updatedAt --template "
              .. issue_template
              .. " 2>/dev/null || echo 'Error fetching issues. See `gh issue list`.'",
          key = "i",
          action = function()
            vim.fn.jobstart("gh issue list --web", { detach = true })
          end,
          icon = " ",
          height = 4,
        },
        {
          icon = " ",
          enabled = has_remote,
          title = "Open PRs",
          cmd = "gh pr list --json number,title,headRefName,updatedAt --template "
              .. prs_template
              .. " 2>/dev/null || echo 'Error fetching PRs. See `gh pr list`.'",
          key = "P",
          action = function()
            vim.fn.jobstart("gh pr list --web", { detach = true })
          end,
          height = 4,
        },
        {
          icon = " ",
          title = "Git Log",
          cmd = [[git --no-pager log -6 --pretty=format:'(%Cred%h%Creset) %s']],
          height = 6,
        },
      }

      return vim.tbl_map(function(cmd)
        return vim.tbl_extend("force", {
          pane = 2,
          section = "terminal",
          enabled = in_git,
          padding = 1,
          ttl = 60,
          indent = 3,
        }, cmd)
      end, cmds)
    end, -- }}}2
    {
      pane = 2,
      icon = " ",
      desc = "Browse Repo",
      padding = 1,
      key = "b",
      action = function()
        Snacks.gitbrowse()
      end,
    },

    {
      text = {
        { "YOU ARE AT: ", hl = "SnacksDashboardIcon" },
        { vim.fn.getcwd() },
      },
    },
  },
}
-- }}}
-- main config {{{
return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,

  ---@module 'snacks'
  ---@type snacks.Config
  opts = {
    image = {
      enabled = true,
      math = {
        enabled = false,
        latex = {
          font_size = "normalsize",
        },
      },
    },
    indent = { enabled = true },
    scope = { enabled = true },
    bufdelete = { enabled = true },
    dashboard = dashboard_config,
  },
  init = function()
    vim.api.nvim_create_user_command("Dash", function()
      Snacks.dashboard.open()
    end, {})
  end, -- }}}
  -- Keymaps {{{
  keys = {
    {
      "<leader>bd",
      function()
        Snacks.bufdelete.delete()
      end,
      desc = "Buffer delete",
    },
    {
      "<leader>bo",
      function()
        Snacks.bufdelete.other()
      end,
      desc = "Delete other buffers",
    },
    {
      "<leader>cc",
      function()
        if not Snacks.indent.enabled then
          Snacks.indent.enable()
        else
          Snacks.indent.disable()
        end

        vim.cmd([[RenderMarkdown toggle]])

        if vim.o.colorcolumn ~= "" then
          vim.o.cocu = "nvc"
          vim.o.cole = 2
          vim.o.colorcolumn = ""
          return
        end

        vim.o.cocu = ""
        vim.o.cole = 0
        if vim.v.count ~= 0 then
          vim.o.colorcolumn = vim.v.count .. ""
        else
          vim.o.colorcolumn = "80"
        end
      end,
      desc = "Toggle indent labels",
    },
  }, -- }}}
}
