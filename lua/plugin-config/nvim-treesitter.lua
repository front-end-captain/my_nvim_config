local status, nvim_treesitter = pcall(require, "nvim-treesitter.configs")

if not status then
	vim.notify("nvim-treesitter.configs not found")
	return
end

-- https://github.com/nvim-treesitter/nvim-treesitter
nvim_treesitter.setup({
	ensure_installed = { "html", "css", "vim", "lua", "javascript", "typescript", "tsx", "astro" },
	highlight = {
		enable = true,
		-- additional_vim_regex_highlighting = false
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "<CR>",
			node_incremental = "<CR>",
			node_decremental = "<BS>",
			scope_incremental = "<TAB>",
		},
	},
	-- enable Treesitter code format(=)
	-- NOTE: This is an experimental feature.
	indent = {
		enable = true,
	},
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
		config = {
			css = "// %s",
			javascript = {
				__default = "// %s",
				jsx_element = "{/* %s */}",
				jsx_fragment = "{/* %s */}",
				jsx_attribute = "// %s",
				comment = "// %s",
			},
			typescript = {
				__default = "// %s",
				jsx_element = "{/* %s */}",
				jsx_fragment = "{/* %s */}",
				jsx_attribute = "// %s",
				comment = "// %s",
				__multiline = "/* %s */",
			},
		},
	},
})

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldlevel = 99
