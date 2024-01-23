return {
	"echasnovski/mini.map",
	branch = "stable",
	config = function()
		require('mini.map').setup()
		local map = require('mini.map')
		map.setup({
			integrations = {
				map.gen_integration.builtin_search(),
				map.gen_integration.diagnostic({
					error = 'DiagnosticFloatingError',
					warn  = 'DiagnosticFloatingWarn',
					info  = 'DiagnosticFloatingInfo',
					hint  = 'DiagnosticFloatingHint',
				}),
			},
			symbols = {
				encode = map.gen_encode_symbols.dot('4x2'),
				scroll_line = '',
				scroll_view = '┃',
			},
			window = {
				side = 'right',
				width = 1, -- set to 1 for a pure scrollbar :)
				winblend = 0,
				show_integration_count = false,
			},
		})
	end,
}
