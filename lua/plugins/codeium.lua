return {
	'Exafunction/codeium.vim',
	config = function ()
		vim.g.codeium_disable_bindings = 1
		vim.g.codeium_filetypes = {
			oil = false,
		}

		vim.keymap.set('i', '<C-]>', function () return vim.fn['codeium#Accept']() end, { expr = true, silent = true })
		vim.keymap.set('i', '<M-]>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true, silent = true })
		vim.keymap.set('i', '<M-[>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true, silent = true })
		vim.keymap.set('i', '<C-e>', function() return vim.fn['codeium#Clear']() end, { expr = true, silent = true })

		vim.cmd [[hi CodeiumSuggestion guifg=#33373D]]
	end,
}
