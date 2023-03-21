local status, transparent = pcall(require, "transparent")

if not status then
	vim.notify("transparent not found")
	return
end

vim.g.transparent_enabled = true

transparent.setup({
	-- enable = true, -- boolean: enable transparent
	extra_groups = { -- table/string: additional groups that should be cleared
		-- In particular, when you set it to 'all', that means all available groups

		-- example of akinsho/nvim-bufferline.lua
		"BufferLineTabClose",
		"BufferlineBufferSelected",
		"BufferLineFill",
		"BufferLineBackground",
		"BufferLineSeparator",
		"BufferLineIndicatorSelected",
	},
	-- exclude = {}, -- table: groups you don't want to clear
})
