vim.keymap.set("n", " ", "<Nop>", { silent = true, remap = false })
vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("maps")
require("settings")
require("plugins")

-- colorscheme config: night fox
--local themeStatus, kanagawa = pcall(require, "kanagawa")
--local themeStatus, tokyonight = pcall(require, "tokyonight")
local themeStatus, nightfox = pcall(require, "nightfox")

if themeStatus then
  vim.cmd("colorscheme kanagawa-dragon")
  --vim.cmd("colorscheme nordfox")
else
  return
end
