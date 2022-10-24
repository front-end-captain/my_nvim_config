local status, aerial = pcall(require, "aerial")

if not status then
	vim.notify("aerial not found")
	return
end

aerial.setup({
	layout = {
		-- These control the width of the aerial window.
		-- They can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
		-- min_width and max_width can be a list of mixed types.
		-- max_width = {40, 0.2} means "the lesser of 40 columns or 20% of total"
		max_width = { 40, 0.2 },
		-- width = nil,
		min_width = { 40, 0.2 },

		-- Determines the default direction to open the aerial window. The 'prefer'
		-- options will open the window in the other direction *if* there is a
		-- different buffer in the way of the preferred direction
		-- Enum: prefer_right, prefer_left, right, left, float
		default_direction = "prefer_right",

		-- Determines where the aerial window will be opened
		--   edge   - open aerial at the far right/left of the editor
		--   window - open aerial to the right/left of the current window
		placement = "window",
	},

	on_attach = function(bufnr)
		-- Toggle the aerial window with <leader>a
		vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>o", "<cmd>AerialToggle!<CR>", {})
		-- Jump forwards/backwards with '{' and '}'
		vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-k>", "<cmd>AerialPrev<CR>", {})
		vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-j>", "<cmd>AerialNext<CR>", {})
		-- Jump up the tree with '[[' or ']]'
		vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-u>", "<cmd>AerialPrevUp<CR>", {})
		vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-d>", "<cmd>AerialNextUp<CR>", {})
	end,
})
