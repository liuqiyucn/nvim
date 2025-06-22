return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		{
			"L3MON4D3/LuaSnip",
			build = (function()
				if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
					return
				end
				return "make install_jsregexp"
			end)(),

			dependencies = {
				{
					"rafamadriz/friendly-snippets",
					config = function()
						require("luasnip.loaders.from_vscode").lazy_load()
					end,
				},
			},
		},
		"saadparwaiz1/cmp_luasnip",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"micangl/cmp-vimtex",
		"kdheepak/cmp-latex-symbols",
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		luasnip.config.setup({})

		local kind_icons = {
			Text = "󰉿",
			Method = "m",
			Function = "󰊕",
			Constructor = "",
			Field = "",
			Variable = "󰆧",
			Class = "󰌗",
			Interface = "",
			Module = "",
			Property = "",
			Unit = "",
			Value = "󰎠",
			Enum = "",
			Keyword = "󰌋",
			Snippet = "",
			Color = "󰏘",
			File = "󰈙",
			Reference = "",
			Folder = "󰉋",
			EnumMember = "",
			Constant = "󰇽",
			Struct = "",
			Event = "",
			Operator = "󰆕",
			TypeParameter = "󰊄",
		}

		-- local formatting = {
		-- 	fields = { "kind", "abbr", "menu" },
		--
		-- 	format = function(entry, vim_item)
		-- 		if entry.source.name == "vimtex" then
		-- 			vim_item.kind = ""
		-- 			vim_item.menu = "[TeX]"
		-- 		else
		-- 			vim_item.kind = string.format("%s", kind_icons[vim_item.kind] or "")
		-- 			vim_item.menu = ({
		-- 				nvim_lsp = "[LSP]",
		-- 				buffer = "[Buffer]",
		-- 				path = "[Path]",
		-- 				luasnip = "[Snip]",
		-- 			})[entry.source.name] or ""
		-- 		end
		-- 		return vim_item
		-- 	end,
		-- }

		local formatting = {
			fields = { "kind", "abbr", "menu" },

			format = function(entry, vim_item)
				local ft = vim.bo.filetype
				if (ft == "tex" or ft == "bib") and entry.source.name == "nvim_lsp" then
					vim_item.kind = string.format("%s %s", "", vim_item.kind or "")
					-- vim_item.kind = ""
					vim_item.menu = "[TexLab]"
				else
					vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind] or "", vim_item.kind or "")
					vim_item.menu = ({
						nvim_lsp = "[LSP]",
						buffer = "[Buffer]",
						path = "[Path]",
						luasnip = "[Snip]",
					})[entry.source.name] or ""
				end
				return vim_item
			end,
		}

		cmp.setup({
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
			completion = { completeopt = "menu,menuone,noinsert", border = "rounded" },

			mapping = cmp.mapping.preset.insert({
				-- ["<BS>"] = cmp.mapping(function(fallback)
				-- 	smart_bs()
				-- end, { "i", "s" }),
				["<C-n>"] = cmp.mapping.select_next_item(),
				["<C-p>"] = cmp.mapping.select_prev_item(),
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-y>"] = cmp.mapping.confirm({ select = true }), -- snippets

				["<CR>"] = cmp.mapping.confirm({
					select = false,
				}),

				["<C-x>"] = cmp.mapping.complete({}), -- triggers completion manually

				["<C-l>"] = cmp.mapping(function()
					if luasnip.expand_or_locally_jumpable() then
						luasnip.expand_or_jump()
					end
				end, { "i", "s" }),

				["<C-h>"] = cmp.mapping(function()
					if luasnip.locally_jumpable(-1) then
						luasnip.jump(-1)
					end
				end, { "i", "s" }),

				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					elseif luasnip.expand_or_locally_jumpable() then
						luasnip.expand_or_jump()
					else
						fallback()
					end
				end, { "i", "s" }),

				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					elseif luasnip.locally_jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, { "i", "s" }),
			}),

			sources = {
				{
					name = "lazydev",
					group_index = 0,
				},
				{ name = "nvim_lsp" },
				{ name = "buffer" },
				{ name = "path" },
				{ name = "luasnip" },
			},
			formatting = formatting,
		})

		-- cmp.setup({
		-- 	sorting = {
		-- 		priority_weight = 2,
		-- 		comparators = {
		-- 			-- Force source priority first
		-- 			function(entry1, entry2)
		-- 				local priority1 = entry1.source.priority or 0
		-- 				local priority2 = entry2.source.priority or 0
		-- 				if priority1 ~= priority2 then
		-- 					return priority1 > priority2
		-- 				end
		-- 			end,
		-- 			-- Then fall back to the default comparators
		-- 			cmp.config.compare.offset,
		-- 			cmp.config.compare.exact,
		-- 			cmp.config.compare.score,
		-- 			cmp.config.compare.recently_used,
		-- 			cmp.config.compare.kind,
		-- 			cmp.config.compare.sort_text,
		-- 			cmp.config.compare.length,
		-- 			cmp.config.compare.order,
		-- 		},
		-- 	},
		-- })

		cmp.setup.filetype("tex", {
			sources = cmp.config.sources({
				{ name = "nvim_lsp", priority = 5000 }, -- higher number = higher priority
				{ name = "buffer", keyword_length = 3, priority = 500 },
				{ name = "path", priority = 250 },

				{ name = "luasnip" },
				-- {
				-- 	name = "latex_symbols",
				-- 	option = {
				-- 		strategy = 2,
				-- 	},
				-- 	priority = 300,
				-- },
			}),
		})

		-- cmp.setup.filetype("tex", {
		-- 	sources = {
		-- 		-- { name = "vimtex" },
		-- 		{ name = "nvim_lsp" },
		-- 		{ name = "buffer", keyword_length = 3 },
		-- 		{ name = "path" },
		-- 		{
		-- 			name = "latex_symbols",
		-- 			option = {
		-- 				strategy = 2, -- mixed
		-- 			},
		-- 		},
		-- 		-- { name = "luasnip" },
		-- 	},
		-- })

		-- autopairs after Function
		local cmp_autopairs = require("nvim-autopairs.completion.cmp")
		cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
	end,
}
