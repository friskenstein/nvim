vim.diagnostic.config({
	float = {
		border = 'rounded',
	}
})

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
		for _, name in ipairs(hl_groups) do
			vim.cmd(string.format("highlight %s ctermbg=none guibg=none", name))
		end

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
