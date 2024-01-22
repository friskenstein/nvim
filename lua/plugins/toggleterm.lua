return {
	'akinsho/toggleterm.nvim',
	version = "*",
	opts = {
		--[[ things you want to change go here]]
		open_mapping = [[<c-\>]],
		highlights = {
			NormalFloat = {
				link = 'NormalFloat'
			},
			FloatBorder = {
				link = 'FloatBorder',
			}
		},
		direction = 'float',
		float_opts = {
			border = 'curved',
		},
	}
}
