-- Automatically run: PackerCompile
vim.api.nvim_create_autocmd("BufWritePost", {
	group = vim.api.nvim_create_augroup("PACKER", { clear = true }),
	pattern = "plugins.lua",
	command = "source <afile> | PackerCompile",
})

return require("packer").startup(function(use)
	-- Packer
	use("wbthomason/packer.nvim")

	-- Common utilities
	use("nvim-lua/plenary.nvim")

	-- Icons
	use("nvim-tree/nvim-web-devicons")

	-- Colorschema
	use("rebelot/kanagawa.nvim")
	use("EdenEast/nightfox.nvim")
	use("folke/tokyonight.nvim")

	-- Statusline
	use({
		"nvim-lualine/lualine.nvim",
		event = "BufEnter",
		config = function()
			require("configs.lualine")
		end,
		requires = { "nvim-web-devicons" },
	})
	-- unused
	use({
		"nanozuki/tabby.nvim",
		event = "VimEnter",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			--require("configs.tabby")
		end,
	})
	-- buffer line
	use({
		"akinsho/bufferline.nvim",
		tag = "*",
		requires = "nvim-tree/nvim-web-devicons",
		config = function()
			require("configs.bufferline")
		end,
	})

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
		config = function()
			require("configs.treesitter")
		end,
	})

	use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" })

	-- Telescope
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		requires = { "nvim-lua/plenary.nvim", "BurntSushi/ripgrep" },
	})

	use({
		"williamboman/nvim-lsp-installer",
		config = function()
			require("nvim-lsp-installer").setup({
				automatic_installation = true, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
				ui = {
					icons = {
						server_installed = "✓",
						server_pending = "➜",
						server_uninstalled = "✗",
					},
				},
			})
		end,
	})
	-- LSP
	use({
		"neovim/nvim-lspconfig",
		config = function()
			require("configs.lsp")
		end,
	})

	use({
		"akinsho/flutter-tools.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
			"stevearc/dressing.nvim", -- optional for vim.ui.select
		},
		config = function()
			require("flutter-tools").setup({})
		end,
	})

	-- LSP outline
	use({
		"hedyhli/outline.nvim",
		config = function()
			-- Example mapping to toggle outline
			vim.keymap.set("n", "<leader>o", "<cmd>Outline<CR>", { desc = "Toggle Outline" })

			require("outline").setup({
				-- Your setup opts here (leave empty to use defaults)
			})
		end,
	})

	use("onsails/lspkind.nvim")
	use("mfussenegger/nvim-lint")

	-- snippets
	-- use("rafamadriz/friendly-snippets")
	use({
		"L3MON4D3/LuaSnip",
		-- follow latest release.
		tag = "v2.*",
		run = "make install_jsregexp",

		requires = {
			"rafamadriz/friendly-snippets",
		},
		--[[
    config = function()
      require("luasnip").setup({})
    end,
    ]]
	})

	-- cmp: Autocomplete
	use({
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		config = function()
			require("configs.cmp")
		end,
	})

	use("hrsh7th/cmp-nvim-lsp")
	use({ "hrsh7th/cmp-path", after = "nvim-cmp" })
	use({ "hrsh7th/cmp-buffer", after = "nvim-cmp" })
	use({ "saadparwaiz1/cmp_luasnip", after = "nvim-cmp" })
	-- cmp end
	-- LSP diagnostics, code actions, and more via Lua.
	use({
		"jose-elias-alvarez/null-ls.nvim",
		config = function()
			require("configs.null-ls")
		end,
		requires = { "nvim-lua/plenary.nvim" },
	})

	-- Mason: Portable package manager
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")

	-- File manager
	use({
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		requires = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
	})
	use({
		"nvim-tree/nvim-tree.lua",
		requires = "nvim-tree/nvim-web-devicons",
		config = function()
			require("nvim-tree").setup({
				view = {
					width = 25,
				},
				renderer = {
					group_empty = true,
				},
				filters = {
					dotfiles = true,
				},
			})
		end,
	})

	-- Show colors
	use({
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup({ "*" })
		end,
	})

	-- Terminal
	use({
		"akinsho/toggleterm.nvim",
		tag = "*",
		config = function()
			require("configs.toggleterm")
		end,
	})

	-- Git
	use({
		"lewis6991/gitsigns.nvim",
		config = function()
			require("configs.gitsigns")
		end,
	})

	-- Markdown Preview
	use({
		"iamcco/markdown-preview.nvim",
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
	})

	-- Auto pairs
	use({
		"windwp/nvim-autopairs",
		config = function()
			require("configs.autopairs")
		end,
	})

	-- Background Transparent
	use({
		"xiyaowong/nvim-transparent",
		config = function()
			require("transparent").setup({
				--vim.cmd("TransparentEnable"),
				extra_groups = {
					"BufferLineTabClose",
					"BufferlineBufferSelected",
					"BufferLineFill",
					"BufferLineBackground",
					"BufferLineSeparator",
					"BufferLineIndicatorSelected",
				},
				exclude_groups = {},
			})
		end,
	})

	--wakatime
	use("wakatime/vim-wakatime")

	--codeforce
	use({
		"yunusey/codeforces-nvim",
		config = function()
			require("configs.codeforces")
		end,
	})
	--LeetCode
	use({
		"mbledkowski/neuleetcode.vim",
		--  g:leetcode_browser = "Chrome"
	})

	use({
		"kawre/leetcode.nvim",
		config = function()
			require("configs.leetcode")
		end,
	})

	use("MunifTanjim/nui.nvim")
	use({
		"rcarriga/nvim-notify",
		config = function()
			require("configs.notify")
		end,
	})
	use("lukas-reineke/indent-blankline.nvim")
	use({
		"hiphish/rainbow-delimiters.nvim",
		config = function()
			require("configs.rainbow")
		end,
	})
	use({
		"rcarriga/nvim-dap-ui",
		requires = { "mfussenegger/nvim-dap" },
		config = function()
			require("configs.dap")
		end,
	})
	use({
		"kylechui/nvim-surround",
		tag = "*", -- Use for stability; omit to use `main` branch for the latest features
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end,
	})

	use({
		"nvimdev/dashboard-nvim",
		event = "VimEnter",
		theme = "doom", --  theme is doom and hyper default is hyper
		config = function()
			require("configs.dashboard")
		end,
		requires = { "nvim-tree/nvim-web-devicons" },
	})
	--winbar
	use("theHamsta/nvim-dap-virtual-text")
	use({
		"S1M0N38/love2d.nvim",
		cmd = "LoveRun",
		config = function()
			require("love2d").setup({
				path_to_love_bin = "love",
				path_to_love_library = vim.fn.globpath(vim.o.runtimepath, "love2d/library"),
				restart_on_save = false,
			})
		end,
	})
end)
