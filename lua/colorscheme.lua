local colorscheme = "gruvbox"

-- vim.o.background = "light" -- or dark or light
vim.o.background = "dark" -- or dark or light
vim.o.termguicolors = true

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

if not status_ok then
	vim.notify("colorscheme " .. colorscheme .. " not found！")
	return
end

