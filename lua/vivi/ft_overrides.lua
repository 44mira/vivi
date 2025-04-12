vim.api.nvim_create_augroup("vivi-filetype-overrides", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "markdown" },
	group = "vivi-filetype-overrides",
	callback = function()
		vim.o.softtabstop = 0
		vim.o.tabstop = 2
		vim.o.shiftwidth = 2
		vim.o.expandtab = true
		vim.o.smarttab = true
	end,
})

vim.api.nvim_create_autocmd("BufEnter", {
	pattern = { "/tmp/**/*.org" },
	group = vim.api.nvim_create_augroup("vivi-nocomplete-tmp-org", { clear = true }),
	callback = function()
		vim.b.completion = false
	end,
})
