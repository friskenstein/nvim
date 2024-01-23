return {
	"ahmedkhalf/project.nvim",
	config = function()
	require("project_nvim").setup {
		ignore_lsp = { 'lua', 'lua_ls' },
		exclude_dirs = { '~/.config/nvim/lua/' },
	}
	end
}
