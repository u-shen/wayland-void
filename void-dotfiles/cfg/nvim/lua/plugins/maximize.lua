-----------------------------------------------------------
-- Maximize Window
-----------------------------------------------------------
return {
	"szw/vim-maximizer",
	event = "VeryLazy",
	keys = {
		{ "<leader>z", "<cmd>MaximizerToggle<CR>", { desc = "Maximize current window" } },
	},
}
