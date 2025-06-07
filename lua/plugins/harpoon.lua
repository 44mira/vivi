-- Blazingly fast project marks

return {
	"ThePrimeagen/harpoon",
	config = function()
		require("harpoon").setup({})

		local bind = vim.keymap.set

		-- Mark creation and finding
		bind("n", "<leader>m", require("harpoon.mark").add_file, { desc = "[M]ake mark" })
		bind("n", "<leader>om", require("harpoon.ui").toggle_quick_menu, { desc = "[O]pen marks" })

		-- Scroll through marks
		bind("n", "<leader>wj", require("harpoon.ui").nav_prev, { desc = "[W]arp to previous mark" })
		bind("n", "<leader>wk", require("harpoon.ui").nav_next, { desc = "[W]arp to next mark" })

		-- Jump through marks like tabs
		for i = 1, 9 do
			bind("n", ("<M-%d>"):format(i), function()
				require("harpoon.ui").nav_file(i)
			end, { desc = ("Jump to mark %d"):format(i) })
		end
	end,
}
