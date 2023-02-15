-- Component autocompletion
local cmp = require'cmp'
local cmp_types = require('cmp.types')

cmp.setup({
		snippet = {
			-- REQUIRED - you must specify a snippet engine
			expand = function(args)
				vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
			end,
		},
		completion = {
			autocomplete = {
				cmp_types.cmp.TriggerEvent.TextChanged,
			},
		},
		experimental = {
				native_menu = false,
				ghost_text = false,
		},
		mapping = {
				['<C-x><C-o>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
				-- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
				['<CR>'] = cmp.mapping.confirm({ select = true }),
				['<C-y>'] = cmp.mapping.confirm({ select = true }),
				['<C-b>'] = cmp.mapping.select_prev_item(),
				-- Defaults, except <C-e>
				['<Down>'] = { i = cmp.mapping.select_next_item({ behavior = cmp_types.cmp.SelectBehavior.Select }), },
				['<Up>'] = { i = cmp.mapping.select_prev_item({ behavior = cmp_types.cmp.SelectBehavior.Select }), },
				['<C-n>'] = { i = cmp.mapping.select_next_item({ behavior = cmp_types.cmp.SelectBehavior.Insert }), },
				['<C-p>'] = { i = cmp.mapping.select_prev_item({ behavior = cmp_types.cmp.SelectBehavior.Insert }), },
				['<C-y>'] = { i = cmp.mapping.confirm({ select = false }), },
		},
		sources = cmp.config.sources({
				{ name = 'nvim_lsp' },
				{ name = 'vsnip' }, -- For vsnip users.
		}),
})
