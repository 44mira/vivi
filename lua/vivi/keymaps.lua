local bind = vim.keymap.set

-- map the leader key to space
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- ergonomic normal mode
bind("i", "jk", "<Esc>", { desc = "Normal mode" })

-- sanity binds
bind("n", "<Esc>", "<cmd>nohlsearch<cr>", { desc = "Clear highlight" })

---@deprecated Use oil.nvim
-- bind('n', '<leader>f', '<cmd>Ex<cr>', { desc = 'Open file explorer' })

-- window navigation
for direction in ("hjkl"):gmatch(".") do
	bind("n", ("<C-%s>"):format(direction), ("<C-w><C-%s>"):format(direction), {
		desc = "Window" .. direction,
	})
end

-- buffer navigation
bind("n", "<leader>[", "<cmd>bp<cr>", { desc = "Previous buffer" })
bind("n", "<leader>]", "<cmd>bn<cr>", { desc = "Next buffer" })
bind("n", "<leader>bd", "<cmd>bd<cr>", { desc = "Buffer delete" })

-- assign a colorcolumn to column <count>. defaults to 80
bind("n", "<leader>cc", function()
	if vim.o.colorcolumn ~= "" then
		vim.o.colorcolumn = ""
		return
	end

	if vim.v.count ~= 0 then
		vim.o.colorcolumn = vim.v.count .. ""
	else
		vim.o.colorcolumn = "80"
	end
end, { desc = "Toggle colorcolumn" })

-- moveline {{{
---@param direction integer The direction of the move
---@return fun() : nil # The callback for moving
local function moveline(direction)
	return function()
		local cursor, c = vim.fn.line("."), vim.fn.line("$")

		local new_address = cursor + direction * vim.v.count1

		-- edge check
		if new_address < 0 or new_address > c then
			return
		end

		local out = "move " .. new_address

		vim.cmd(out)
	end
end
-- }}}
--
bind("n", "<M-Down>", moveline(1), { desc = "Move line down" })
bind("n", "<M-Up>", moveline(-2), { desc = "Move line up" })

-- hide statusline
bind("n", "<leader>ss", function()
	if vim.o.laststatus ~= 0 then
		vim.o.laststatus = 0
		vim.o.signcolumn = "no"
		vim.o.fillchars = "eob: ," .. vim.o.fillchars
	else
		vim.o.laststatus = 3
		vim.o.signcolumn = "yes"
		vim.o.fillchars = vim.o.fillchars:sub(string.len("eob: ,") + 1)
	end
end, { desc = "Toggle statusline" })

-- toggle inlay hints
vim.lsp.inlay_hint.enable(true)
bind("n", "<leader>th", function()
	vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { desc = "Toggle inlay hints" })
