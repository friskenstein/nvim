return {
	'nvim-tree/nvim-tree.lua',
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	opts = {
		view = {
			width = 30,
			signcolumn = 'no',
		},
		renderer = {
			special_files = {},
			highlight_git = 'name',
			indent_width = 2,
			indent_markers = {
				enable = true,
			},
			icons = {
				git_placement = 'signcolumn',
				show = {
					-- folder = false,
					git = false,
					bookmarks = false,
					diagnostics = false,
				},
				glyphs = {
					default = "",
					symlink = "",
					bookmark = "󰆤",
					modified = "●",
					folder = {
						arrow_closed = " ", -- "",
						arrow_open = " ", -- "",
						default = "", -- "",
						open = "",-- "",
						empty = "",-- "",
						empty_open = "",-- "",
						symlink = "",
						symlink_open = "",
					},
					git = {
						unstaged  = "", --󰷈 󰷉 
						staged    = "", --󱪙 󱪚 
						untracked = "", --󱪝 󱪞 
						deleted   = "", --󱪟 󱪠 
						ignored   = "", --󱪛 󱪜 
						unmerged  = "",
						renamed   = "➜",
					},
				},
			},
		},
		update_focused_file = {
			enable = true,
			update_root = true,
		},
		git = {
			enable = true,
			show_on_dirs = true,
			show_on_open_dirs = false,
		},
		modified = {
			enable = true,
			show_on_dirs = true,
			show_on_open_dirs = false,
		},
		filters = {
			git_ignored = false,
			custom = {
				'^\\.DS_Store$',
			}
		},
	},
}
