local colorscheme = "gruvbox-baby"
-- local colorscheme = "tokyonight"
-- local colorscheme = "tokyonight-night"
-- local colorscheme = "tokyonight-storm"
-- local colorscheme = "tokyonight-day"
-- local colorscheme = "tokyonight-moon"

-- vim.o.background = "light" -- or dark or light
vim.o.background = "dark" -- or dark or light
vim.o.termguicolors = true
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found！")
  return
end

vim.cmd([[highlight ColorColumn guibg=grey]])
-- vim.g.virtcolumn_char = '▕' -- char to display the line
vim.g.virtcolumn_char = "'" -- char to display the line
vim.g.virtcolumn_priority = 10 -- priority of extmark
