return {
	"L3MON4D3/LuaSnip",
	dependencies = {
		{
			"rafamadriz/friendly-snippets",
			config = function()
				require("luasnip.loaders.from_vscode").lazy_load()
			end,
		},
	},
	config = function()
		local luasnip = require("luasnip")
		luasnip.config.setup({})
		require("luasnip.loaders.from_lua").load({ paths = { "./snippets" } })

		vim.keymap.set({ "i", "s" }, "<C-e>", function()
			if luasnip.choice_active() then
				luasnip.change_choice(1)
			end
		end, { silent = true })
	end,
}
