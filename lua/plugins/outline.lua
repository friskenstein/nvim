return {
	'hedyhli/outline.nvim',
	lazy = true,
	cmd = { "Outline", "OutlineOpen" },
	keys = {
		{ "<leader>o", "<cmd>Outline<CR>", desc = "Toggle outline" },
	},
	opts = {
		-- Your setup opts here
		outline_window = {
			position = "left",
		},
	},
}
