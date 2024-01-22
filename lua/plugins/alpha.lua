return {
	'goolord/alpha-nvim',
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	config = function ()

		local header = {
		    type = "text",
		    val = {
				[[          .                                                      .           ]],
				[[        .n                   .                 .                  n.         ]],
				[[  .   .dP                  dP                   9b                 9b.    .  ]],
				[[ 4    qXb         .       dX                     Xb       .        dXp     t ]],
				[[dX.    9Xb      .dXb    __                         __    dXb.     dXP     .Xb]],
				[[9XXb._       _.dXXXXb dXXXXbo.                 .odXXXXb dXXXXb._       _.dXXP]],
				[[ 9XXXXXXXXXXXXXXXXXXXVXXXXXXXXOo.           .oOXXXXXXXXVXXXXXXXXXXXXXXXXXXXP ]],
				[[  `9XXXXXXXXXXXXXXXXXXXXX"~   ~`OOO8b   d8OOO"~   ~`XXXXXXXXXXXXXXXXXXXXXP"  ]],
				[[    `9XXXXXXXXXXXP" `9XX"   DIE    `98v8P"  HUMAN   `XXP" `9XXXXXXXXXXXP"    ]],
				[[        ~~~~~~~       9X.          .db|db.          .XP       ~~~~~~~        ]],
				[[                        )b.  .dbo.dP"`v"`9b.odb.  .dX(                       ]],
				[[                      ,dXXXXXXXXXXXb     dXXXXXXXXXXXb.                      ]],
				[[                     dXXXXXXXXXXXP"   .   `9XXXXXXXXXXXb                     ]],
				[[                    dXXXXXXXXXXXXb   d|b   dXXXXXXXXXXXXb                    ]],
				[[                    9XXb"   `XXXXXb.dX|Xb.dXXXXX"   `dXXP                    ]],
				[[                     `"      9XXXXXX(   )XXXXXXP      `"                     ]],
				[[                              XXXX X.`v".X XXXX                              ]],
				[[                              XP^X"`b   d"`X^XX                              ]],
				[[                              X. 9  `   "  P )X                              ]],
				[[                              `b  `       "  d"                              ]],
				[[                               `             "                               ]],
		    },
		    opts = {
			position = "center",
			hl = "Special",
		    },
		}


		--- @param sc string
		--- @param txt string
		--- @param keybind string? optional
		--- @param keybind_opts table? optional
		local function button(sc, txt, keybind, keybind_opts)

		    local opts = {
				position = "center",
				shortcut = sc,
				cursor = 3,
				width = 50,
				align_shortcut = "right",
				hl_shortcut = "Special",
		    }
		    if keybind then
				keybind_opts = vim.F.if_nil(keybind_opts, { noremap = true, silent = true, nowait = true })
				opts.keymap = { "n", sc, keybind, keybind_opts }
		    end

		    local function on_press()
				local key = vim.api.nvim_replace_termcodes(keybind or sc .. "<Ignore>", true, false, true)
				vim.api.nvim_feedkeys(key, "t", false)
		    end

		    return {
				type = "button",
				val = txt,
				on_press = on_press,
				opts = opts,
		    }
		end

		local buttons = {
			type = "group",
			val = {
				button("n", "  New File", ":ene!<CR>"),
				button("f", "󰈞  Find File", ":Telescope find_files<CR>"),
				button("t", "󰺯  Find Word", ":Telescope live_grep<CR>"),
				button("e", "󰀶  File Explorer", ":Oil --float<CR>"),
				button("p", "󰄉  Recent Projects ", ":Telescope projects<CR>"),
				button("r", "  Recent Files", ":Telescope oldfiles<CR>"),
				button("c", "  Configuration", ":Oil --float ~/.config/nvim<CR>"),
			},
			opts = {
				spacing = 1,
				hl_shortcut = "String",
			},
		}

		local footer = {
		    type = "text",
		    val = "Neovim " .. vim.version().major .. "." .. vim.version().minor .. "." .. vim.version().patch,
		    opts = {
				position = "center",
				hl = "Special",
		    },
		}

		local config = {
		    layout = {
				header,
				{ type = "padding", val = 1 },
				buttons,
				footer,
		    },
		    opts = {
			margin = 5,
		    },
		}


		require'alpha'.setup(config)
	end
}
