-- local colorscheme = "tokyonight"
-- local colorscheme = "nord"
-- local colorscheme = "tokyonight"
-- local colorscheme = "oceanic"
local colorscheme = "gruvbox"
-- local colorscheme = "onedark"
-- local colorscheme = "nightfox"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found！")
  return
end
