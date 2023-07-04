local status, transparent = pcall(require, "transparent")

if not status then
  vim.notify("transparent not found")
  return
end

vim.g.transparent_enabled = true

transparent.setup({
  extra_groups = {
    "BufferLineTabClose",
    "BufferlineBufferSelected",
    "BufferLineFill",
    "BufferLineBackground",
    "BufferLineSeparator",
    "BufferLineIndicatorSelected",
    "NvimTreeNormal",
    "NvimTreeStatuslineNc",
  },
  -- include_groups = {},
})
