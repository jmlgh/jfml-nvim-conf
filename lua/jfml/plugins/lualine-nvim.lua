return {
	"nvim-lualine/lualine.nvim",
	config = function()
		local colors = {
			default_background = "#504945",
			default_text = "#EBDBB2",
			modified_background = "#AA4542",
			saved_background = "#84A598",
		}
		-- local theme = {
		-- 	normal = {
		-- 		a = { bg = colors.saved_background, fg = colors.default_text },
		-- 		b = { bg = colors.default_background, fg = colors.default_text },
		-- 		c = { fg = colors.default_text, bg = colors.default_background },
		-- 		z = { fg = colors.default_text, bg = colors.default_background },
		-- 	},
		-- }

		local function modified_text()
			if vim.bo.modified then
				-- return "💾"
				-- return "◌"
				-- return "✘"
				-- return "•"
				return "⊙"
			end
			return " "
		end

		require("lualine").setup({
			options = {
				-- theme = theme,
				-- theme = "gruvbox",
				theme = "tokyonight",
			},
			sections = {
				-- lualine_a = {
				-- 	{
				-- 		modified_text,
				-- 		separator = { right = "" },
				-- 		padding = {
				-- 			left = 3,
				-- 			right = 3,
				-- 		},
				-- 		color = function()
				-- 			if vim.bo.modified then
				-- 				return { bg = colors.modified_background, fg = colors.default_text }
				-- 			end
				-- 		end,
				-- 	},
				-- },
				lualine_a = { "mode" },
				lualine_b = {
					{ "filename", file_status = false, path = 4 },
					modified_text,
				},
				lualine_c = { "branch", "diff", "diagnostics" },
				lualine_x = { "encoding", "fileformat", "filetype" },
				lualine_y = { "progress" },
				lualine_z = {},
			},
		})
	end,
}
