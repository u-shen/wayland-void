-----------------------------------------------------------
-- Git
-----------------------------------------------------------
return {
	-----------------------------------------------------------
	-- LazyGit
	-----------------------------------------------------------
	{
		"kdheepak/lazygit.nvim",
		cmd = {
			"LazyGit",
			"LazyGitConfig",
			"LazyGitCurrentFile",
		},
		-- optional for floating window border decoration
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		-- setting the keybinding for LazyGit with 'keys' is recommended in
		-- order to load the plugin when the command is run for the first time
		keys = {
			{ "<leader>gg", "<cmd>LazyGit<cr>", desc = "Open Lazy Git" },
			{ "<leader>gf", "<cmd>LazyGitCurrentFile<cr>", desc = "Open Lazy Git" },
		},
		config = function()
			vim.cmd([[
			let g:lazygit_floating_window_use_plenary = 1
			]])
		end,
	},

	-----------------------------------------------------------
	-- NeoGit
	-----------------------------------------------------------
	{
		"NeogitOrg/neogit",
		dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
		cmd = "Neogit",
		keys = {
			{
				"<leader>gG",
				function()
					return require("neogit").open()
				end,
				desc = "Open neogit",
			},
		},
		opts = {
			kind = "split",
			status = { recent_commit_count = 25 },
			integrations = { telescope = true },
			auto_show_console = false,
			telescope_sorter = function()
				return require("telescope").extensions.fzf.native_fzf_sorter()
			end,
		},
	},

	-----------------------------------------------------------
	-- Gitsigns
	-----------------------------------------------------------
	{
		"lewis6991/gitsigns.nvim",
		event = "VeryLazy",
		keys = {
			{
				"<leader>ga",
				"<cmd>Gitsigns toggle_linehl<CR> <BAR> <cmd>Gitsigns toggle_deleted<CR> <BAR> <cmd>Gitsigns toggle_word_diff<CR>",
				desc = "Toggle ALL Gitsigns",
			},
			{
				"<leader>gl",
				"<cmd>Gitsigns toggle_linehl<CR>",
				desc = "Toggle Gitsigns linehl",
			},
			{
				"<leader>gd",
				"<cmd>Gitsigns toggle_deleted<CR>",
				desc = "Toggle Gitsigns deleted",
			},
			{
				"<leader>gw",
				"<cmd>Gitsigns toggle_word_diff<CR>",
				desc = "Toggle Gitsigns worddiff",
			},
		},
		opts = {
			signs = {
				add = {
					hl = "GitSignsAdd",
					text = "│",
					numhl = "GitSignsAddNr",
					linehl = "GitSignsAddLn",
				},
				change = {
					hl = "GitSignsChange",
					text = "│",
					numhl = "GitSignsChangeNr",
					linehl = "GitSignsChangeLn",
				},
				delete = {
					hl = "GitSignsDelete",
					text = "_",
					numhl = "GitSignsDeleteNr",
					linehl = "GitSignsDeleteLn",
				},
				topdelete = {
					hl = "GitSignsDelete",
					text = "‾",
					numhl = "GitSignsDeleteNr",
					linehl = "GitSignsDeleteLn",
				},
				changedelete = {
					hl = "GitSignsChange",
					text = "~",
					numhl = "GitSignsChangeNr",
					linehl = "GitSignsChangeLn",
				},
			},
			signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
			numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
			linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
			word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
			watch_gitdir = { interval = 1000, follow_files = true },
			attach_to_untracked = true,
			current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
			current_line_blame_opts = {
				virt_text = true,
				virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
				delay = 0,
				ignore_whitespace = false,
			},
			current_line_blame_formatter_opts = { relative_time = true },
			current_line_blame_formatter = "      <author>, <author_time:%R> - <summary>",
			sign_priority = 6,
			update_debounce = 100,
			status_formatter = nil, -- Use default
			max_file_length = 40000,
			preview_config = {
				-- Options passed to nvim_open_win
				border = "single",
				style = "minimal",
				relative = "cursor",
				row = 0,
				col = 1,
			},
			yadm = { enable = false },
		},
	},
}
