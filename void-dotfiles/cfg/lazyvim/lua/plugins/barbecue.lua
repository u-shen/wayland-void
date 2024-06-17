-----------------------------------------------------------
-- Barbecue
-----------------------------------------------------------
return {
  "utilyre/barbecue.nvim",
  name = "barbecue",
  ft = { "html", "css", "lua", "yaml", "yml", "markdown" },
  version = "*",
  dependencies = {
    "SmiteshP/nvim-navic",
    "nvim-tree/nvim-web-devicons", -- optional dependency
  },
  opts = {},
}
