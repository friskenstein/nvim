-- [[ Setting options ]]
-- See `:help vim.o`

vim.o.relativenumber = true
vim.o.cmdheight = 0
vim.o.so = 0
vim.o.ph = 30
vim.o.et = false
vim.o.scroll = 30
vim.o.ts = 4
vim.o.sw = 0 -- fallback to tabstop
vim.o.wrap = false

vim.fn.sign_define('DiagnosticSignError', { text = '', texthl = 'DiagnosticError', numhl = 'DiagnosticError'})
vim.fn.sign_define('DiagnosticSignWarn',  { text = '', texthl = 'DiagnosticWarn' , numhl = 'DiagnosticWarn' })
vim.fn.sign_define('DiagnosticSignInfo',  { text = '', texthl = 'DiagnosticInfo' , numhl = 'DiagnosticInfo' })
vim.fn.sign_define('DiagnosticSignHint',  { text = '󰛨', texthl = 'DiagnosticHint' , numhl = 'DiagnosticHint' })

-- Set highlight on search
vim.o.hlsearch = false

-- Make line numbers default
vim.wo.number = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.o.clipboard = 'unnamed,unnamedplus'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 100

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

vim.o.termguicolors = true

vim.opt.fillchars = "eob: ,vert: ,stl: " -- stl is not a space
vim.opt.listchars = "space:⋅,tab:› ,trail:,nbsp:+"
--vim.opt.listchars:append "eol:↴"

vim.opt.ww = 'b,s,<,>,[,]'

vim.g.markdown_fenced_languages = {'html', 'python', 'javascript', 'js=javascript'}

vim.g.csv_arrange_align = 'r*'
vim.g.csv_nomap_space = 1
vim.g.csv_nomap_h = 1
vim.g.csv_nomap_l = 1
-- had to use this to get the <leader><space> keymap working
vim.g.no_csv_maps = 1

-- disables built-in python.vim setting expandtab
vim.g.python_recommended_style = 0
