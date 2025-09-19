return {
	'echasnovski/mini.files',
	version = 'false',
	config = function()
		require('mini.files').setup({
			mappings = {
				go_in_plus = '<CR>',
				go_in = '<Right>',
				go_out = '<Left>',
				go_out_plus = '<BS>',
				reset = 'q',
				close = '-',
			}
		})
	end,
}
