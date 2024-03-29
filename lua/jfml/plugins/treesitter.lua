return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPost", "BufNewFile" },
	build = ":TSUpdate",
	enabled = true,
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"go",
				"c",
				"cpp",
				"vimdoc",
				"javascript",
				"typescript",
				"ruby",
				"html",
				"tsx",
				"bash",
				"markdown",
				"markdown_inline",
			},
			-- Autoinstall languages that are not installed
			auto_install = true,
			indent = { enable = true },
			highlight = {
				enable = true,
				use_languagetree = true,
				-- disable = { "markdown" },
			},
		})
	end,
	-- enable nvim-ts-context-commentstring plugin for commenting tsx and jsx
	require("ts_context_commentstring").setup({}),
}
