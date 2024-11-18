----------------------------
-- Basics Configuration:
----------------------------
require("config/options")
require("config/keymaps")
require("config/autocmds")
----------------------------
-- Plugins Bootstrap:
----------------------------
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)
----------------------------
-- Plugins Trigger:
----------------------------
require("lazy").setup("plugins", {
	change_detection = {
		notify = false,
	},
	ui = {
		border = "none",
	},
})
