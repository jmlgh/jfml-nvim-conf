return {
	"nvimtools/none-ls.nvim",
	lazy = true,
	event = { "BufReadPre", "BufNewFile" },
	-- dependencies = { 'nvim-lua/plenary.nvim' },
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvimtools/none-ls-extras.nvim",
		"gbprod/none-ls-shellcheck.nvim",
	},
	config = function()
		local null_ls = require("null-ls")
		local null_ls_utils = require("null-ls.utils")
		local formatting = null_ls.builtins.formatting
		local diagnostics = null_ls.builtins.diagnostics
		-- to setup format on save
		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

		-- https://github.com/johnnyBira/neovim-config/commit/84bb2a40675ff5e64cbd69e5f410dfae653a89c5
		null_ls.setup({
			root_dir = null_ls_utils.root_pattern(".null-ls-root", "Makefile", ".git", "package.json"),
			sources = {
				null_ls.builtins.completion.spell,
				null_ls.builtins.formatting.shfmt,
				require("none-ls.diagnostics.eslint_d"),
				require("none-ls.formatting.eslint_d"),
				require("none-ls.code_actions.eslint_d"),
				require("none-ls-shellcheck.diagnostics"),
				require("none-ls-shellcheck.code_actions"),
				formatting.prettierd.with({
					disabled_filetypes = {
						"markdown",
						"md",
					},
				}),
				formatting.stylua,
				-- THIS BREAKS FOR SOME REASON: eslint_d seems to be nil
				-- diagnostics.eslint_d.with({
				--   condition = function(utils)
				--     return utils.root_has_file({ ".eslintrc.js", ".eslintrc.cjs" })
				--   end,
				-- }),
			},
			-- configure format on save
			on_attach = function(current_client, bufnr)
				if current_client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({
								filter = function(client)
									--  only use null-ls for formatting instead of lsp server
									return client.name == "null-ls"
								end,
								bufnr = bufnr,
							})
						end,
					})
				end
			end,
		})
	end,
}
