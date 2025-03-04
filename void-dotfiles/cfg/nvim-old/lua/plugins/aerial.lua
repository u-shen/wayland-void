-----------------------------------------------------------
-- Aerial:
-----------------------------------------------------------
return {
	"stevearc/aerial.nvim",
	enabled = false,
	event = "LspAttach",
	init = function()
		vim.keymap.set("n", "<leader>fa", "<cmd>AerialToggle<CR>")
	end,
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("aerial").setup({
			layout = {
				width = 30,
				win_opts = {
					statuscolumn = " ",
					winhl = "Normal:NeoTreeNormal,WinBar:NeoTreeNormal",
				},
			},
			autojump = true,
			post_jump_cmd = "normal! zt",
			show_guides = true,
		})
	end,
}
