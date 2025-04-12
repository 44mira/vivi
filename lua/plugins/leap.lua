return {
	"ggandor/leap.nvim",
	init = function()
		local bind = function(lhs, rhs, desc)
			vim.keymap.set({ "n", "o" }, lhs, rhs, { desc = desc })
		end

		bind("<leader><leader>", "<Plug>(leap)")
	end,
}
