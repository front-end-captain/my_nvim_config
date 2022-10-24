local status, glow = pcall(require, "glow")

if not status then
	vim.notify("glow not found")
	return
end

glow.setup({
	-- glow_path = "", -- will be filled automatically with your glow bin in $PATH, if any
	-- install_path = "~/.local/bin", -- default path for installing glow binary
	-- border = "shadow", -- floating window border config
	style = "dark", -- filled automatically with your current editor background, you can override using glow json style
	pager = false,
	width = 120,
})
