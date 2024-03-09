return {
	'nvim-tree/nvim-web-devicons',
	opts = {
		override = {
			-- https://github.com/nvim-tree/nvim-web-devicons/blob/master/lua/nvim-web-devicons/icons-default.lua
			["ts"] = {
				icon = "",
				color = "#4272ba", -- "#519aba",
				cterm_color = "74",
				name = "Ts",
			},
			["tsconfig.json"] = {
				icon = "",
				color = "#4272ba",
				cterm_color = "74",
				name = "TSConfig",
			},
			["md"] = {
				icon = "󰁉",
				color = "#499bea",
				cterm_color = "231",
				name = "Md",
			},
			["lua"] = {
				icon = "",
				color = "#6447b8",
				cterm_color = "74",
				name = "Lua",
			},
			["sql"] = {
				icon = "",
				color = "#f6955b",
				cterm_color = "188",
				name = "Sql",
			},
			["db"] = {
				icon = "",
				color = "#f6955b",
				cterm_color = "188",
				name = "Db",
			},
			["json"] = {
				icon = "󰘦",
				color = "#cbcb41",
				cterm_color = "185",
				name = "Json",
			},
			["json5"] = {
				icon = "󰘦",
				color = "#cbcb41",
				cterm_color = "185",
				name = "Json5",
			},
			["jsonc"] = {
				icon = "󰘦",
				color = "#cbcb41",
				cterm_color = "185",
				name = "Jsonc",
			},
		},
	},
}
