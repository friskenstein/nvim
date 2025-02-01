return {

	'goolord/alpha-nvim',
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	config = function ()

		local header = {
			type = "text",
			val = {
				[[                                                                           ]],
				[[                                                                           ]],
				[[     .          .                                                          ]],
				[[   ';;,.        ::'                                                        ]],
				[[ ,:::;,,        :ccc,                                                      ]],
				[[,::c::,,,,.     :cccc,                               ,,                    ]],
				[[,cccc:;;;;;.    cllll,                               db                    ]],
				[[,cccc;.;;;;;,   cllll;                                                     ]],
				[[:cccc; .;;;;;;. coooo;  .gP"Ya   ,pW"Wq.`7M'   `MF'`7MM  `7MMpMMMb.pMMMb.  ]],
				[[;llll;   ,:::::'loooo; ,M'   Yb 6W'   `Wb VA   ,V    MM    MM    MM    MM  ]],
				[[;llll:    ':::::loooo: 8M"""""" 8M     M8  VA ,V     MM    MM    MM    MM  ]],
				[[:oooo:     .::::llodd: YM.    , YA.   ,A9   VVV      MM    MM    MM    MM  ]],
				[[.;ooo:       ;cclooo:. .`Mbmmd'  `Ybmd9'     W     .JMML..JMML  JMML  JMML.]],
				[[  .;oc        'coo;.                                                       ]],
				[[    .'         .,.                                                         ]],
			},
			opts = {
				position = "center",
				hl = "@function.builtin",
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
				hl_shortcut = "@function.builtin",
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
				{ type = "padding", val = 2 },
				button("n", "  New File", ":ene!<CR>"),
				button("f", "󰈞  Find File", ":Telescope find_files<CR>"),
				button("t", "󰺯  Find Word", ":Telescope live_grep<CR>"),
				button("e", "󰀶  File Explorer", ":Oil --float<CR>"),
				button("p", "󰄉  Recent Projects ", ":Telescope projects<CR>"),
				button("r", "  Recent Files", ":Telescope oldfiles<CR>"),
				button("c", "  Configuration", ":Oil --float ~/.config/nvim<CR>"),
				{ type = "padding", val = 2 },
			},
			opts = {
				spacing = 0,
				hl_shortcut = "@function.builtin",
			},
		}

		local footer = {
			type = "text",
			val = "Neovim " .. vim.version().major .. "." .. vim.version().minor .. "." .. vim.version().patch,
			opts = {
				position = "center",
				hl = "@function.builtin",
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
