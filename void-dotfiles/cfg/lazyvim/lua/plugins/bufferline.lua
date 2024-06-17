-----------------------------------------------------------
--  bufferline
-----------------------------------------------------------
return {
  "akinsho/bufferline.nvim",
  keys = {
    { "<TAB>", "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer" },
    { "<S-Tab>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev buffer" },
    { "<leader>bc", "<Cmd>BufferLinePick<CR>", desc = "Choose Buffer" },
    { "<leader>bC", "<Cmd>BufferLinePickClose<CR>", desc = "Choose Buffer to Close" },
    { "<leader>b.", "<Cmd>BufferLineMoveNext<CR>", desc = "Move Buffer Right" },
    { "<leader>b,", "<Cmd>BufferLineMovePrev<CR>", desc = "Move Buffer Left" },
  },
  opts = {
    options = {
      separator_style = "slant", -- | "thick" | "thin" | { 'any', 'any' },
    },
  },
}
