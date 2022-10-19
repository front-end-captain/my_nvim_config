local status, nvim_tree = pcall(require, "nvim-tree")

if not status then
	vim.notify("nvim-tree not found")
	return
end

-- kep map for nvim-tree
local list_keys = require("keybindings").nvimTreeList

-- https://github.com/kyazdani42/nvim-tree.lua
nvim_tree.setup({
	git = {
		enable = true,
		ignore = false,
	},
	update_cwd = true,
	update_focused_file = {
		enable = true,
		update_cwd = true,
	},
	-- which dir will hide
	filters = {
		dotfiles = false,
		custom = { ".idea" },
	},
	view = {
		width = 50,
		side = "right",
		hide_root_folder = false,
		mappings = {
			custom_only = false,
			list = list_keys,
		},
		number = true,
		relativenumber = true,
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
					filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
					buftype = { "nofile", "terminal", "help" },
				},
			},
		},
	},
	-- npm install -g wsl-open
	-- https://github.com/4U6U57/wsl-open/
	system_open = {
		cmd = "wsl-open",
	},
})
