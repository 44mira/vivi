--[[
This plugin gives Neovim a fuzzy-finder panel. This allows us to search on
various groups and perform actions based on pre-defined functions.

Try out `<leader>sk` to search for normal mode keymaps!

Relevant keybindings can be found in the code below, all inside `bind` calls.
--]]

local function bind(lhs, rhs, opt)
	vim.keymap.set("n", lhs, rhs, opt)
end

return {
	-- "nvim-telescope/telescope.nvim",
	-- tag = "0.1.8",
	"ibhagwan/fzf-lua",
	dependencies = {
		-- "nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		-- require("telescope").setup({})
		-- local ts = require("telescope.builtin")

		local fzf = require("fzf-lua")

		bind("<leader>sf", fzf.files, { desc = "Fzf: Find files" })
		bind("<leader>s<leader>", fzf.buffers, { desc = "Fzf: Buffers" })
		bind("<leader>s/", fzf.lines, { desc = "Fzf: Buffer lines" })
		bind("<leader>sg", fzf.live_grep_native, { desc = "Fzf: Live GREP" })
		bind("<leader>sr", fzf.registers, { desc = "Fzf: Registers" })
		bind("<leader>sh", fzf.highlights, { desc = "Fzf: Highlights" })
	end,
}
