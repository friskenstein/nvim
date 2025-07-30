return {
	'echasnovski/mini.files',
	version = 'false',
	config = function()
		require('mini.files').setup({
			mappings = {
				go_in_plus = '<CR>',
				go_out = '<BS>',
				reset = '',
				close = '-',
			}
		})
	end,
}
