vim.diagnostic.config({
	float = {
		border = 'rounded',
	},
	severity_sort = true,
})

vim.g.transparent_bg_toggle = false
vim.g.transparent_floats_toggle = false
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
