local packer = require("packer")

packer.startup({
  function(use)
    -- Packer 可以管理自己本身
    use "wbthomason/packer.nvim"
    -- 插件列表...
    use({
      "kyazdani42/nvim-tree.lua",
      requires = "kyazdani42/nvim-web-devicons"
    })
    use({
      "akinsho/bufferline.nvim",
      tag = "*",
      requires = { "kyazdani42/nvim-web-devicons", "moll/vim-bbye" }
    })
    use({ "nvim-lualine/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons" } })
    use("arkav/lualine-lsp-progress")
    use({
      "nvim-telescope/telescope.nvim",
      commit = "b70256066ef95ace1e76af1556a76a045e12a306",
      requires = { "nvim-lua/plenary.nvim" }
    })
    use("LinArcX/telescope-env.nvim")
    use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
    use("glepnir/dashboard-nvim")
    use("ahmedkhalf/project.nvim")
    use({
      "lewis6991/gitsigns.nvim",
      requires = {
        "nvim-lua/plenary.nvim"
      },
      tag = "release"
    })
    -- lspconfig
    use({ "neovim/nvim-lspconfig" })
    use({ "williamboman/nvim-lsp-installer" })
    -- 补全引擎
    use("hrsh7th/nvim-cmp")
    -- snippet 引擎
    use("hrsh7th/vim-vsnip")
    -- 补全源
    use("hrsh7th/cmp-vsnip")
    use("hrsh7th/cmp-nvim-lsp") -- { name = nvim_lsp }
    use("hrsh7th/cmp-buffer") -- { name = 'buffer' },
    use("hrsh7th/cmp-path") -- { name = 'path' }
    use("hrsh7th/cmp-cmdline") -- { name = 'cmdline' }

    -- 常见编程语言代码段
    use("rafamadriz/friendly-snippets")

    use("onsails/lspkind-nvim")

    -- indent-blankline
    use("lukas-reineke/indent-blankline.nvim")

    -- 代码格式化
    -- use({ "jose-elias-alvarez/null-ls.nvim", requires = "nvim-lua/plenary.nvim" })
    use("numToStr/Comment.nvim")
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
  }
})
