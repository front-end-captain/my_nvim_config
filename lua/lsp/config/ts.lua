local keybindings = require("keybindings")
local navic = require("nvim-navic")
local lsp_signature = require("lsp_signature")

local opts = {
  settings = {
    maxTsServerMemory = 10240,
  },
  flags = {
    debounce_text_changes = 150,
  },
  -- https://github.com/jose-elias-alvarez/nvim-lsp-ts-utils/blob/main/lua/nvim-lsp-ts-utils/utils.lua
  -- tsserver init opts
  init_options = {
    hostInfo = "neovim",
    preferences = {
      includeInlayParameterNameHints = "all",
      includeInlayParameterNameHintsWhenArgumentMatchesName = true,
      includeInlayFunctionParameterTypeHints = true,
      includeInlayVariableTypeHints = true,
      includeInlayPropertyDeclarationTypeHints = true,
      includeInlayFunctionLikeReturnTypeHints = true,
      includeInlayEnumMemberValueHints = true,
    },
  },
  capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
  on_attach = function(client, bufnr)
    client.server_capabilities.document_formatting = false
    client.server_capabilities.document_range_formatting = false

    if client.server_capabilities.documentSymbolProvider then
      navic.attach(client, bufnr)
    end

    local function buf_set_keymap(...)
      vim.api.nvim_buf_set_keymap(bufnr, ...)
    end

    keybindings.mapLSP(buf_set_keymap)

    lsp_signature.on_attach({
      bind = true,
      handler_opts = {
        border = "rounded",
      },
    }, bufnr)
  end,
}

return {
  on_setup = function(server)
    server:setup(opts)
  end,
}
