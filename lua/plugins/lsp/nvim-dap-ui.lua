return {
	"rcarriga/nvim-dap-ui",
	dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio", "theHamsta/nvim-dap-virtual-text" },

	config = function(_, opts)
		require("dapui").setup(opts)
		require("nvim-dap-virtual-text").setup()

		local dap, dapui = require("dap"), require("dapui")

		dap.listeners.after.event_initialized["dapui_config"] = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated["dapui_config"] = function()
			dapui.close()
		end
		dap.listeners.before.event_exited["dapui_config"] = function()
			dapui.close()
		end
	end,

	---@module "dapui"
	---@type dapui.Config
	opts = {
		controls = {
			element = "repl",
			enabled = true,
			icons = {
				disconnect = "",
				pause = "",
				play = "",
				run_last = "",
				step_back = "",
				step_into = "",
				step_out = "",
				step_over = "",
				terminate = "",
			},
		},
		element_mappings = {},
		expand_lines = false,
		floating = {
			border = "single",
			mappings = {
				close = { "q", "<Esc>" },
			},
		},
		force_buffers = true,
		icons = {
			collapsed = "",
			current_frame = "",
			expanded = "",
		},
		layouts = {
			{
				elements = {
					{
						id = "scopes",
						size = 0.50,
					},
					{
						id = "watches",
						size = 0.50,
					},
				},
				position = "left",
				size = 75,
			},
			{
				elements = {
					{
						id = "repl",
						size = 0.25,
					},
					{
						id = "console",
						size = 0.75,
					},
				},
				position = "bottom",
				size = 10,
			},
		},
		mappings = {
			edit = "e",
			expand = { "<CR>", "<2-LeftMouse>" },
			open = "o",
			remove = "d",
			repl = "r",
			toggle = "t",
		},
		render = {
			indent = 1,
			max_value_lines = 100,
		},
	},
}
