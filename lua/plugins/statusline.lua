local gruvbox = {
	n = "#a89985",
	i = "#84a598",
	c = "#8fbf7f",
	v = "#fc802d",
}

local function cwd()
	local buf = vim.api.nvim_buf_get_name(0)
	local abs_dir = vim.fs.normalize(vim.fs.dirname(buf))
	local path_list = vim.split(abs_dir, "/", { trimempty = true })
	local top_3 = vim.list_slice(path_list, math.max(#path_list - 2, 0))
	local trunc_path = "../" .. vim.fn.join(top_3, "/")

	return trunc_path
end

return {
	"tamton-aquib/staline.nvim",
	opts = {
		sections = {
			left = { "-file_name", "branch", " " },
			mid = { "lsp" },
			right = { "- ", { "StalineFill", cwd }, "- ", "line_column" },
		},
		mode_colors = gruvbox,
		defaults = {
			true_colors = true,
			line_column = " [%l/%L]:%c",
			branch_symbol = " ",
		},
	},
}
