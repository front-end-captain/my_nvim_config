local status, bufferline = pcall(require, "bufferline")

if not status then
  vim.notify("bufferline not found")
  return
end

-- https://github.com/akinsho/bufferline.nvim#configuration
bufferline.setup({
  options = {
    close_command = "Bdelete! %d",
    right_mouse_command = "Bdelete! %d",
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        highlight = "Directory",
        text_align = "left",
      },
    },
    diagnostics = "nvim_lsp",
    -- -@diagnostic disable-next-line: unused-local
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      local s = " "
      for e, n in pairs(diagnostics_dict) do
        local sym = e == "error" and " " or (e == "warning" and " " or "")
        s = s .. n .. sym
      end
      return s
    end,
    -- 'slant' | 'padded_slant' | 'thick' | 'thin'
    separator_style = "thick",
    always_show_bufferline = true,
    show_buffer_close_icons = false,
    show_close_icon = false,
    color_icons = true,
    indicator = {
      -- icon = "▎", -- this should be omitted if indicator style is not 'icon'
      style = "underline",
    },
  },
  highlights = {
    buffer_selected = {
      bold = true,
    },
  },
})
