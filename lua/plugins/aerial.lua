return {
	'stevearc/aerial.nvim',
	opts = {
		layout = {
			max_width = {50, 0.35},
			min_width = {25, 0.2},
			default_direction = "prefer_left",
		},
	},
	-- Optional dependencies
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons"
	},
}
