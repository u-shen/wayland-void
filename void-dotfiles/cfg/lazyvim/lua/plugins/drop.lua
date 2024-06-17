-----------------------------------------------------------
-- Fun Effect
-----------------------------------------------------------
return {
  ---- > 🍁 Fun little plugin that can be used as a screensaver and on your dashboard
  "folke/drop.nvim",
  event = "VimEnter",
  ft = { "dashboard" },
  config = function()
    if not vim.g.neovide then
      require("drop").setup({
        theme = "leaves", -- can be one of the default themes, or a custom theme
        max = 80, -- maximum number of drops on the screen
        interval = 100, -- every 150ms we update the drops
        screensaver = 1000 * 60 * 15, -- show after 15 minutes. Set to false, to disable
        filetypes = { "dashboard", "alpha", "starter" }, -- will enable/disable automatically for the following filetypes
      })
    end
  end,
}
