return {
	'Dedtec/lualine.nvim',
	opts = {
		options = {
			icons_enabled = true,
			component_separators = ' ',
			section_separators = { left = '', right = '' },
			symbols = {
				modified = '●', --󰐙  󰐗  󰐙     󱞂
				readonly = '󱙒', --󰅚  󰅙  󰅚    󱙒
				unnamed = '', -- 󱗼 󱗿 󰘦 
				newfile = '󰎔',
			},
			path = 1,
			shorting_target = 25,
			globalstatus = true,
		},
		extensions = {
			--'oil',
			-- 'trouble',
			-- 'quickfix',
			'toggleterm',
		},
		sections = {
			lualine_a = {
				{
					'macro-recording',
					fmt = function()
						local recording_register = vim.fn.reg_recording()
						if recording_register == "" then
							return ""
						else
							return "Recording @" .. recording_register
						end
					end
				}
			},
			-- TODO: replace toggleterm ext
			-- local current_ft = refresh_real_curwin and vim.api.nvim_buf_get_option(vim.api.nvim_win_get_buf(refresh_real_curwin), 'filetype') or vim.bo.filetype
			lualine_b = {
				{
					'filename',
					padding = { left = 0, right = 2 },
					-- separator = { left = '', right = '' },
				}
			},
			lualine_c = {
				{
					"diff",
					source = function()
						---@diagnostic disable-next-line: undefined-field
						local gitsigns = vim.b.gitsigns_status_dict
						if gitsigns then
							return {
								added = gitsigns.added,
								modified = gitsigns.changed,
								removed = gitsigns.removed,
							}
						end
					end,
					padding = { left = 2, right = 1 },
					symbols = {
						added = " ",
						modified = " ",
						removed = " ",
					},
					-- diff_color = {
					-- 	added = {
					-- 	fg = vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("GitSignsAdd")), "fg#"),
					-- 	-- bg = vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("StatusLine")), "bg#")
					-- 	},
					-- 	modified = {
					-- 	fg = vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("GitSignsChange")), "fg#"),
					-- 	--  bg = vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("StatusLine")), "bg#")
					-- 	},
					-- 	removed = {
					-- 	fg = vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("GitSignsDelete")), "fg#"),
					-- 	-- bg = vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("StatusLine")), "bg#")
					-- 	},
					-- },
					cond = nil,
				},
				{
					-- codium status
					function()
						local filetype = vim.bo.filetype or vim.api.nvim_buf_get_option( 0, vim.bo.filetype )
						if (filetype == "alpha" or filetype == "oil" or filetype == "NvimTree") then
							return ""
						end
						local status = vim.api.nvim_call_function("codeium#GetStatusString", {})
						if status == nil then
							return ""
						end
						if status == " ON" then
							return "󱙺 "
						end
						if status == "OFF" then
							return "󱙻 "
						end
						if status == ' 0 ' then
							return "󱚢 "
						end
						if status == ' * ' then
							return "󱚠 "
						end
						return "󱚤 " .. status
					end,
					color = { fg = "#09b6a2" },
				},
			},
			lualine_x = {
				{
					"diagnostics",
					sources = { "nvim_diagnostic" },
					symbols = {
						error = " ",
						warn =  " ",
						info =  " ",
						hint =  "󰛨 ",
					},
					-- cond = conditions.hide_in_width,
				},
				-- { "filetype", cond = nil, padding = { left = 1, right = 2 } },
			},
			lualine_y = {
				{
					'branch',
					icon = {'󰊢', color={fg='#f1502f'}},
					padding = { left = 2, right = 0 },
					-- separator = { left = '' },
				},
				{
					fmt = function()
						local function env_cleanup(venv)
							if string.find(venv, "/") then
								local final_venv = venv
								for w in venv:gmatch "([^/]+)" do
									final_venv = w
								end
								venv = final_venv
							end
							return venv
						end

						if vim.bo.filetype == "python" then
							local venv = os.getenv "CONDA_DEFAULT_ENV" or os.getenv "VIRTUAL_ENV"
							if venv then
								local icons = require "nvim-web-devicons"
								local py_icon, _ = icons.get_icon ".py"
								return string.format(py_icon .. " %s", env_cleanup(venv))
							end
						end
						return ""
					end,
					-- color = { fg = vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("DevIconPy")), "fg#") },
					-- separator = { right = '' },
					-- cond = conditions.hide_in_width,
				},
			},
			lualine_z = {},
		},
		inactive_sections = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = {'filename'},
			lualine_x = {},
			lualine_y = {},
			lualine_z = {}
		},
	}
}
