vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.o.termguicolors = true
vim.g.codeium_disable_bindings = 1
vim.g.codeium_filetypes = {
	oil = false,
}
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
