local status, nvim_lsp = pcall(require, "lspconfig")
local status_lsp, nvim_lsp_installer = pcall(require, "nvim-lsp-installer")
local status_mason, mason = pcall(require, "mason")
local status_masonlsp, masonlsp = pcall(require, "mason-lspconfig")
if not status then
	return
end

if not status_lsp then
	return
end

mason.setup({
	PATH = "prepend",
	-- "skip" seems to cause the spawning error
})

masonlsp.setup({
	automatic_installation = true,
	ensure_installed = {
		"clangd",
		"cssls",
		"eslint",
		"html",
		"jsonls",
		"tsserver",
		"pyright",
		"tailwindcss",
		"lua_ls",
		"intelephense",
		"volar",
		"asm_lsp",
		"emmet_ls",
		"rust_analyzer",
		"bashls",
		"powershell_es",
		"java_language_server",
		"jdtls",
		"omnisharp",
		"omnisharp_mono",
	},
})

nvim_lsp_installer.setup({
	automatic_installation = true, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
	ui = {
		icons = {
			server_installed = "✓",
			server_pending = "➜",
			server_uninstalled = "✗",
		},
	},
})

local protocol = require("vim.lsp.protocol")

local on_attach = function(client, bufnr)
	-- format on save
	if client.server_capabilities.documentFormattingProvider then
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = vim.api.nvim_create_augroup("Format", { clear = true }),
			buffer = bufnr,
			callback = function()
				--  vim.lsp.buf.formatting_seq_sync()
			end,
		})
	end
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- TypeScript
nvim_lsp.tsserver.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

-- CSS
nvim_lsp.cssls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

-- Tailwind
nvim_lsp.tailwindcss.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

--C/C++
nvim_lsp.clangd.setup({
	root_dir = nvim_lsp.util.root_pattern({ "c-output", "cpp-output" }),
	on_attach = on_attach,
	capabilities = capabilities,
})

--HTML
nvim_lsp.html.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

--Lua
nvim_lsp.lua_ls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

--Vue
nvim_lsp.volar.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})
--[[
nvim_lsp.vuels.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})
]]
--

--Assembly
nvim_lsp.asm_lsp.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

--Emmet
nvim_lsp.emmet_ls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

--Rust
nvim_lsp.rust_analyzer.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

-- nvim_lsp.java_language_server.setup({
nvim_lsp.jdtls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

--Python
nvim_lsp.pyright.setup({
	root_dir = nvim_lsp.util.root_pattern("__pycache__"),
	on_attach = on_attach,
	capabilities = capabilities,
})

--Poweshell
nvim_lsp.powershell_es.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

--Bash
nvim_lsp.bashls.setup({
	filetypes = { "bash", "sh" },
	on_attach = on_attach,
	capabilities = capabilities,
})

--C#
nvim_lsp.omnisharp_mono.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})
--PHP
nvim_lsp.intelephense.setup({
	root_dir = nvim_lsp.util.root_pattern("index.php"),
	on_attach = on_attach,
	capabilities = capabilities,
})
