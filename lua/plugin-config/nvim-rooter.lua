local status, rooter = pcall(require, "nvim-rooter")

if not status then
	vim.notify("nvim-rooter not found")
	return
end

rooter.setup({
	rooter_patterns = { ".git" },
	-- trigger_patterns = { "*" },
	manual = false,
})
