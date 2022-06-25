local status, nvim_tree = pcall(require, "nvim-tree")

if not status then
  vim.notify("nvim-tree not found")
  return
end

-- 列表操作快捷键
local list_keys = require('keybindings').nvimTreeList

nvim_tree.setup({
  -- 不显示 git 状态图标
  git = {
    enable = false,
  },
  -- project plugin 需要这样设置
  update_cwd = true,
  update_focused_file = {
    enable = true,
    update_cwd = true,
  },
  -- 隐藏 .文件 和 node_modules 文件夹
  filters = {
    dotfiles = false,
    custom = { ".idea" },
  },
  view = {
    -- 宽度
    width = 50,
    -- 也可以 'right'
    side = "right",
    -- 隐藏根目录
    hide_root_folder = false,
    -- 自定义列表中快捷键
    mappings = {
      custom_only = false,
      list = list_keys,
    },
    -- 不显示行数
    number = false,
    relativenumber = false,
    -- 显示图标
    signcolumn = "yes",
  },
  actions = {
    change_dir = {
      enable = true,
      global = false,
    },
    open_file = {
      quit_on_open = false,
      resize_window = false,
      window_picker = {
        enable = true,
        chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
        exclude = {
          filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame", },
          buftype  = { "nofile", "terminal", "help", },
        }
      }
    }
  },
  -- npm install -g wsl-open
  -- https://github.com/4U6U57/wsl-open/
  system_open = {
    cmd = "wsl-open",
  },
})
