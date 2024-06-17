-----------------------------------------------------------
-- Maximize Window
-----------------------------------------------------------
return {
  "szw/vim-maximizer",
  event = "VeryLazy",
  keys = {
    { "<leader>m", "<cmd>MaximizerToggle<CR>", { desc = "Maximize current window" } },
  },
}
