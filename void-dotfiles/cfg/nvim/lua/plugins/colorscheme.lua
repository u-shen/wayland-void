-----------------------------------------------------------
-- Colorscheme
-----------------------------------------------------------
return {
  {
    "sainnhe/gruvbox-material",
    lazy = false,
    enabled = true,
    priority = 1000,
    config = function()
      vim.g.gruvbox_material_background = "hard"
      vim.g.gruvbox_material_inlay_hints_background = "dimmed"
      vim.g.gruvbox_material_float_style = "dim"
      vim.g.gruvbox_material_current_word = "grey background"
      vim.g.gruvbox_material_transparent_background = 0
      vim.g.gruvbox_material_disable_italic_comment = 0
      vim.g.gruvbox_material_enable_italic = 1
      vim.g.gruvbox_material_enable_bold = 1
      vim.g.gruvbox_material_better_performance = 1
      vim.g.gruvbox_material_diagnostic_line_highlight = 1
      vim.g.gruvbox_material_diagnostic_virtual_text = "colored"
      vim.cmd([[
			let g:gruvbox_material_colors_override = {'bg0': ['#141617', '234'], 'bg2': ['#282828', '235'], 'bg_dim': ['#0d0e0f', '234']}
			colorscheme gruvbox-material
			]])
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox-material",
    },
  },
}
