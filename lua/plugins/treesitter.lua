--[[
This plugin allows us to install pre-defined highlighting parsers for various
languages found in https://github.com/nvim-treesitter/nvim-treesitter.

Relevant information:

You can install new treesitter parsers using the command `:TSInstall`,
or you can add them to the table below for ensuring their installation if you
want to distribute your neovim configuration.
--]]

return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter.configs")
		configs.setup({
			ensure_installed = {
				"lua",
				"python",
				"markdown",
				"vim",
				"vimdoc",
				"javascript",
				"html",
				"zig",
				"c",
				"css",
				"typescript",
				"go",
				"gitignore",
				"bibtex",
				"bash",
				"awk",
				"astro",
				"asm",
				"elixir",
				"haskell",
				"gosum",
				"hyprlang",
				"java",
				"latex",
				"make",
				"meson",
				"luadoc",
				"ocaml",
				"ocaml_interface",
				"php",
				"printf",
				"regex",
				"sql",
				"templ",
				"tsx",
				"yaml",
			},
			modules = {},
			auto_install = true,
			ignore_install = {},
			sync_install = false,
			highlight = {
				enable = true,
				disable = { "latex" },
				additional_vim_regex_highlighting = { "latex", "markdown" },
			},
			-- indent = { enable = true },
		})
	end,
}
