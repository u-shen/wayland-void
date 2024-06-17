-----------------------------------------------------------
-- Undo-Tree
-----------------------------------------------------------
return {
	{
		"mbbill/undotree",
		lazy = false,
		cmd = "UndotreeToggle",
		keys = {
			{ "<leader>uu", "<cmd>UndotreeToggle<cr>", desc = "Undotree Toggle" },
		},
	},
	-----------------------------------------------------------
	-- Uhighlight-Undo.nvim
	-----------------------------------------------------------
	{
		"tzachar/highlight-undo.nvim",
		event = "VeryLazy",
		config = function()
			require("highlight-undo").setup({})
		end,
	},
}
