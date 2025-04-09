return {
	"mfussenegger/nvim-dap",
	config = function()
		local dap = require("dap")

		vim.keymap.set("n", "<F5>", dap.continue, { desc = "DAP: Continue" })
		vim.keymap.set("n", "<F10>", dap.step_over, { desc = "DAP: Step Over" })
		vim.keymap.set("n", "<F11>", dap.step_into, { desc = "DAP: Step Into" })
		vim.keymap.set("n", "<F12>", dap.step_out, { desc = "DAP: Step Out" })
		vim.keymap.set("n", "<leader>bp", dap.toggle_breakpoint, { desc = "DAP: Toggle Breakpoint" })

		-- Lua {{{
		-- dap.adapters["local-lua"] = {
		-- 	type = "executable",
		-- 	command = "node",
		-- 	args = {
		-- 		"/home/mira/.local-lua-debugger/extension/debugAdapter.js",
		-- 	},
		-- 	enrich_config = function(config, on_config)
		-- 		if not config["extensionPath"] then
		-- 			local c = vim.deepcopy(config)
		-- 			-- 💀 If this is missing or wrong you'll see
		-- 			-- "module 'lldebugger' not found" errors in the dap-repl when trying to launch a debug session
		-- 			c.extensionPath = "/home/mira/.local-lua-debugger"
		-- 			on_config(c)
		-- 		else
		-- 			on_config(config)
		-- 		end
		-- 	end,
		-- }
		--
		-- dap.configurations.lua = {
		-- 	{
		-- 		name = "Current file (local-lua-dbg, lua)",
		-- 		type = "local-lua",
		-- 		request = "launch",
		-- 		cwd = "${workspaceFolder}",
		-- 		program = {
		-- 			lua = "lua5.4",
		-- 			file = "${file}",
		-- 		},
		-- 		args = {},
		-- 	},
		-- }
		-- }}}
	end,
}
