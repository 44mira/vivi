-- Plugin for viewing the file tree

return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
		-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
	},
	lazy = false,
	opts = {
		close_if_last_window = true,
		window = {
			position = "right",
		},
		filesystem = {
			filtered_items = {
				hide_dotfiles = false,
			},
		},
	},
	keys = {
		{ "<leader>tt", "<cmd>Neotree toggle<cr>", { desc = "Toggle file tree" } },
	},
}
