return {
	"folke/noice.nvim",
	event = "VeryLazy",
	opts = {
		cmdline = {
			enabled = true, -- enables the Noice cmdline UI
			view = "cmdline_popup", -- view for rendering the cmdline. Change to `cmdline` to get a classic cmdline at the bottom
			opts = {}, -- global options for the cmdline. See section on views
			format = {
				-- conceal: (default=true) This will hide the text in the cmdline that matches the pattern.
				-- view: (default is cmdline view)
				-- opts: any options passed to the view
				-- icon_hl_group: optional hl_group for the icon
				-- title: set to anything or empty string to hide
				-- 󰅂 󰄾  󰬪 󰬫
				cmdline = { pattern = "^:", icon = "  ", lang = "vim", title=" Command "  },
				search_down = { kind = "search", pattern = "^/", icon = " ", lang = "regex" },
				search_up = { kind = "search", pattern = "^%?", icon = " ", lang = "regex" },
				filter = { pattern = "^:%s*!", icon = "$", lang = "bash", title=" Bash " },
				lua = { pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" }, icon = "  ", lang = "lua" },
				help = { pattern = "^:%s*he?l?p?%s+", icon = " 󰋖 " },
				input = {}, -- Used by input()
				-- lua = false, -- to disable a format, set to `false`
			},
		},
		views = {
			mini = {
				win_options = {
					winblend = 0
				}
			},
			hover = {
				view = "popup",
				relative = "cursor",
				zindex = 45,
				enter = false,
				anchor = "auto",
				size = {
					width = "auto",
					height = "auto",
					max_height = 30,
					max_width = 120,
				},
				border = {
					style = "rounded",
					padding = { 0, 2 },
				},
				position = { row = 2, col = 0 },
				win_options = {
					wrap = true,
					linebreak = true,
				},
			},
			confirm = {
				win_options = {
					winhighlight = {
						Normal = "NormalFloat",
						FloatBorder = "FloatBorder",
					},
				},
			},
			cmdline = {
				border = {
					text = {
						top = "Command"
					}
				}
			},
		},
		lsp = {
			progress = {
				format = {
					{ "{spinner} ", hl_group = "NoiceLspProgressSpinner" },
					{ "{data.progress.title} ", hl_group = "NoiceLspProgressTitle" },
					{ "{data.progress.client} ", hl_group = "NoiceLspProgressClient" },
				},
				format_done = "lsp_progress_done",
				throttle = 1000 / 30, -- frequency to update lsp progress message
				view = "mini",
			},
		},
	},
	dependencies = {
		-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
		"MunifTanjim/nui.nvim",
		-- OPTIONAL:
		--   `nvim-notify` is only needed, if you want to use the notification view.
		--   If not available, we use `mini` as the fallback
		--"rcarriga/nvim-notify",
	},
}
