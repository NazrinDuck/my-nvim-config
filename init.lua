vim.keymap.set("n", " ", "<Nop>", { silent = true, remap = false })
vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("maps")
require("settings")
require("plugins")

-- colorscheme config: kanagawa
--local themeStatus, kanagawa = pcall(require, "kanagawa")
local themeStatus, tokyonight = pcall(require, "tokyonight")

if themeStatus then
	--vim.cmd("colorscheme kanagawa")
	vim.cmd("colorscheme tokyonight-storm")
--[[
  --
	tokyonight.setup({
		transparent = true,
	})
  --]]
else
	return
end
