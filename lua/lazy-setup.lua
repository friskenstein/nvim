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
		"friskenstein/witchcraft.nvim",
		opts = {
			transparent_background = true,
		},
		config = function(_, opts)
			require("witchcraft").setup(opts) -- calling setup is optional
			-- vim.cmd [[colorscheme witchcraft]]
		end,
	},
	{
		"friskenstein/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd.colorscheme 'tokyonight-night'
		end,
	},
	-- Colorschemes
	--'friskenstein/tokyonight.nvim',
	'friskenstein/lunar.nvim',
	'friskenstein/poimandres.nvim',
	'friskenstein/oxocarbon.nvim',
	'friskenstein/horizon.nvim',
	'friskenstein/palenightfall.nvim',
	'friskenstein/focus.nvim',
	'oxfist/night-owl.nvim',
	'EdenEast/nightfox.nvim',
	'rebelot/kanagawa.nvim',
	'navarasu/onedark.nvim',
	'maxmx03/fluoromachine.nvim',
	'dgox16/oldworld.nvim',
	'rose-pine/neovim',
	{
		"friskenstein/neovim-ayu",
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
		"friskenstein/catppuccin",
		config = function ()
			require("catppuccin").setup({
				transparent_background = false,
			})
		end
	},
	{ 'echasnovski/mini.icons', version = '*' },

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
			--vim.keymap.set("x", "gS", "<Plug>VgSurround") -- NOTE: gS instead of default S
			vim.keymap.set("x", "-", "<Plug>VSurround")
			vim.keymap.set("x", "+", "<Plug>VgSurround")
		end,
	},
	{
		'ggandor/leap.nvim',
		config = function()
			-- needs to load after vim-surround
			--require('leap').create_default_mappings()
			vim.keymap.set({'n', 'x', 'o'}, 's',  '<Plug>(leap-forward)')
			vim.keymap.set({'n', 'x', 'o'}, 'S',  '<Plug>(leap-backward)')
			vim.keymap.set({'n', 'x', 'o'}, 'gs',  '<Plug>(leap-from-window)')
			-- vim.keymap.set({'n', 'x', 'o'}, ']]', '<Plug>(leap-forward)')
			-- vim.keymap.set({'n', 'x', 'o'}, '[[', '<Plug>(leap-backward)')
			-- vim.keymap.set({'n', 'x', 'o'}, '[]', '<Plug>(leap-from-window)')
			-- vim.keymap.set({'n', 'x', 'o'}, '][', '<Plug>(leap-from-window)')
		end
	},

	{
		'rmagatti/goto-preview',
		opts = {
			default_mappings = true,
		}
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
					TODO = { icon = " ", color = "hint", alt = { "REFACTOR", "IMPLEMENT" } },
					-- 
					TAG = { icon = " ", color = "info", alt = { "BOOKMARK" }},
					SECTION = { icon = "󰚟 ", color = "info"},
					HACK = { icon = " ", color = "warning" },
					WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX", "CHECK", "INVESTIGATE" } },
					PERF = { icon = "󰓅 ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
					NOTE = { icon = " ", color = "info", alt = { "INFO" } },
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
			win = {
				border = "single",
			},
			icons = {
				breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
				separator = "", -- symbol used between a key and it's label
				group = " ", -- symbol prepended to a group
				mappings = false,
			},
			layout = {
				align = 'center',
			},
		},
		keys__ = {
			{ "<leader>C", group = "CSV" },
			{ "<leader>CC", "<cmd>%UnArrangeColumn|%ArrangeColumn!<cr>", desc = "Refresh" },
			{ "<leader>Ca", "<cmd>%ArrangeColumn!<cr>", desc = "Arrange" },
			{ "<leader>Cc", "<cmd>let b:csv_arrange_align='c*'|%ArrangeColumn!<cr>", desc = "Align Center" },
			{ "<leader>Cd", "<cmd>let b:csv_arrange_align='.*'|%ArrangeColumn!<cr>", desc = "Align Decimal" },
			{ "<leader>Cl", "<cmd>let b:csv_arrange_align='l*'|%ArrangeColumn!<cr>", desc = "Align Left" },
			{ "<leader>Cr", "<cmd>let b:csv_arrange_align='r*'|%ArrangeColumn!<cr>", desc = "Align Right" },
			{ "<leader>Cu", "<cmd>%UnArrangeColumn<cr>", desc = "Un-arrange" },
			{ "<leader>F", group = "Format" },
			{ "<leader>FF", "<cmd>!noglob npx prettier % --write<CR>", desc = "Prettier" },
			{ "<leader>FH", "<cmd>%!xxd<cr>", desc = "Filter to HEX" },
			{ "<leader>Fe", "<cmd>!noglob eslint_d --fix %<CR>", desc = "ESLint" },
			{ "<leader>Fh", "<cmd>%!xxd -r<cr>", desc = "HEX -> text" },
			{ "<leader>Fi", "<Esc>gg=G<CR>", desc = "Reindent buffer" },
			{ "<leader>a", group = "AI copilot" },
			{ "<leader>aA", "<cmd>CodeiumAuto<cr>", desc = "Auto" },
			{ "<leader>aM", "<cmd>CodeiumManual<cr>", desc = "Manual" },
			{ "<leader>aa", "<cmd>CodeiumToggle<cr>", desc = "Toggle" },
			{ "<leader>ad", "<cmd>CodeiumDisable<cr>", desc = "Disable" },
			{ "<leader>ae", "<cmd>CodeiumEnable<cr>", desc = "Enable" },
			{ "<leader>g", group = "Git" },
			{ "<leader>gB", "<cmd>Telescope git_branches<cr>", desc = " branches" },
			{ "<leader>gC", "<cmd>Telescope git_bcommits<cr>", desc = " commits (current file)" },
			{ "<leader>gc", "<cmd>Telescope git_commits<cr>", desc = " commits" },
			{ "<leader>gg", function()
				local Terminal = require("toggleterm.terminal").Terminal
				local lazygit = Terminal:new {
					cmd = "lazygit",
					hidden = true,
					direction = "float",
					float_opts = {
						border = "none",
						width = 100000,
						height = 100000,
					},
					on_open = function(_)
						vim.cmd "startinsert!"
					end,
					on_close = function(_) end,
					count = 99,
				}
				lazygit:toggle()
			end, desc = "Lazygit" },
			{ "<leader>gj", "<cmd>lua require 'gitsigns'.next_hunk({navigation_message = false})<cr>", desc = "Next Hunk" },
			{ "<leader>gk", "<cmd>lua require 'gitsigns'.prev_hunk({navigation_message = false})<cr>", desc = "Prev Hunk" },
			{ "<leader>go", "<cmd>Telescope git_status<cr>", desc = " Git status (N/A)" },
			{ "<leader>l", group = "LSP" },
			{ "<leader>lc", "<cmd>lua vim.lsp.codelens.run()<cr>", desc = "CodeLens Action" },
			{ "<leader>ld", "<cmd>Telescope diagnostics bufnr=0 theme=get_ivy<cr>", desc = "Buffer Diagnostics" },
			{ "<leader>le", "<cmd>Telescope quickfix<cr>", desc = "Telescope Quickfix" },
			{ "<leader>lf", "<cmd>lua vim.lsp.buf.format()<cr>", desc = "Format" },
			{ "<leader>lj", "<cmd>lua vim.diagnostic.goto_next()<cr>", desc = "Next Diagnostic ]d" },
			{ "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev()<cr>", desc = "Prev Diagnostic [d" },
			{ "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<cr>", desc = "Quickfix" },
			{ "<leader>lr", "<cmd>Telescope lsp_references<cr>", desc = "References [gr]" },
			{ "<leader>lu", "<cmd>LspRestart<cr>", desc = "Restart LSP" },
			{ "<leader>s", group = "Telescope [S]earch " },
			{ "<leader>sB", "<cmd>Telescope git_branches<cr>", desc = "Git branches" },
			{ "<leader>sC", "<cmd>Telescope commands<cr>", desc = "Commands" },
			{ "<leader>sH", "<cmd>Telescope help_tags<cr>", desc = "Help tags" },
			{ "<leader>sM", "<cmd>Telescope man_pages<cr>", desc = "Man pages" },
			{ "<leader>sR", "<cmd>Telescope registers<cr>", desc = "Registers" },
			{ "<leader>sb", "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find({ sorter = require('telescope.sorters').get_substr_matcher({})})<cr>", desc = "Grep current file" },
			{ "<leader>sc", function()
				local builtins = { "zellner", "torte", "slate", "shine", "ron", "quiet", "peachpuff",
					"pablo", "murphy", "lunaperche", "koehler", "industry", "evening", "elflord", "morning",
					"desert", "delek", "default", "darkblue", "blue", "vim", "sorbet", "wildcharm", "zaibatsu", "retrobox" }
				local target = vim.fn.getcompletion

				---@diagnostic disable-next-line: duplicate-set-field
				vim.fn.getcompletion = function()
					return vim.tbl_filter(function(color)
						return not vim.tbl_contains(builtins, color)
					end, target("", "color"))
				end

				-- require('telescope.builtin').colorscheme {enable_preview = true}
				vim.fn.getcompletion = target
			end, desc = "Colorschemes" },
			-- { "<leader>sd", require('telescope.builtin').diagnostics, desc = "Diagnostics" },
			{ "<leader>sf", "<cmd>Telescope find_files<cr>", desc = "Files" },
			{ "<leader>sg", "<cmd>LiveGrepGitRoot<cr>", desc = "Grep on Git Root" },
			{ "<leader>sh", "<cmd>Telescope highlights<cr>", desc = "Highlight groups" },
			{ "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Keymaps" },
			{ "<leader>sl", "<cmd>Telescope resume<cr>", desc = "Resume last search" },
			{ "<leader>sr", "<cmd>Telescope oldfiles<cr>", desc = "Recent files" },
			{ "<leader>ss", "<cmd>Telescope<cr>", desc = "Select Telescope" },
			{ "<leader>st", "<cmd>Telescope live_grep<cr>", desc = "Text Grep" },
			{ "<leader>sw", function ()
				--require('telescope.builtin').grep_string()
			end, desc = "Grep by current Word" },
			{ "<leader>t", group = "TODO & Terminal" },
			{ "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", desc = "Floating Terminal" },
			{ "<leader>th", "<cmd>ToggleTerm direction=horizontal<cr>", desc = "Horizontal Terminal" },
			{ "<leader>tl", "<cmd>TodoLocList<cr>", desc = "Todo LocationList" },
			{ "<leader>tq", "<cmd>TodoQuickFix<cr>", desc = "Todo QuickFix" },
			{ "<leader>tr", "<cmd>TodoTrouble<cr>", desc = "Todo Trouble" },
			{ "<leader>tt", "<cmd>TodoTelescope<cr>", desc = "Todo Telescope" },
			{ "<leader>u", group = "UI" },
			{ "<leader>ut", function ()
				if vim.g.transparent_bg_toggle then
					vim.g.transparent_bg_toggle = false
					print('Transparent BG OFF')
				else
					vim.g.transparent_bg_toggle = true
					print('Transparent BG ON')
				end
			end, desc = "Transparent BG" },
			{ "<leader>uW", function()
				if vim.o.listchars == "space:⋅,tab:› ,trail:,nbsp:+" then
					vim.o.listchars = "tab:  ,trail:,nbsp:+,lead:"
					print("Show leading / trailing space")
				else
					vim.o.listchars = "space:⋅,tab:› ,trail:,nbsp:+"
					print("Show all whitespace")
				end
			end, desc = "Whitespace Modes" },
			{ "<leader>uc", function() vim.o.cursorline = not vim.o.cursorline end, desc = "Cursorline" },
			{ "<leader>ue", "<cmd>vert topleft split<cr><cmd>vert res 30<cr><cmd>ene<cr><C-w>l", desc = "Pad left" },
			{ "<leader>ui", "<cmd>IBLToggle<cr>", desc = "Indent Lines" },
			{ "<leader>um", function ()
				if vim.g.minimap_global_toggle then
					vim.g.minimap_global_toggle = false
					require('mini.map').close()
				else
					vim.g.minimap_global_toggle = true
					---@diagnostic disable-next-line: inject-field
					vim.b.minimap_disable = false
					require('mini.map').open()
				end
			end, desc = "Minimap" },
			{ "<leader>us", function()
				vim.diagnostic.config({ signs = not vim.diagnostic.config().signs })
				print("Diagnostic signs: " .. (vim.diagnostic.config().signs and "on" or "off"))
			end, desc = "Diagnostic signs" },
			{ "<leader>uT", function ()
				if vim.g.transparent_floats_toggle then
					vim.g.transparent_floats_toggle = false
					print('Transparent floats OFF')
				else
					vim.g.transparent_floats_toggle = true
					print('Transparent floats ON')
				end
			end, desc = "Transparent Floats" },
			{ "<leader>uu", function()
				vim.diagnostic.config({ underline = not vim.diagnostic.config().underline })
				print("Diagnostic underline: " .. (vim.diagnostic.config().underline and "on" or "off"))
			end, desc = "Diagnostic underline" },
			{ "<leader>uv", function()
				vim.diagnostic.config({ virtual_text = not vim.diagnostic.config().virtual_text })
				print("Diagnostic virtual text: " .. (vim.diagnostic.config().virtual_text and "ON" or "OFF"))
			end, desc = "Diagnostic virtual text" },
			{ "<leader>uw", function() vim.o.list = not vim.o.list end, desc = "Whitespace On/Off" },
			{ "<leader>ux", "<cmd>set tabstop=2<cr><cmd>set shiftwidth=0<cr><cmd>set noet<cr>", desc = "tabstop 2" },
			{ "<leader>uy", "<cmd>set tabstop=4<cr><cmd>set shiftwidth=0<cr><cmd>set noet<cr>", desc = "tabstop 4" },
			{ "<leader>uz", "<cmd>set tabstop=8<cr><cmd>set shiftwidth=0<cr><cmd>set noet<cr>", desc = "tabstop 8" },

			-- [[ SHOW GROUP HINTS ]]
			-- document existing key chains
			{ "<leader>gh", group = "Hunk" },
			{ "<leader>gh_", hidden = true },
			{ "<leader>gt", group = "Toggle" },
			{ "<leader>gt_", hidden = true },
			{ "<leader>lw", group = "Workspace" },
			{ "<leader>lw_", hidden = true },

			-- register which-key VISUAL mode
			-- required for visual <leader>hs (hunk stage) to work
			{ "<leader>", group = "VISUAL <leader>", mode = { "v" }},
			{ "<leader>g", desc = "Git", mode = { "v" }},
			{ "<leader>gh", desc = "Hunk", mode = { "v" }},

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
				char = "│",
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
