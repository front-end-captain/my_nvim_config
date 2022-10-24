local packer = require("packer")

packer.startup({
	function(use)
		-- Packer can manage self
		use("wbthomason/packer.nvim")

		-- color theme
		-- OceanicNext
		use("mhartington/oceanic-next")
		-- gruvbox
		use({ "ellisonleao/gruvbox.nvim", requires = { "rktjmp/lush.nvim" } })
		-- nord
		use("shaunsingh/nord.nvim")
		-- onedark
		use("ful1e5/onedark.nvim")
		-- nightfox
		use("EdenEast/nightfox.nvim")
		-- Remove all background colors to make nvim transparent
		use("xiyaowong/nvim-transparent")

		-- file explorer
		use({
			"kyazdani42/nvim-tree.lua",
			requires = "kyazdani42/nvim-web-devicons",
		})

		-- buffer line(with tabpage integration)
		use({
			"akinsho/bufferline.nvim",
			tag = "*",
			requires = { "kyazdani42/nvim-web-devicons", "moll/vim-bbye" },
		})

		-- statusline
		use({ "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons" } })

		-- finder
		use({
			"nvim-telescope/telescope.nvim",
			requires = { "nvim-lua/plenary.nvim" },
		})
		use("LinArcX/telescope-env.nvim")

		-- welcome screen
		use("glepnir/dashboard-nvim")
		use("ahmedkhalf/project.nvim")

		use("arkav/lualine-lsp-progress")

		-- syntax highlight
		use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })

		-- git integration for buffers
		use({
			"lewis6991/gitsigns.nvim",
			requires = {
				"nvim-lua/plenary.nvim",
			},
			tag = "release",
		})

		-- lspconfig
		use({ "williamboman/nvim-lsp-installer" })
		use({ "neovim/nvim-lspconfig" })
		use("onsails/lspkind-nvim")

		-- code completion
		use("hrsh7th/nvim-cmp")
		-- snippet completion
		use("hrsh7th/vim-vsnip")
		use("rafamadriz/friendly-snippets")
		-- completion source
		use("hrsh7th/cmp-vsnip")
		use("hrsh7th/cmp-nvim-lsp") -- { name = nvim_lsp }
		use("hrsh7th/cmp-buffer") -- { name = 'buffer' },
		use("hrsh7th/cmp-path") -- { name = 'path' }
		use("hrsh7th/cmp-cmdline") -- { name = 'cmdline' }

		-- indent-blankline
		use("lukas-reineke/indent-blankline.nvim")

		-- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
		use({ "jose-elias-alvarez/null-ls.nvim", requires = "nvim-lua/plenary.nvim" })

		-- code comment
		use("numToStr/Comment.nvim")
		-- better tsx/jsx comment
		use("JoosepAlviste/nvim-ts-context-commentstring")

		-- access to the schemastore
		use("b0o/schemastore.nvim")

		use({ "jose-elias-alvarez/nvim-lsp-ts-utils", requires = "nvim-lua/plenary.nvim" })

		-- Preview markdown
		use("ellisonleao/glow.nvim")

		-- Neovim UI Enhancer
		use("stevearc/dressing.nvim")
		-- fix working dir root
		use("notjedi/nvim-rooter.lua")
		-- todo comment highlight. brew install ripgrep https://github.com/BurntSushi/ripgrep#installation
		use({
			"folke/todo-comments.nvim",
			requires = "nvim-lua/plenary.nvim",
		})

		use("stevearc/aerial.nvim")
	end,

	config = {
		-- 并发数限制
		max_jobs = 16,
		-- 自定义源
		git = {
			-- default_url_format = "https://hub.fastgit.xyz/%s",
			-- default_url_format = "https://mirror.ghproxy.com/https://github.com/%s",
			-- default_url_format = "https://gitcode.net/mirrors/%s",
			-- default_url_format = "https://gitclone.com/github.com/%s",
		},
		display = {
			open_fn = function()
				return require("packer.util").float({ border = "single" })
			end,
		},
	},
})
