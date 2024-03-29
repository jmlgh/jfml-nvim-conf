return {
	"leoluz/nvim-dap-go",
	config = function()
		require("dap-go").setup()

		vim.keymap.set("n", "<leader>dt", ":lua require'dap-go'.debug_test()<CR>")
	end,
}
