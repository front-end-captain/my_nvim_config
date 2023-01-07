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
    file_ignore_patterns = { "node_modules", "*.png", "*.jpeg", "*.jpg", "common/temp", "dist" },
  },
  pickers = {
    live_grep = {
      theme = "dropdown",
      -- "horizontal" | "center" | "cursor" | "vertical" | "flex" | "bottom_pane"
      layout_strategy = "vertical",
      layout_config = {
        prompt_position = "top",
        width = function(_, max_columns, _)
          return math.max(max_columns - 80, 80)
        end,
        height = function(_, _, max_lines)
          return max_lines - 2;
        end,
      },
    },
  },
  -- extensions = {},
})

pcall(telescope.load_extension, "env")
pcall(telescope.load_extension, "notify")
