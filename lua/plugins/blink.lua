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

local default_sources = { "lsp", "path", "snippets", "buffer" }

return {
	"saghen/blink.cmp",
	-- optional: provides snippets for the snippet source
	dependencies = {
		"saghen/blink.compat",
		"rafamadriz/friendly-snippets",
		{ "L3MON4D3/LuaSnip", version = "v2.*" },
		{
			"kristijanhusak/vim-dadbod-completion",
			ft = { "sql", "mysql", "plsql" },
			lazy = true,
		},
	},

	-- use a release tag to download pre-built binaries
	version = "1.*",
	-- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
	-- build = 'cargo build --release',
	-- If you use nix, you can build from source using latest nightly rust with:
	-- build = 'nix run .#build-plugin',

	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		-- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
		-- 'super-tab' for mappings similar to vscode (tab to accept)
		-- 'enter' for enter to accept
		-- 'none' for no mappings
		--
		-- All presets have the following mappings:
		-- C-space: Open menu or open docs if already open
		-- C-n/C-p or Up/Down: Select next/previous item
		-- C-e: Hide menu
		-- C-k: Toggle signature help (if signature.enabled = true)
		--
		-- See :h blink-cmp-config-keymap for defining your own keymap
		keymap = {
			preset = "default",

			-- <C-CR> for accept
			["<C-y>"] = {},
			["<Tab>"] = {},
			["<C-CR>"] = { "select_and_accept" },

			-- here for reference, doesn't change anything in default preset
			["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
			["<C-e>"] = { "hide", "fallback_to_mappings" },

			["<Up>"] = { "select_prev", "fallback" },
			["<Down>"] = { "select_next", "fallback" },
			["<C-p>"] = { "select_prev", "fallback_to_mappings" },
			["<C-n>"] = { "select_next", "fallback_to_mappings" },

			["<C-b>"] = { "scroll_documentation_up", "fallback" },
			["<C-f>"] = { "scroll_documentation_down", "fallback" },

			["<C-l>"] = { "snippet_forward", "fallback" },
			["<C-h>"] = { "snippet_backward", "fallback" },

			["<C-k>"] = { "show_signature", "hide_signature", "fallback" },
		},

		appearance = {
			-- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
			-- Adjusts spacing to ensure icons are aligned
			nerd_font_variant = "mono",
		},

		-- (Default) Only show the documentation popup when manually triggered
		completion = {
			menu = {
				auto_show = function(ctx)
					local bufname = vim.api.nvim_buf_get_name(0)

					-- disable on org-roam
					return bufname:match("org%-roam%-select$") == nil
				end,
			},
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 500,
			},
		},

		-- Default list of enabled providers defined so that you can extend it
		-- elsewhere in your config, without redefining it, due to `opts_extend`
		sources = {
			per_filetype = {
				lua = vim.tbl_extend("keep", default_sources, { "lazydev" }),
				org = vim.tbl_extend("keep", default_sources, { "orgmode" }),
				sql = { "snippets", "dadbod", "buffer" },
			},

			default = default_sources,
			providers = {
				orgmode = {
					name = "Orgmode",
					module = "orgmode.org.autocompletion.blink",
					fallbacks = { "buffer" },
				},
				lazydev = {
					name = "LazyDev",
					module = "lazydev.integrations.blink",
					-- make lazydev completions top priority (see `:h blink.cmp`)
					score_offset = 100,
				},
				dadbod = {
					name = "Dadbod",
					module = "vim_dadbod_completion.blink",
				},
			},
		},

		-- Use luasnip for managing snippets
		snippets = {
			preset = "luasnip",
		},

		cmdline = {
			keymap = {
				preset = "inherit",
			},
			completion = {
				menu = {
					auto_show = function(ctx)
						return vim.fn.getcmdtype() == ":"
					end,
				},
			},
		},

		-- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
		-- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
		-- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
		--
		-- See the fuzzy documentation for more information
		fuzzy = { implementation = "prefer_rust_with_warning" },

		signature = {
			enabled = true,
			trigger = {
				-- Show the signature help automatically
				enabled = true,
				-- Show the signature help window after typing any of alphanumerics, `-` or `_`
				show_on_keyword = false,
				blocked_trigger_characters = {},
				blocked_retrigger_characters = {},
				-- Show the signature help window after typing a trigger character
				show_on_trigger_character = true,
				-- Show the signature help window when entering insert mode
				show_on_insert = false,
				-- Show the signature help window when the cursor comes after a trigger character when entering insert mode
				show_on_insert_on_trigger_character = true,
			},
		},
	},
	opts_extend = { "sources.default" },
}
