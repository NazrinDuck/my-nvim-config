local status, db = pcall(require, "dashboard")
if not status then
	return
end

db.setup({
	theme = "hyper",
	hide = {
		statusline = true, -- hide statusline default is true
		tabline = true, -- hide the tabline
		winbar = true, -- hide winbar
	},
	preview = {
		command = "cat | lolcat -t -F 0.25", -- preview command
		--file_path = "~/.config/nvim/nazrin-duck.cat", -- preview file path
		file_path = "~/.config/nvim/flandre.cat", -- preview file path
		file_height = 15, -- preview file height
		file_width = 83, -- preview file width
		--file_width = 108,                       -- preview file width
	},
	config = {
		week_header = {
			enable = false,
		},
		packages = { enable = true },
		shortcut = {
			{ desc = "󰊳 Update", group = "@property", action = "PackerSync", key = "u" },
			{
				icon = " ",
				icon_hl = "@variable",
				desc = "Files",
				group = "Label",
				action = "Telescope find_files",
				key = "f",
			},
			{
				desc = " Apps",
				group = "DiagnosticHint",
				action = "Telescope app",
				key = "a",
			},
			{
				desc = " dotfiles",
				group = "Number",
				action = "Telescope dotfiles",
				key = "d",
			},
		},
	},
})
--[[
db.custom_header = {
	"███╗   ██╗ █████╗ ███████╗██████╗ ██╗███╗   ██╗██████╗ ██╗   ██╗ ██████╗██╗  ██╗",
	"████╗  ██║██╔══██╗╚══███╔╝██╔══██╗██║████╗  ██║██╔══██╗██║   ██║██╔════╝██║ ██╔╝",
	"██╔██╗ ██║███████║  ███╔╝ ██████╔╝██║██╔██╗ ██║██║  ██║██║   ██║██║     █████╔╝ ",
	"██║╚██╗██║██╔══██║ ███╔╝  ██╔══██╗██║██║╚██╗██║██║  ██║██║   ██║██║     ██╔═██╗ ",
	"██║ ╚████║██║  ██║███████╗██║  ██║██║██║ ╚████║██████╔╝╚██████╔╝╚██████╗██║  ██╗",
	"╚═╝  ╚═══╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═╝╚═╝  ╚═══╝╚═════╝  ╚═════╝  ╚═════╝╚═╝  ╚═╝",
}
]]
--
--
require("ibl").setup({
	exclude = {
		filetypes = {
			"dashboard",
			"help",
			"startify",
			"aerial",
			"alpha",
			"packer",
			"neogitstatus",
			"NvimTree",
			"neo-tree",
			"Trouble",
		},
	},
})
