vim.diagnostic.config({
	float = {
		border = 'rounded',
	},
	severity_sort = true,
})

vim.g.transparent_bg_toggle = true
vim.g.transparent_floats_toggle = true
vim.opt.background = 'dark'

vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "*",
	callback = function()
		local hl_groups = {
			"Normal",
			"SignColumn",
			"NormalNC",
			"TelescopeBorder",
			"NvimTreeNormal",
			"NvimTreeNormalNC",
			"EndOfBuffer",
			"MsgArea",
			"StatusLine",
			"StatusLineNC",
			"TabLineFill",
		}

		if vim.g.transparent_bg_toggle then
			for _, name in ipairs(hl_groups) do
				vim.cmd(string.format("highlight %s ctermbg=none guibg=none", name))
			end
		end

		if vim.g.transparent_floats_toggle then
			vim.cmd("hi NormalFloat ctermbg=none guibg=none")
			vim.cmd("hi FloatBorder ctermbg=none guibg=none")
			vim.cmd("hi FloatTitle ctermbg=none guibg=none")
			vim.cmd("hi! link WhichKeyFloat NormalFloat")

			vim.cmd("hi NotifyBackground ctermbg=none guibg=none")
			vim.cmd("hi NotifyINFOBody ctermbg=none guibg=none")
			vim.cmd("hi NotifyINFOBorder ctermbg=none guibg=none")
			vim.cmd("hi NotifyERRORBody ctermbg=none guibg=none")
			vim.cmd("hi NotifyERRORBorder ctermbg=none guibg=none")
			vim.cmd("hi NotifyDEBUGBody ctermbg=none guibg=none")
			vim.cmd("hi NotifyDEBUGBorder ctermbg=none guibg=none")
			vim.cmd("hi NotifyTRACEBody ctermbg=none guibg=none")
			vim.cmd("hi NotifyTRACEBorder ctermbg=none guibg=none")
			vim.cmd("hi NotifyWARNBody ctermbg=none guibg=none")
			vim.cmd("hi NotifyWARNBorder ctermbg=none guibg=none")
		end

		vim.cmd("hi! link TelescopeNormal NormalFloat")
		vim.cmd("hi! link TelescopeBorder FloatBorder")
		vim.cmd("hi! link WhichKeyBorder FloatBorder")

	end,
})

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
-- Typicaly uses the IncSearch highlight
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = '*',
})

-- vim.api.nvim_create_autocmd({"VimEnter", 'BufEnter'}, {
-- 	callback = function()
-- 		vim.cmd("hi lualine_c_normal ctermbg=none guibg=none")
-- 		vim.cmd("hi lualine_c_inactive ctermbg=none guibg=none")
-- 		vim.cmd("hi lualine_c_terminal ctermbg=none guibg=none")
-- 		vim.cmd("hi lualine_c_replace ctermbg=none guibg=none")
-- 		vim.cmd("hi lualine_c_command ctermbg=none guibg=none")
-- 		vim.cmd("hi lualine_c_visual ctermbg=none guibg=none")
-- 		vim.cmd("hi lualine_c_insert ctermbg=none guibg=none")
-- 	end,
-- })
