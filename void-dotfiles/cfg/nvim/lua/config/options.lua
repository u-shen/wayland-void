-----------------------------------------------------------
-- Diagnostic
-----------------------------------------------------------
vim.diagnostic.config({ signs = false, virtual_text = false })
-----------------------------------------------------------
-- Set leader key:
-----------------------------------------------------------
vim.g.mapleader = " "
-----------------------------------------------------------
-- General
-----------------------------------------------------------
vim.schedule(function()
  vim.opt.clipboard = "unnamed,unnamedplus"
end)

vim.opt.compatible    = false
vim.opt.swapfile      = false
vim.opt.writebackup   = false
vim.opt.backup        = false
vim.opt.completeopt   = { "menu", "menuone", "preview" }
vim.o.shada           = "'100,<50,s10,:1000,/100,@100,h"
vim.opt.undofile      = true
vim.opt.undolevels    = 100
vim.opt.timeoutlen    = 300
-----------------------------------------------------------
-- Shell
-----------------------------------------------------------
vim.opt.sh            = "nu"
vim.opt.shelltemp     = false
vim.opt.shellcmdflag  = "--stdin --no-newline -c"
vim.opt.shellredir    = "out+err> %s"
vim.opt.shellxescape  = ""
vim.opt.shellxquote   = ""
vim.opt.shellquote    = ""
vim.o.fillchars       = 'eob: '
-----------------------------------------------------------
-- Neovim UI
-----------------------------------------------------------
vim.opt.number        = true
vim.opt.numberwidth   = 5
vim.opt.splitright    = true
vim.opt.splitbelow    = true
vim.opt.termguicolors = true
vim.opt.ignorecase    = true
vim.opt.smartcase     = true
vim.opt.hlsearch      = true
vim.opt.confirm       = true
vim.opt.laststatus    = 0
vim.opt.cmdheight     = 0
vim.opt.wrap          = false
vim.opt.showmode      = false
vim.opt.ruler         = false
vim.wo.signcolumn     = "no"
--------------------------------------------------------
-- Tabs, indent:
-----------------------------------------------------------
vim.opt.tabstop       = 2
vim.opt.softtabstop   = 2
vim.opt.shiftwidth    = 2
vim.opt.expandtab     = true
vim.opt.smartindent   = true
vim.opt.shiftround    = true
-----------------------------------------------------------
-- Memory, CPU
-----------------------------------------------------------
vim.opt.hidden        = true
vim.opt.history       = 100
vim.opt.lazyredraw    = true
vim.opt.synmaxcol     = 240
vim.opt.updatetime    = 250
-----------------------------------------------------------
-- Startup
-----------------------------------------------------------
vim.opt.shortmess:append("sI")
-- Disable builtin plugins
local disabled_built_ins = {
  "osc52",
  "parser",
  "health",
  "man",
  "tohtml",
  "shadafile",
  "spellfile",
  "editorconfig",
  "2html_plugin",
  "getscript",
  "getscriptPlugin",
  "gzip",
  "logipat",
  "netrw",
  "netrwPlugin",
  "netrwSettings",
  "netrwFileHandlers",
  "matchit",
  "tar",
  "tarPlugin",
  "rrhelper",
  "spellfile_plugin",
  "vimball",
  "vimballPlugin",
  "zip",
  "zipPlugin",
  "tutor",
  "rplugin",
  "synmenu",
  "optwin",
  "compiler",
  "bugreport",
  "ftplugin",
}
for _, plugin in pairs(disabled_built_ins) do
  vim.g["loaded_" .. plugin] = 1
end
