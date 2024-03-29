local lsp_installer = require("nvim-lsp-installer")

-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md

-- installed language server table
-- { key: <language>, value: <config file name> }
-- key must be follow website listed name
-- https://github.com/williamboman/nvim-lsp-installer#available-lsps
local servers = {
  sumneko_lua = require("lsp.config.lua"), -- lua/lsp/config/lua.lua
  html = require("lsp.config.html"),
  cssls = require("lsp.config.css"),
  emmet_ls = require("lsp.config.emmet"),
  jsonls = require("lsp.config.json"),
  tsserver = require("lsp.config.ts"),
  clangd = require("lsp.config.clang"),
  eslint = require("lsp.config.eslint"),
  gopls = require("lsp.config.golang"),
  pyright = require("lsp.config.python"),
  stylelint_lsp = require("lsp.config.stylelint"),
  jdtls = require("lsp.config.java"),
  astro = require("lsp.config.astro"),
  rust_analyzer = require("lsp.config.rust")
}
-- auto install Language Servers
for name, _ in pairs(servers) do
  local server_is_found, server = lsp_installer.get_server(name)
  if server_is_found then
    if not server:is_installed() then
      print("Installing language server:" .. name)
      server:install()
    end
  end
end

lsp_installer.on_server_ready(function(server)
  local config = servers[server.name]
  if config == nil then
    return
  end
  if config.on_setup then
    config.on_setup(server)
  else
    server:setup({})
  end
end)
