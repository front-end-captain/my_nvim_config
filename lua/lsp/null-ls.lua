local status, null_ls = pcall(require, "null-ls")

if not status then
	vim.notify("null-ls not found")
	return
end

local formatting = null_ls.builtins.formatting
-- local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

local lsp_formatting = function(bufnr)
	vim.lsp.buf.format({
		filter = function(client)
			-- apply whatever logic you want (in this example, we'll only use null-ls)
			return client.name == "null-ls"
		end,
		bufnr = bufnr,
	})
end

-- if you want to set up formatting on save, you can use this as a callback
-- local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

-- https://github.com/jose-elias-alvarez/null-ls.nvim
null_ls.setup({
	debug = true,
	sources = {
		-- Formatting ---------------------
		-- brew install shfmt
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
		-- diagnostics.eslint.with({
		-- prefer_local = "node_modules/.bin",
		-- }),
		-- code actions ---------------------
		code_actions.gitsigns,
		-- code_actions.eslint.with({
		-- prefer_local = "node_modules/.bin",
		-- }),
		-- formatting.fixjson,
		-- formatting.black.with({ extra_args = { "--fast" } }),
	},
	-- #{m}: message
	-- #{s}: source name (defaults to null-ls if not specified)
	-- #{c}: code (if available)
	-- 提示格式： [eslint] xxx
	diagnostics_format = "[#{s}] #{m}",
	-- auto formatting on save
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			-- vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_clear_autocmds({ buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				-- group = augroup,
				buffer = bufnr,
				callback = function()
					lsp_formatting(bufnr)
				end,
			})
		end
	end,
})
