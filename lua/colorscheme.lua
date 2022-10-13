-- local colorscheme = "tokyonight"
-- local colorscheme = "nord"
-- local colorscheme = "vscode"
-- local colorscheme = "oceanic"
local colorscheme = "gruvbox"
-- local colorscheme = "onedark"
-- local colorscheme = "nightfox"
-- local colorscheme = "neon"
-- local colorscheme = "dawnfox"
-- local colorscheme = "adwaita"
-- local colorscheme = "edge"

-- vim.g.neon_style = "default"
-- vim.g.neon_style = "doom"
-- vim.g.neon_italic_keyword = true
-- vim.g.neon_italic_function = true
-- vim.g.neon_transparent = true

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

if not status_ok then
	vim.notify("colorscheme " .. colorscheme .. " not found！")
	return
end
