local global = vim.g
local o = vim.o

vim.scriptencoding = "utf-8"

-- Map <leader>
global.mapleader = " "
global.maplocalleader = " "
global.encoding = "UTF-8"
global.leetcode_browser = "chrome"
global.leetcode_china = 1
-- global.lightline = { "colortheme", "tokyonight" }
-- Editor options
--
vim.opt.sessionoptions = "curdir,folds,globals,help,tabpages,terminal,winsize"

o.showtabline = 2
o.number = true             -- Print the line number in front of each line
o.relativenumber = true     -- Show the line number relative to the line with the cursor in front of each line.
o.clipboard = "unnamedplus" -- uses the clipboard register for all operations except yank.
o.syntax = "on"             -- When this option is set, the syntax with this name is loaded.
o.autoindent = true         -- Copy indent from current line when starting a new line.
o.cursorline = true         -- Highlight the screen line of the cursor with CursorLine.
o.expandtab = true          -- In Insert mode: Use the appropriate number of spaces to insert a <Tab>.
-- >> << 时移动长度
o.shiftwidth = 2            -- Number of spaces to use for each step of (auto)indent.
o.tabstop = 2               -- Number of spaces that a <Tab> in the file counts for.
o.encoding = "utf-8"        -- Sets the character encoding used inside Vim.
o.fileencoding = "utf-8"    -- Sets the character encoding for the file of this buffer.
o.ruler = true              -- Show the line and column number of the cursor position, separated by a comma.
o.mouse = "a"               -- Enable the use of the mouse. "a" you can use on all modes
o.title = true              -- When on, the title of the window will be set to the value of 'titlestring'
o.hidden = true             -- When on a buffer becomes hidden when it is |abandon|ed
o.ttimeoutlen = 0           -- The time in milliseconds that is waited for a key code or mapped key sequence to complete.
o.wildmenu = true           -- When 'wildmenu' is on, command-line completion operates in an enhanced mode.
o.showcmd = true            -- Show (partial) command in the last line of the screen. Set this option off if your terminal is slow.
o.showmatch = true          -- When a bracket is inserted, briefly jump to the matching one.
o.inccommand =
"split"                     -- When nonempty, shows the effects of :substitute, :smagic, :snomagic and user commands with the :command-preview flag as you type.
o.splitbelow = "splitright" -- When on, splitting a window will put the new window below the current one
o.timeoutlen = 325          -- 325 for mapping
o.scrolloff = 8
o.sidescrolloff = 8
-- 高亮所在行
o.cursorline = true
-- 右侧参考线，超过表示代码太长了，考虑换行
o.colorcolumn = "100"
-- 搜索大小写不敏感，除非包含大写
o.ignorecase = true
o.smartcase = true
-- 不可见字符的显示，这里只把空格显示为一个点
o.list = true
o.listchars = "space:·,tab:··"
-- always show tabline
o.showtabline = 2
-- popup menu 10 items in max
o.pumheight = 10
-- 禁止创建备份文件
o.backup = false
o.writebackup = false
o.swapfile = false

--vim.cmd("let g:leetcode_browser='chrome'")
--vim.cmd("let g:leetcode_china=1")
local statusNotify, notify = pcall(require, "notify")
if statusNotify then
  vim.notify = notify
else
  print("Notify no found")
end
