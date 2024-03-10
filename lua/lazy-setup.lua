-- [[ Install `lazy.nvim` plugin manager ]]
-- https://github.com/folke/lazy.nvim
-- `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system {
		'git',
		'clone',
		'--filter=blob:none',
		'https://github.com/folke/lazy.nvim.git',
		'--branch=stable', -- latest stable release
		lazypath,
	}
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({

	-- Default colorscheme 
	{
		"Dedtec/witchcraft.nvim",
		opts = {
			transparent_background = true,
		},
		config = function(_, opts)
			require("tokyodark").setup(opts) -- calling setup is optional
			vim.cmd [[colorscheme tokyodark]]
		end,
	},
	{
		"Dedtec/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			--vim.cmd.colorscheme 'tokyonight-moon'
		end,
	},
	-- Colorschemes
	--'Dedtec/tokyonight.nvim',
	'Dedtec/lunar.nvim',
	'Dedtec/poimandres.nvim',
	'Dedtec/oxocarbon.nvim',
	'Dedtec/horizon.nvim',
	'Dedtec/palenightfall.nvim',
	'Dedtec/focus.nvim',
	{
		"Dedtec/neovim-ayu",
		config = function ()
			local colors = require('ayu.colors')
			colors.generate(false)
			require('ayu').setup({
				overrides = {
					-- ColorColumn = { bg = "None" },
					-- WhichKeyFloat = { bg = "None" },
					-- NotifyBackground = { bg = colors.bg },
					-- NvimTreeSymLink = { fg = colors.lsp_parameter },
					-- CursorLineNr = { fg = colors.accent, bg = "None" },
					-- TabLineFill = { bg='none' },
				},
			})
		end
	},
	{
		"Dedtec/catppuccin",
		config = function ()
			require("catppuccin").setup({
				transparent_background = true,
			})
		end
	},

	{
		"tpope/vim-surround",
		init = function()
			vim.g["surround_no_mappings"] = 1
		end,
		config = function()
			vim.keymap.set("n", "ds", "<Plug>Dsurround")
			vim.keymap.set("n", "cs", "<Plug>Csurround")
			vim.keymap.set("n", "cS", "<Plug>CSurround")
			vim.keymap.set("n", "ys", "<Plug>Ysurround")
			vim.keymap.set("n", "yS", "<Plug>YSurround")
			vim.keymap.set("n", "yss", "<Plug>Yssurround")
			vim.keymap.set("n", "ySs", "<Plug>YSsurround")
			vim.keymap.set("n", "ySS", "<Plug>YSsurround")
			-- conflicting with leap.nvim
			--vim.keymap.set("x", "S", "<Plug>VSurround")
			--vim.keymap.set("x", "gS", "<Plug>VgSurround")
			vim.keymap.set("x", "gS", "<Plug>VSurround") -- NOTE: gS instead of default S
		end,
	},
	{
		'ggandor/leap.nvim',
		config = function()
			-- needs to load after vim-surround
			require('leap').create_default_mappings()
		end
	},


	"chrisbra/csv.vim",
	{
		"okuuva/auto-save.nvim",
		cmd = "ASToggle", -- optional for lazy loading on command
		event = { "InsertLeave", "TextChanged" }, -- optional for lazy loading on trigger events
		opts = {
			enabled = false,
		},
	},
	{
		"folke/todo-comments.nvim",
		dependencies = {"nvim-lua/plenary.nvim"},
		event = "BufRead",
		config = function()
			require("todo-comments").setup {
				keywords = {
					FIX = {
						icon = " ", --  icon used for the sign, and in search results
						color = "error", -- can be a hex color, or a named color (see below)
						alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
					},
					-- 󰄱  󰗡 󰝦  󰥪     󰴒 󰷈  󱇨 󱓦
					TODO = { icon = " ", color = "hint" },
					-- 
					TAG = { icon = " ", color = "info", alt = { "BOOKMARK" }},
					SECTION = { icon = "󰚟 ", color = "info"},
					HACK = { icon = " ", color = "warning" },
					WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
					PERF = { icon = "󰓅 ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
					NOTE = { icon = " ", color = "info", alt = { "INFO" } },
					-- 󰂖
					TEST = { icon = "󰙨󰤑", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
				},
				colors = {
					error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
					warning = { "DiagnosticWarn", "WarningMsg", "#FBBF24" },
					info = { "DiagnosticInfo", "#2563EB" },
					hint = { "DiagnosticHint", "#10B981" },
					default = { "Identifier", "#7C3AED" },
					test = { "Define", "#FF00FF" }
				},
				highlight = {
					keyword = "fg",
					after = "",
					comments_only = true,
				},
				gui_style = {
					fg = "BOLD",
				},
			}
		end
	},
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require('colorizer').setup(nil, {names=false, mode='foreground'})
		end
	},
	-- Git related plugins
	'tpope/vim-fugitive',
	'tpope/vim-rhubarb',

	-- NOTE: This is where your plugins related to LSP can be installed.
	--  The configuration is done below. Search for lspconfig to find it below.
	{
		-- LSP Configuration & Plugins
		'neovim/nvim-lspconfig',
		dependencies = {
			-- Automatically install LSPs to stdpath for neovim
			{ 'williamboman/mason.nvim', config = true },
			'williamboman/mason-lspconfig.nvim',

			-- Useful status updates for LSP
			-- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
			{
				'j-hui/fidget.nvim',
				opts = {
					notification = {
						window = {
							winblend = 0, -- transparent notifications 
						},
					},
				},
			},

			-- Additional lua configuration, makes nvim stuff amazing!
			'folke/neodev.nvim',
		},
	},

	{
		-- Autocompletion
		'hrsh7th/nvim-cmp',
		dependencies = {
			-- Snippet Engine & its associated nvim-cmp source
			'L3MON4D3/LuaSnip',
			'saadparwaiz1/cmp_luasnip',

			-- Adds LSP completion capabilities
			'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/cmp-path',

			-- Adds a number of user-friendly snippets
			'rafamadriz/friendly-snippets',
		},
	},

	-- Useful plugin to show you pending keybinds.
	{
		'folke/which-key.nvim',
		opts = {
			window = {
				border = "single",
			},
			icons = {
				breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
				separator = "", -- symbol used between a key and it's label
				group = " ", -- symbol prepended to a group
			},
			layout = {
				align = 'center',
			},
		},
	},



	{
		-- Add indentation guides even on blank lines
		'lukas-reineke/indent-blankline.nvim',
		-- Enable `lukas-reineke/indent-blankline.nvim`
		-- See `:help ibl`
		main = 'ibl',
		opts = {
			indent = {
				char = "┊",
			},
			scope = {
				show_start = false,
				show_end = false,
			},
		},
	},

	-- "gc" to comment visual regions/lines
	{ 'numToStr/Comment.nvim', opts = {} },

	-- Fuzzy Finder (files, lsp, etc)
	{
		'nvim-telescope/telescope.nvim',
		branch = '0.1.x',
		dependencies = {
			'nvim-lua/plenary.nvim',
			-- Fuzzy Finder Algorithm which requires local dependencies to be built.
			-- Only load if `make` is available. Make sure you have the system
			-- requirements installed.
			{
				'nvim-telescope/telescope-fzf-native.nvim',
				build = 'make',
				cond = function()
					return vim.fn.executable 'make' == 1
				end,
			},
		},
	},

	{
		-- Highlight, edit, and navigate code
		'nvim-treesitter/nvim-treesitter',
		dependencies = {
			'nvim-treesitter/nvim-treesitter-textobjects',
		},
		build = ':TSUpdate',
	},


	-- { import = 'colors' },
	{ import = 'plugins' },
}, {})
