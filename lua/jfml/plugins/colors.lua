-- gruvbox theme lazy plugin
-- return {
-- 	"ellisonleao/gruvbox.nvim",
-- 	priority = 1000,
-- 	config = function()
-- 		require("gruvbox").setup({})
-- 		vim.cmd([[
-- 			colorscheme gruvbox
-- 			hi CocUnusedHighlight cterm=underline gui=underline guifg=#6B6860
-- 		]])
-- 	end,
-- }

-- tokyonight theme lazy plugin
return {
	"folke/tokyonight.nvim",
	priority = 1000,
	config = function()
		vim.cmd([[
			colorscheme tokyonight-night  
			hi CocUnusedHighlight cterm=underline gui=underline guifg=#6B6860
		]])
	end,
}
