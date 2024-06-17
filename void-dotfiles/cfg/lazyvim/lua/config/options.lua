-------------------------------------------------------------
-- General Neovim settings and configuration:
-----------------------------------------------------------
-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
-----------------------------------------------------------
-- Set leader key:
-----------------------------------------------------------
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
-----------------------------------------------------------
-- Code folding options:
-----------------------------------------------------------
vim.opt.foldcolumn = "1"
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true
vim.opt.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
-----------------------------------------------------------
-- Tabs, indent:
-----------------------------------------------------------
vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.shiftwidth = 4 -- Shift 4 spaces when tab
vim.opt.tabstop = 4 -- 1 tab == 4 spaces
vim.opt.smartindent = true -- Autoindent new lines
-----------------------------------------------------------
-- set symbols for space and newline:
-------------------------------------------------------------
-- vim.opt.list = true
-- vim.opt.listchars:append("eol:⤸")
-- vim.opt.listchars:append("tab:│ ")
-- vim.opt.listchars:append("space:⋅")
-------------------------------------------------------------
-- Use ripgrep as grep tool:
-------------------------------------------------------------
vim.opt.grepprg = "rg --vimgrep --no-heading"
vim.opt.grepformat = "%f:%l:%c:%m,%f:%l:%m"
-----------------------------------------------------------
-- Disable some builtin providers:
-------------------------------------------------------------
vim.g.loaded_python_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrw = 1
