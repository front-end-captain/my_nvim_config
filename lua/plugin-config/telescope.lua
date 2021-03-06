local status, telescope = pcall(require, "telescope")

if not status then
  vim.notify("telescope not found")
  return
end

-- https://github.com/nvim-telescope/telescope.nvim
telescope.setup({
  defaults = {
    initial_mode = "insert",
    mappings = require("keybindings").telescopeList,
  },
  pickers = {
    find_files = {
      -- theme = "dropdown",
    }
  },
  -- extensions = {},
})

pcall(telescope.load_extension, "env")
