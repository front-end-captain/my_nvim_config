local status, wilder = pcall(require, "wilder")

if not status then
  vim.notify("wilder not found")
  return
end

wilder.setup({
  modes = { ":", "/", "?" },
  next_key = "<C-j>",
  previous_key = "<C-k>",
})

wilder.set_option(
  "renderer",
  wilder.renderer_mux({
    [":"] = wilder.popupmenu_renderer({
      highlighter = wilder.basic_highlighter(),
    }),
    ["/"] = wilder.wildmenu_renderer({
      highlighter = wilder.basic_highlighter(),
    }),
  })
)

wilder.set_option('renderer', wilder.popupmenu_renderer(
  wilder.popupmenu_border_theme({
    highlights = {
      border = 'Normal', -- highlight to use for the border
    },
    -- 'single', 'double', 'rounded' or 'solid'
    -- can also be a list of 8 characters, see :h wilder#popupmenu_border_theme() for more details
    border = 'rounded',
  })
))
