local status, dressing = pcall(require, "dressing")

if not status then
	vim.notify("dressing not found")
	return
end

dressing.setup({
	input = {
		enabled = true,
		default_prompt = "➤ ",
		prompt_align = "left",
		insert_only = true,
		anchor = "SW",
		border = "rounded",
		relative = "cursor",
		prefer_width = 40,
		width = nil,
		max_width = { 140, 0.9 },
		min_width = { 20, 0.2 },
    win_options = {
		  winblend = 10,
		  winhighlight = "",
    },
		override = function(conf)
			return conf
		end,
		get_config = nil,
	},
	select = {
		enabled = true,
		backend = { "telescope", "builtin" },

		builtin = {
			anchor = "NW",
			border = "rounded",
			relative = "editor",
    win_options = {
		  winblend = 10,
		  winhighlight = "",
    },
			width = nil,
			max_width = { 140, 0.8 },
			min_width = { 40, 0.2 },
			height = nil,
			max_height = 0.9,
			min_height = { 10, 0.2 },
			override = function(conf)
				return conf
			end,
		},
		format_item_override = {},
		get_config = nil,
	},
})
