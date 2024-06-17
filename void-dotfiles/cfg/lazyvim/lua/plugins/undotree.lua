-----------------------------------------------------------
-- Undo-Tree
-----------------------------------------------------------
return {
  "mbbill/undotree",
  lazy = false,
  cmd = "UndotreeToggle",
  keys = {
    { "<leader>uu", "<cmd>UndotreeToggle<cr>", desc = "Undotree Toggle" },
  },
}
