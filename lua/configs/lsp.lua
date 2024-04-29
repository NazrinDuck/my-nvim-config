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

if not status_mason then
  return
end

if not status_masonlsp then
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
--- LSP ---
--[[
local on_windows = vim.loop.os_uname().version:match("Windows")

local function join_paths(...)
	local path_sep = on_windows and "\\" or "/"
	local result = table.concat({ ... }, path_sep)
	return result
end
]]

-- vim.cmd([[set runtimepath=$VIMRUNTIME]])

--[[
local temp_dir = vim.loop.os_getenv("TEMP") or "/tmp"

vim.cmd("set packpath=" .. join_paths(temp_dir, "nvim", "site"))

local package_root = join_paths(temp_dir, "nvim", "site", "pack")
local lspconfig_path = join_paths(package_root, "test", "start", "nvim-lspconfig")

if vim.fn.isdirectory(lspconfig_path) ~= 1 then
	vim.fn.system({ "git", "clone", "https://github.com/neovim/nvim-lspconfig", lspconfig_path })
end

vim.lsp.set_log_level("trace")
require("vim.lsp.log").set_format_func(vim.inspect)
]]

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
  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

  -- Mappings.
  --[[
  local opts = { buffer = bufnr, noremap = true, silent = true }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-o>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>ba', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<space>br', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<space>bl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>d', vim.diagnostic.open_float, opts)
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
    vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)
  end
  ]]

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
  --  root_dir = nvim_lsp.util.root_pattern({ "c-output", "cpp-output" }),
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
--PHP
nvim_lsp.intelephense.setup({
  root_dir = nvim_lsp.util.root_pattern("index.php"),
  on_attach = on_attach,
  capabilities = capabilities,
})
--PHP
nvim_lsp.intelephense.setup({
  root_dir = nvim_lsp.util.root_pattern("index.php"),
  on_attach = on_attach,
  capabilities = capabilities,
})
--PHP
nvim_lsp.intelephense.setup({
  root_dir = nvim_lsp.util.root_pattern("index.php"),
  on_attach = on_attach,
  capabilities = capabilities,
})
--PHP
nvim_lsp.intelephense.setup({
  root_dir = nvim_lsp.util.root_pattern("index.php"),
  on_attach = on_attach,
  capabilities = capabilities,
})
--PHP
nvim_lsp.intelephense.setup({
  root_dir = nvim_lsp.util.root_pattern("index.php"),
  on_attach = on_attach,
  capabilities = capabilities,
})
--PHP
nvim_lsp.intelephense.setup({
  root_dir = nvim_lsp.util.root_pattern("index.php"),
  on_attach = on_attach,
  capabilities = capabilities,
})
