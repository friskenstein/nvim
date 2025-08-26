vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.o.termguicolors = true
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
