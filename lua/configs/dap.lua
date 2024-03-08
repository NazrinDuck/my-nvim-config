local status1, dap = pcall(require, "dap")
local status2, dapui = pcall(require, "dapui")

if not status1 then
	return
end
if not status2 then
	return
end

vim.keymap.set(
	{ "i", "n", "v" },
	"<F5>",
	"<cmd>lua require'dap'.continue()<CR>",
	{ silent = true, noremap = true, buffer = bufnr }
)
vim.keymap.set(
	{ "i", "n", "v" },
	"<F8>",
	"<cmd>lua require'dap'.step_over()<CR>",
	{ silent = true, noremap = true, buffer = bufnr }
)
vim.keymap.set(
	{ "i", "n", "v" },
	"<F9>",
	"<cmd>lua require'dap'.step_into()<CR>",
	{ silent = true, noremap = true, buffer = bufnr }
)
vim.keymap.set(
	{ "i", "n", "v" },
	"<F10>",
	"<cmd>lua require'dap'.step_over()<CR>",
	{ silent = true, noremap = true, buffer = bufnr }
)
vim.keymap.set(
	{ "i", "n", "v" },
	"<F12>",
	"<cmd>lua require'dap'.toggle_breakpoint()<CR>",
	{ silent = true, noremap = true, buffer = bufnr }
)

dap.adapters.cppdbg = {
	id = "cppdbg",
	type = "executable",
	command = "/home/mousetduck/.local/share/nvim/mason/bin/OpenDebugAD7",
}

dap.adapters.gdb = {
	type = "executable",
	command = "gdb",
	args = { "-i", "dap" },
}
--
--
--
dap.configurations.cpp = {
	{
		name = "Launch file",
		type = "cppdbg",
		request = "launch",
		program = function()
			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
		end,
		cwd = "${workspaceFolder}",
		stopAtEntry = true,
	},
	{
		name = "Attach to gdbserver :1234",
		type = "cppdbg",
		request = "launch",
		MIMode = "gdb",
		miDebuggerServerAddress = "localhost:1234",
		miDebuggerPath = "/usr/bin/gdb",
		cwd = "${workspaceFolder}",
		program = function()
			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
		end,
	},
}

dap.configurations.c = dap.configurations.cpp
--https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation

dapui.setup({
	icons = { expanded = "", collapsed = "", current_frame = "" },
	mappings = {
		-- Use a table to apply multiple mappings
		expand = { "<CR>", "<2-LeftMouse>" },
		open = "o",
		remove = "d",
		edit = "e",
		repl = "r",
		toggle = "t",
	},
	layouts = {
		{
			elements = {
				{
					id = "scopes",
					size = 0.35,
				},
				{ id = "stacks", size = 0.35 },
				{ id = "watches", size = 0.15 },
				{ id = "breakpoints", size = 0.15 },
			},
			size = 40,
			position = "left",
		},
		{
			elements = {
				"repl",
			},
			size = 5,
			position = "bottom",
		},
	},

	controls = { enabled = false },
	floating = {
		max_height = nil, -- These can be integers or a float between 0 and 1.
		max_width = nil, -- Floats will be treated as percentage of your screen.
		border = "single", -- Border style. Can be "single", "double" or "rounded"
		mappings = {
			close = { "q", "<Esc>" },
		},
	},
	windows = { indent = 1 },
})

dap.listeners.before.attach.dapui_config = function()
	dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
	dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
	dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
	dapui.close()
end

require("nvim-dap-virtual-text").setup({
	enabled = true,
	enable_commands = true,
	highlight_changed_variables = true,
	highlight_new_as_changed = false,
	show_stop_reason = true,
	commented = false,
	only_first_definition = true,
	all_references = false,
	filter_references_pattern = "<module",
	virt_text_pos = "eol",
	all_frames = false,
	virt_lines = false,
	virt_text_win_col = nil,
})
--
-- dapui.float_element(<element ID>, <optional settings>)
