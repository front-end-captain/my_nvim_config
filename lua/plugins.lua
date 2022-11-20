local packer = require("packer")

packer.startup({
	function(use)
		-- Packer can manage self
		use("wbthomason/packer.nvim")

		use("rcarriga/nvim-notify")

		-- color theme
		-- gruvbox
		use({ "ellisonleao/gruvbox.nvim", requires = { "rktjmp/lush.nvim" } })
		use({
			"mcchrish/zenbones.nvim",
			requires = "rktjmp/lush.nvim",
		})
		-- Remove all background colors to make nvim transparent
		use("xiyaowong/nvim-transparent")

		-- file explorer
		use({
			"kyazdani42/nvim-tree.lua",
			commit = "ce5d0a6b7ddfec622554943d2ebcc739b1d74567",
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
    use({ "RRethy/vim-illuminate" })

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
		-- a winbar show current code context
		use({
			"SmiteshP/nvim-navic",
			requires = "neovim/nvim-lspconfig",
		})
		use("ray-x/lsp_signature.nvim")

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
		-- use("hrsh7th/cmp-cmdline") -- { name = 'cmdline' }

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

		-- outline
		use("stevearc/aerial.nvim")

		-- wild menu
		use("gelguy/wilder.nvim")
		-- surround selections
		use("kylechui/nvim-surround")

    -- color highlighter
		use("NvChad/nvim-colorizer.lua")
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
