local status, navic = pcall(require, "nvim-navic")

if not status then
  vim.notify("nvim-navic not found")
  return
end

navic.setup({
  highlight = true,
})
