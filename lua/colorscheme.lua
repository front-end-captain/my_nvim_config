-- local colorscheme = "nord"
-- local colorscheme = "oceanic"
local colorscheme = "gruvbox"
-- local colorscheme = "onedark"
-- local colorscheme = "nightfox"

vim.o.background = "dark" -- or dark or light

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

if not status_ok then
	vim.notify("colorscheme " .. colorscheme .. " not found！")
	return
end
