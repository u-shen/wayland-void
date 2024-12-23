-----------------------------------------------------------
-- Auto Completion
-----------------------------------------------------------
local symbol_map = {
	Text = "",
	Method = "",
	Function = "󰊕",
	Constructor = "󰡱",
	Field = "",
	Variable = "",
	Class = "",
	Interface = "",
	Module = "",
	Property = "",
	Unit = "",
	Value = "",
	Enum = "",
	Keyword = "",
	Snippet = "",
	Color = "",
	File = "",
	Reference = "",
	Folder = "",
	EnumMember = "",
	Constant = "",
	Struct = "",
	Event = "",
	Operator = "",
	TypeParameter = " ",
	Robot = "󱚤",
	Roboti = "󱨚",
	Smiley = " ",
	Note = " ",
}

return {
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"onsails/lspkind-nvim",
			"hrsh7th/cmp-vsnip",
			"hrsh7th/vim-vsnip",
			"rafamadriz/friendly-snippets",
			"nrjdalal/shadcn-ui-snippets",
			-- {
			-- 	"zbirenbaum/copilot-cmp",
			-- 	dependencies = { "copilot.lua" },
			-- 	config = function()
			-- 		require("copilot_cmp").setup({
			-- 			event = { "InsertEnter", "LspAttach" },
			-- 			fix_pairs = true,
			-- 		})
			-- 	end,
			-- },
		},

		config = function()
			local cmp = require("cmp")
			local lspkind = require("lspkind")

			cmp.setup({
				preselect = cmp.PreselectMode.Item,
				window = {
					completion = {
						border = "single",
						winhighlight = "Normal:TelescopePromptPrefix,FloatBorder:TelescopePromptBorder,CursorLine:TelescopeSelection,Search:None",
					},
					documentation = {
						border = "single",
						winhighlight = "NormalFloat:TelescopePromptPrefix,FloatBorder:TelescopePromptPrefix",
					},
				},
				experimental = {
					ghost_text = false,
					git = {
						async = true,
					},
				},
				performance = {
					debounce = 0, -- default is 60ms
					throttle = 0, -- default is 30ms
				},
				matching = {
					disallow_fuzzy_matching = true,
					disallow_fullfuzzy_matching = true,
					disallow_partial_fuzzy_matching = false,
					disallow_partial_matching = false,
					disallow_prefix_unmatching = true,
				},
				formatting = {
					format = lspkind.cmp_format({
						symbol_map = symbol_map,
						before = function(entry, vim_item)
							vim_item.kind = string.format(vim_item.kind, symbol_map[vim_item.kind], "%s %s")
							vim_item.menu = ({
								buffer = "[Buffer]",
								nvim_lsp = "[LSP]",
								vsnip = "[Snip]",
								nvim_lua = "[Lua]",
								path = "[Path]",
								copilot = "[Copilot]",
							})[entry.source.name]
							return vim_item
						end,
					}),
				},
				snippet = {
					expand = function(args)
						vim.fn["vsnip#anonymous"](args.body)
					end,
				},
				mapping = {
					["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
					["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
					["<C-k>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
					["<C-j>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
					["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
					["<C-n>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
					["<C-y>"] = cmp.mapping.confirm({ select = true }),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							local entry = cmp.get_selected_entry()
							if not entry then
								cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
							else
								cmp.confirm()
							end
						else
							fallback()
						end
					end, { "i", "s", "c" }),
				},
				sources = cmp.config.sources({
					{ name = "vsnip" },
					{ name = "nvim_lsp" },
					{ name = "buffer" },
				}),
				sorting = {
					priority_weight = 2,
					comparators = {
						-- require("copilot_cmp.comparators").prioritize,
						cmp.config.compare.offset,
						cmp.config.compare.exact,
						cmp.config.compare.score,
						cmp.config.compare.recently_used,
						cmp.config.compare.locality,
						cmp.config.compare.kind,
						cmp.config.compare.sort_text,
						cmp.config.compare.length,
						cmp.config.compare.order,
					},
				},
			})

			cmp.setup.cmdline({ "/", "?" }, {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = "buffer" },
				},
			})

			cmp.setup.cmdline(":", {
				sources = cmp.config.sources({
					{ name = "path" },
				}, {
					{ name = "cmdline", keyword_length = 3 },
				}),
			})
		end,
	},
}
