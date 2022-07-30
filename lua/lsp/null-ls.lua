local status, null_ls = pcall(require, "null-ls")

if not status then
  vim.notify("null-ls not found")
  return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

-- https://github.com/jose-elias-alvarez/null-ls.nvim
null_ls.setup({
  debug = true,
  sources = {
    -- Formatting ---------------------
    --  brew install shfmt
    formatting.shfmt,
    -- StyLua
    formatting.stylua,
    -- frontend
    formatting.prettier.with({
      filetypes = {
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
        "vue",
        "css",
        "scss",
        "less",
        "html",
        "json",
        "yaml",
        "graphql",
      },
      prefer_local = "node_modules/.bin",
    }),
    -- Diagnostics  ---------------------
    diagnostics.eslint.with({
      prefer_local = "node_modules/.bin",
    }),
    -- code actions ---------------------
    code_actions.gitsigns,
    code_actions.eslint.with({
      prefer_local = "node_modules/.bin",
    }),
    -- formatting.fixjson,
    -- formatting.black.with({ extra_args = { "--fast" } }),
  },
  -- #{m}: message
  -- #{s}: source name (defaults to null-ls if not specified)
  -- #{c}: code (if available)
  -- 提示格式： [eslint] xxx
  diagnostics_format = "[#{s}] #{m}",
  -- auto formatting on save
  on_attach = function(client)
    if client.server_capabilities.document_formatting then
      vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.format()")
    end
  end,
})
