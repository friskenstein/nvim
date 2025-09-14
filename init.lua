vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.o.termguicolors = true
vim.g.codeium_disable_bindings = 1
vim.g.codeium_filetypes = {
	oil = false,
}

-- Shim deprecated LSP API to suppress warnings
-- Provide a compatible replacement for vim.lsp.buf_get_clients
-- TODO: Remove this shim when the deprecated API is removed
vim.lsp.buf_get_clients = function(bufnr)
	-- Prefer the newer API when available
	if type(vim.lsp.get_clients) == 'function' then
		local opts = {}
		if type(bufnr) == 'number' then
			opts.bufnr = bufnr
		else
			opts.bufnr = 0 -- current buffer by default
		end
		return vim.lsp.get_clients(opts)
	end
	-- Fallback for older versions
	if type(vim.lsp.get_active_clients) == 'function' then
		local ok, res = pcall(vim.lsp.get_active_clients, { bufnr = bufnr or 0 })
		if ok then return res end
		return vim.lsp.get_active_clients()
	end
	return {}
end

require('gui')
require('lazy-setup')
require('vim-options')
require('keymaps')
require('telescope-setup')
require('treesitter-setup')
-- require('lsp-setup')
-- require('cmp-setup')
require('minimap-setup')
require('lualine-autocmd')
