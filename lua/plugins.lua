local packer = require("packer")

packer.startup({
  function(use)
    -- Packer can manage self
    use("wbthomason/packer.nvim")

    use("rcarriga/nvim-notify")

    -- color theme
    use({ "luisiacc/gruvbox-baby" })
    use({ "folke/tokyonight.nvim" })
    -- Remove all background colors to make nvim transparent
    use("xiyaowong/nvim-transparent")

    -- file explorer
    use({
      "nvim-tree/nvim-tree.lua",
      requires = "nvim-tree/nvim-web-devicons",
      commit = "b1e074d2b52d45c8327b5b43a498b3d7e6c93b97"
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
      -- requires = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-live-grep-args.nvim" },
      requires = { "nvim-lua/plenary.nvim" },
      commit = "40c31fdde93bcd85aeb3447bb3e2a3208395a868",
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
      -- requires = { "nvim-lua/plenary.nvim" },
      tag = "release",
    })

    -- lspconfig
    use({ "williamboman/nvim-lsp-installer", commit = "17e0bfa5f2c8854d1636fcd036dc8284db136baa" })
    use({ "neovim/nvim-lspconfig", commit = "7b98aadc6e85db4fc3af6c1ec22c4774d965506e" })
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

    -- Display a character as the colorcolumn.
    use("xiyaowong/virtcolumn.nvim")

    -- persist and toggle multiple terminals during an editing session.
    -- use("akinsho/toggleterm.nvim")
    -- use("numToStr/FTerm.nvim")

    -- Rust 增强
    use("simrat39/rust-tools.nvim")
  end,

  config = {
    max_jobs = 16,
    display = {
      open_fn = function()
        return require("packer.util").float({ border = "single" })
      end,
    },
  },
})
