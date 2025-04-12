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
	vim.keymap.set("n", lhs, rhs, { desc = desc })
end

return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"jay-babu/mason-nvim-dap.nvim",
		"saghen/blink.cmp",
		"nvim-telescope/telescope.nvim",
		"folke/lazydev.nvim",
	},
	config = function()
		local builtin = require("telescope.builtin")

		require("mason").setup({})
		require("mason-nvim-dap").setup({
			ensure_installed = {
				"delve",
				"python",
				"codelldb",
				"php",
				"bash",
				"elixir",
				"haskell",
				"node2",
			},
			automatic_installation = true,
			handlers = {
				function(config)
					-- all sources with no handler get passed here
					require("mason-nvim-dap").default_setup(config)
				end,
			},
		})
		require("mason-lspconfig").setup({
			ensure_installed = { "lua_ls", "pyright", "clangd", "gopls", "zls", "rust_analyzer" },
			automatic_installation = false,
		})

		-- vim.keymap.set("i", "<C-j>", vim.lsp.buf.signature_help, { desc = "Signature help" })
		bind("gd", builtin.lsp_definitions, "[G]oto [D]efinition")
		bind("gr", builtin.lsp_references, "[G]oto [R]eferences")
		bind("gI", builtin.lsp_implementations, "[G]oto [I]mplementation")
		bind("<leader>ds", builtin.lsp_document_symbols, "[D]ocument [S]ymbols")
		bind("<leader>ws", builtin.lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")
		bind("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
		bind("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
		bind("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

		-- local capabilities = vim.lsp.protocol.make_client_capabilities()
		-- capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

		require("mason-lspconfig").setup_handlers({
			function(server_name)
				local capabilities = require("blink.cmp").get_lsp_capabilities()
				-- see nvim-ufo.lua
				capabilities.textDocument.foldingRange = {
					dynamicRegistration = false,
					lineFoldingOnly = true,
				}

				require("lspconfig")[server_name].setup({ capabilities = capabilities })
			end,
		})
	end,
}
