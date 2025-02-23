-----------------------------------------------------------
-- Define keymaps of Neovim and installed plugins.
-----------------------------------------------------------
local bind = vim.keymap.set
local opts = { noremap = true, silent = true }
-----------------------------------------------------------
-- Basic Keymaps:
-----------------------------------------------------------
bind("n", "<Leader>w", ":write<CR>", opts)
bind("n", "<C-s>", ":up<CR>", opts)
bind("i", "<C-s>", "<ESC> :up<CR>", opts)
bind("n", "<C-c>", "ciw", opts)
bind("n", "U", "<C-r>", opts)
bind("n", "<leader>qq", ":qa<CR>", opts)
bind("n", "<ESC>", ":nohl<CR>", opts)
bind("n", ";", ":")
-----------------------------------------------------------
-- Always In Middle When Scrooling By Page
-----------------------------------------------------------
bind("n", "<C-u>", "<C-u>zz", opts)
bind("n", "<C-d>", "<C-d>zz", opts)
bind("n", "<C-b>", "<C-b>zz", opts)
bind("n", "<C-f>", "<C-f>zz", opts)
-----------------------------------------------------------
-- Bufferline Keys
-----------------------------------------------------------
bind("n", "<Tab>", ":bnext<CR>", opts)
bind("n", "<S-Tab>", ":bprev<CR>", opts)
bind("n", "<leader>bd", ":bd<CR>", opts)
bind("n", "<leader>bb", ":silent up|%bd!<CR><C-O>:bd#<CR>", opts)
-----------------------------------------------------------
-- turn off direction keyboard, force using `hjkl` !!!
-----------------------------------------------------------
bind("n", "<Left>", "<Nop>", opts)
bind("n", "<Right>", "<Nop>", opts)
bind("n", "<Up>", "<Nop>", opts)
bind("n", "<Down>", "<Nop>", opts)
bind({ "n", "v" }, "<Space>", "<Nop>", opts)
-----------------------------------------------------------
-- Move around splits using Ctrl + {h,j,k,l}
-----------------------------------------------------------
bind("n", "<C-h>", "<C-w>h", opts)
bind("n", "<C-j>", "<C-w>j", opts)
bind("n", "<C-k>", "<C-w>k", opts)
bind("n", "<C-l>", "<C-w>l", opts)
-----------------------------------------------------------
-- Split KeyBidings
-----------------------------------------------------------
bind("n", "<leader>w|", ":vsplit<CR>", opts)
bind("n", "<leader>w-", ":split<CR>", opts)
bind("n", "<leader>wq", ":close<CR>", opts)
-----------------------------------------------------------
--  Don't yank on delete char
-----------------------------------------------------------
bind("n", "x", '"_x', opts)
bind("n", "X", '"_X', opts)
bind("v", "x", '"_x', opts)
bind("v", "X", '"_X', opts)
-----------------------------------------------------------
-- use gl,gh to move:
-----------------------------------------------------------
bind("n", "gh", "^", opts)
bind("n", "gl", "$", opts)
bind("v", "gh", "^", opts)
bind("v", "gl", "$", opts)
-----------------------------------------------------------
-- Move lines up and down in visual mode
-----------------------------------------------------------
bind("v", "J", ":m '>+1<CR>gv=gv", opts)
bind("v", "K", ":m '<-2<CR>gv=gv", opts)
-----------------------------------------------------------
-- Toggle Custom Terminal:
-----------------------------------------------------------
bind({ 'n', 't' }, "<C-t>", ToggleTerminal, opts)
bind("t", "<Esc>", "<C-\\><C-n>", opts)
bind("t", "<C-k>", "<Cmd>wincmd k<CR>", opts)
bind("t", "<C-j>", "<Cmd>wincmd j<CR>", opts)
