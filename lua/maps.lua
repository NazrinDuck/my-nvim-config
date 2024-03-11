local function map(mode, lhs, rhs)
	vim.keymap.set(mode, lhs, rhs, { silent = true })
end

local status1, telescope = pcall(require, "telescope.builtin")
if status1 then
	-- Telescope
	map("n", "<leader>ff", telescope.find_files)
	map("n", "<leader>fg", telescope.live_grep)
	map("n", "<leader>fb", telescope.buffers)
	map("n", "<leader>fh", telescope.help_tags)
	map("n", "<leader>fs", telescope.git_status)
	map("n", "<leader>fc", telescope.git_commits)
else
	print("Telescope not found")
end

local status2, dap = pcall(require, "dap")
if status2 then
	map("n", "<leader>db", "<CMD>lua require'dap'.toggle_breakpoint()<CR>")
	map("n", "<leader>dc", "<CMD>lua require'dap'.continue()<CR>")
	map("n", "<leader>dr", "<CMD>lua require'dap'.repl.open()<CR>")
--map("n", "<leader>dp", dap.toggle_breakpoint())
--map("n", "<leader>dc", dap.continue())
else
	print("Dap not found")
end
-- Move
map("n", "<C-k>", "9k")
map("n", "<C-j>", "9j")
-- Save
map("n", "<leader>w", "<CMD>update<CR>")

-- Quit
-- map("n", "<leader>q", "<CMD>q<CR>")
map("n", "<leader>q", "<CMD>bd<CR>")

-- Exit insert mode
map("i", "jj", "<ESC>")

-- Windows
map("n", "<leader>s", "<CMD>vsplit<CR>")
map("n", "<leader>p", "<CMD>split<CR>")

-- NvimTree
map("n", "<leader>e", "<CMD>NvimTreeToggle<CR>")
-- NeoTree
map("n", "<leader>o", "<CMD>Neotree toggle<CR>")

--Netrw
map("n", "<leader>x", "<CMD>Explore<CR>")
-- map("n", "<leader>c", "<CMD>Sex<CR>")

-- Buffer
map("n", "<TAB>", "<CMD>BufferLineCyclePrev<CR>")
map("n", "<S-TAB>", "<CMD>BufferLineCycleNext<CR>")
-- Terminal
map("n", "<leader>th", "<CMD>ToggleTerm size=10 direction=horizontal<CR>")
map("n", "<leader>tv", "<CMD>ToggleTerm size=80 direction=vertical<CR>")

-- Markdown Preview
map("n", "<leader>m", "<CMD>MarkdownPreview<CR>")
map("n", "<leader>mn", "<CMD>MarkdownPreviewStop<CR>")

-- Window Navigation

map("n", "<leader>h", "<C-w>h")
map("n", "<leader>l", "<C-w>l")
map("n", "<leader>k", "<C-w>k")
map("n", "<leader>j", "<C-w>j")

-- Resize Windows
map("n", "<A-l>", "<C-w><")
map("n", "<A-h>", "<C-w>>")
map("n", "<A-k>", "<C-w>+")
map("n", "<A-j>", "<C-w>-")

--LeetCode
map("n", "<leader>ll", "<CMD>LeetCodeList<cr>")
map("n", "<leader>lt", "<CMD>LeetCodeTest<cr>")
map("n", "<leader>ls", "<CMD>LeetCodeSubmit<cr>")
map("n", "<leader>li", "<CMD>LeetCodeSignIn<cr>")
