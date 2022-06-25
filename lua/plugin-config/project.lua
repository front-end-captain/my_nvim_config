local status, project = pcall(require, "project_nvim")

if not status then
  vim.notify("project_nvim not found")
  return
end

-- nvim-tree support
vim.g.nvim_tree_respect_buf_cwd = 1

project.setup({
  detection_methods = { "pattern" },
  patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json", ".sln" },
})

local callTelescopeStatus, telescope = pcall(require, "telescope")

if not callTelescopeStatus then
  vim.notify("Not found telescope in project.lua")
  return
end

pcall(telescope.load_extension, "projects")
