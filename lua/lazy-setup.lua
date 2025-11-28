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

vim.cmd.colorscheme 'chiaroscuro-modern'

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
			--vim.cmd.colorscheme 'tokyonight-night'
		end,
	},
	-- Colorschemes
	--'friskenstein/tokyonight.nvim',
	'friskenstein/lunar.nvim',
	'friskenstein/poimandres.nvim',
	'friskenstein/oxocarbon.nvim',
	'friskenstein/horizon.nvim',
	'friskenstein/palenightfall.nvim',
	'scottmckendry/cyberdream.nvim',
	'olimorris/onedarkpro.nvim',
	'friskenstein/focus.nvim',
	'projekt0n/github-nvim-theme',
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
					WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
					PERF = { icon = "󰓅 ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
					NOTE = { icon = " ", color = "info", alt = { "INFO" } },
					-- 󰂖
					TEST = { icon = "󰙨󰤑", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
					QUESTION = { icon = " ", color = "test", alt = { "CHECK", "RESEARCH", "INVESTIGATE" } },
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

-- LSP Plugins
  {
    -- `lazydev` configures Lua LSP for your Neovim config, runtime and plugins
    -- used for completion, annotations and signatures of Neovim apis
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {
      library = {
        -- Load luvit types when the `vim.uv` word is found
        { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
      },
    },
  },
  {
    -- Main LSP Configuration
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs and related tools to stdpath for Neovim
      -- Mason must be loaded before its dependents so we need to set it up here.
      -- NOTE: `opts = {}` is the same as calling `require('mason').setup({})`
      { 'mason-org/mason.nvim', opts = {} },
      'mason-org/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',

      -- Useful status updates for LSP.
      { 'j-hui/fidget.nvim', opts = {} },

      -- Allows extra capabilities provided by blink.cmp
      'saghen/blink.cmp',
    },
    config = function()
      -- Brief aside: **What is LSP?**
      --
      -- LSP is an initialism you've probably heard, but might not understand what it is.
      --
      -- LSP stands for Language Server Protocol. It's a protocol that helps editors
      -- and language tooling communicate in a standardized fashion.
      --
      -- In general, you have a "server" which is some tool built to understand a particular
      -- language (such as `gopls`, `lua_ls`, `rust_analyzer`, etc.). These Language Servers
      -- (sometimes called LSP servers, but that's kind of like ATM Machine) are standalone
      -- processes that communicate with some "client" - in this case, Neovim!
      --
      -- LSP provides Neovim with features like:
      --  - Go to definition
      --  - Find references
      --  - Autocompletion
      --  - Symbol Search
      --  - and more!
      --
      -- Thus, Language Servers are external tools that must be installed separately from
      -- Neovim. This is where `mason` and related plugins come into play.
      --
      -- If you're wondering about lsp vs treesitter, you can check out the wonderfully
      -- and elegantly composed help section, `:help lsp-vs-treesitter`

      --  This function gets run when an LSP attaches to a particular buffer.
      --    That is to say, every time a new file is opened that is associated with
      --    an lsp (for example, opening `main.rs` is associated with `rust_analyzer`) this
      --    function will be executed to configure the current buffer
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
        callback = function(event)
          -- NOTE: Remember that Lua is a real programming language, and as such it is possible
          -- to define small helper and utility functions so you don't have to repeat yourself.
          --
          -- In this case, we create a function that lets us more easily define mappings specific
          -- for LSP related items. It sets the mode, buffer and description for us each time.
          local map = function(keys, func, desc, mode)
            mode = mode or 'n'
            vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
          end

          -- Rename the variable under your cursor.
          --  Most Language Servers support renaming across files, etc.
          map('grn', vim.lsp.buf.rename, '[R]e[n]ame')

          -- Execute a code action, usually your cursor needs to be on top of an error
          -- or a suggestion from your LSP for this to activate.
          map('gra', vim.lsp.buf.code_action, '[G]oto Code [A]ction', { 'n', 'x' })

          -- Find references for the word under your cursor.
          map('grr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')

          -- Jump to the implementation of the word under your cursor.
          --  Useful when your language has ways of declaring types without an actual implementation.
          map('gri', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')

          -- Jump to the definition of the word under your cursor.
          --  This is where a variable was first declared, or where a function is defined, etc.
          --  To jump back, press <C-t>.
          map('grd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')

          -- WARN: This is not Goto Definition, this is Goto Declaration.
          --  For example, in C this would take you to the header.
          map('grD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

          -- Fuzzy find all the symbols in your current document.
          --  Symbols are things like variables, functions, types, etc.
          map('gO', require('telescope.builtin').lsp_document_symbols, 'Open Document Symbols')

          -- Fuzzy find all the symbols in your current workspace.
          --  Similar to document symbols, except searches over your entire project.
          map('gW', require('telescope.builtin').lsp_dynamic_workspace_symbols, 'Open Workspace Symbols')

          -- Jump to the type of the word under your cursor.
          --  Useful when you're not sure what type a variable is and you want to see
          --  the definition of its *type*, not where it was *defined*.
          map('grt', require('telescope.builtin').lsp_type_definitions, '[G]oto [T]ype Definition')

          -- This function resolves a difference between neovim nightly (version 0.11) and stable (version 0.10)
          ---@param client vim.lsp.Client
          ---@param method vim.lsp.protocol.Method
          ---@param bufnr? integer some lsp support methods only in specific files
          ---@return boolean
          local function client_supports_method(client, method, bufnr)
            if vim.fn.has 'nvim-0.11' == 1 then
              return client:supports_method(method, bufnr)
            else
              return client.supports_method(method, { bufnr = bufnr })
            end
          end

          -- The following two autocommands are used to highlight references of the
          -- word under your cursor when your cursor rests there for a little while.
          --    See `:help CursorHold` for information about when this is executed
          --
          -- When you move your cursor, the highlights will be cleared (the second autocommand).
          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf) then
            local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })
            vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.clear_references,
            })

            vim.api.nvim_create_autocmd('LspDetach', {
              group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
              callback = function(event2)
                vim.lsp.buf.clear_references()
                vim.api.nvim_clear_autocmds { group = 'kickstart-lsp-highlight', buffer = event2.buf }
              end,
            })
          end

          -- The following code creates a keymap to toggle inlay hints in your
          -- code, if the language server you are using supports them
          --
          -- This may be unwanted, since they displace some of your code
          -- if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf) then
          --   map('<leader>th', function()
          --     vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
          --   end, '[T]oggle Inlay [H]ints')
          -- end
        end,
      })

      -- Diagnostic Config
      -- See :help vim.diagnostic.Opts
      vim.diagnostic.config {
        severity_sort = true,
        float = { border = 'rounded', source = 'if_many' },
        underline = { severity = vim.diagnostic.severity.ERROR },
        signs = vim.g.have_nerd_font and {
          text = {
            [vim.diagnostic.severity.ERROR] = '󰅚 ',
            [vim.diagnostic.severity.WARN] = '󰀪 ',
            [vim.diagnostic.severity.INFO] = '󰋽 ',
            [vim.diagnostic.severity.HINT] = '󰌶 ',
          },
        } or {},
        virtual_text = {
          source = 'if_many',
          spacing = 2,
          format = function(diagnostic)
            local diagnostic_message = {
              [vim.diagnostic.severity.ERROR] = diagnostic.message,
              [vim.diagnostic.severity.WARN] = diagnostic.message,
              [vim.diagnostic.severity.INFO] = diagnostic.message,
              [vim.diagnostic.severity.HINT] = diagnostic.message,
            }
            return diagnostic_message[diagnostic.severity]
          end,
        },
      }

      -- LSP servers and clients are able to communicate to each other what features they support.
      --  By default, Neovim doesn't support everything that is in the LSP specification.
      --  When you add blink.cmp, luasnip, etc. Neovim now has *more* capabilities.
      --  So, we create new capabilities with blink.cmp, and then broadcast that to the servers.
      local capabilities = require('blink.cmp').get_lsp_capabilities()

      -- Enable the following language servers
      --  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
      --
      --  Add any additional override configuration in the following tables. Available keys are:
      --  - cmd (table): Override the default command used to start the server
      --  - filetypes (table): Override the default list of associated filetypes for the server
      --  - capabilities (table): Override fields in capabilities. Can be used to disable certain LSP features.
      --  - settings (table): Override the default settings passed when initializing the server.
      --        For example, to see the options for `lua_ls`, you could go to: https://luals.github.io/wiki/settings/
      local servers = {
        -- clangd = {},
        gopls = {},
        pyright = {},
        rust_analyzer = {},
        -- ... etc. See `:help lspconfig-all` for a list of all the pre-configured LSPs
        --
        -- Some languages (like typescript) have entire language plugins that can be useful:
        --    https://github.com/pmizio/typescript-tools.nvim
        --
        -- But for many setups, the LSP (`ts_ls`) will work just fine
        -- ts_ls = {},
        --

        lua_ls = {
          -- cmd = { ... },
          -- filetypes = { ... },
          -- capabilities = {},
          settings = {
            Lua = {
              completion = {
                callSnippet = 'Replace',
              },
              -- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
              -- diagnostics = { disable = { 'missing-fields' } },
            },
          },
        },
      }

      -- Ensure the servers and tools above are installed
      --
      -- To check the current status of installed tools and/or manually install
      -- other tools, you can run
      --    :Mason
      --
      -- You can press `g?` for help in this menu.
      --
      -- `mason` had to be setup earlier: to configure its options see the
      -- `dependencies` table for `nvim-lspconfig` above.
      --
      -- You can add other tools here that you want Mason to install
      -- for you, so that they are available from within Neovim.
      local ensure_installed = vim.tbl_keys(servers or {})
      vim.list_extend(ensure_installed, {
        'stylua', -- Used to format Lua code
      })
      require('mason-tool-installer').setup { ensure_installed = ensure_installed }

      require('mason-lspconfig').setup {
        ensure_installed = {}, -- explicitly set to an empty table (Kickstart populates installs via mason-tool-installer)
        automatic_installation = false,
        handlers = {
          function(server_name)
            local server = servers[server_name] or {}
            -- This handles overriding only values explicitly passed
            -- by the server configuration above. Useful when disabling
            -- certain features of an LSP (for example, turning off formatting for ts_ls)
            server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
            require('lspconfig')[server_name].setup(server)
          end,
        },
      }
    end,
  },


	{ -- Autocompletion
		'saghen/blink.cmp',
		event = 'VimEnter',
		version = '1.*',
		dependencies = {
			-- Snippet Engine
			{
				'L3MON4D3/LuaSnip',
				version = '2.*',
				build = (function()
					-- Build Step is needed for regex support in snippets.
					-- This step is not supported in many windows environments.
					-- Remove the below condition to re-enable on windows.
					if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
						return
					end
					return 'make install_jsregexp'
				end)(),
				dependencies = {
					-- `friendly-snippets` contains a variety of premade snippets.
					--    See the README about individual language/framework/plugin snippets:
					--    https://github.com/rafamadriz/friendly-snippets
					-- {
					--   'rafamadriz/friendly-snippets',
					--   config = function()
					--     require('luasnip.loaders.from_vscode').lazy_load()
					--   end,
					-- },
				},
				opts = {},
			},
			'folke/lazydev.nvim',
		},
		--- @module 'blink.cmp'
		--- @type blink.cmp.Config
		opts = {
			keymap = {
				-- 'default' (recommended) for mappings similar to built-in completions
				--   <c-y> to accept ([y]es) the completion.
				--    This will auto-import if your LSP supports it.
				--    This will expand snippets if the LSP sent a snippet.
				-- 'super-tab' for tab to accept
				-- 'enter' for enter to accept
				-- 'none' for no mappings
				--
				-- For an understanding of why the 'default' preset is recommended,
				-- you will need to read `:help ins-completion`
				--
				-- No, but seriously. Please read `:help ins-completion`, it is really good!
				--
				-- All presets have the following mappings:
				-- <tab>/<s-tab>: move to right/left of your snippet expansion
				-- <c-space>: Open menu or open docs if already open
				-- <c-n>/<c-p> or <up>/<down>: Select next/previous item
				-- <c-e>: Hide menu
				-- <c-k>: Toggle signature help
				--
				-- See :h blink-cmp-config-keymap for defining your own keymap
				preset = 'none',
				['<Tab>'] = {
					function(cmp)
						if cmp.is_visible() then return cmp.insert_next() end
					end,
					"fallback"
				},
				['<S-Tab>'] = {
					function(cmp)
						if cmp.is_visible() then return cmp.insert_prev() end
					end,
					"fallback"
				},
				-- For more advanced Luasnip keymaps (e.g. selecting choice nodes, expansion) see:
				--    https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps
			},
			appearance = {
				-- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
				-- Adjusts spacing to ensure icons are aligned
				nerd_font_variant = 'mono',
			},

			completion = {
				list = {
					selection = {
						preselect = false,
					},
				},
				-- By default, you may press `<c-space>` to show the documentation.
				-- Optionally, set `auto_show = true` to show the documentation after a delay.
				documentation = { auto_show = true, auto_show_delay_ms = 500 },
			},

			sources = {
				default = { 'lsp', 'path', 'snippets', 'lazydev' },
				providers = {
					lazydev = { module = 'lazydev.integrations.blink', score_offset = 100 },
				},
			},

			snippets = { preset = 'luasnip' },

			-- Blink.cmp includes an optional, recommended rust fuzzy matcher,
			-- which automatically downloads a prebuilt binary when enabled.
			--
			-- By default, we use the Lua implementation instead, but you may enable
			-- the rust implementation via `'prefer_rust_with_warning'`
			--
			-- See :h blink-cmp-config-fuzzy for more information
			fuzzy = { implementation = 'lua' },

			-- Shows a signature help window while you type arguments for a function
			signature = { enabled = true },
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
						"desert", "delek", "default", "darkblue", "blue", "vim", "sorbet", "wildcharm", "zaibatsu",
						"retrobox", "unokai" }
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

{ -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    main = 'nvim-treesitter.configs', -- Sets main module to use for opts
    -- [[ Configure Treesitter ]] See `:help nvim-treesitter`
    opts = {
      ensure_installed = { 'bash', 'c', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'markdown_inline', 'query', 'vim', 'vimdoc' },
      -- Autoinstall languages that are not installed
      auto_install = true,
      highlight = {
        enable = true,
        -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
        --  If you are experiencing weird indenting issues, add the language to
        --  the list of additional_vim_regex_highlighting and disabled languages for indent.
        additional_vim_regex_highlighting = { 'ruby' },
      },
      indent = { enable = true, disable = { 'ruby' } },
    },
    -- There are additional nvim-treesitter modules that you can use to interact
    -- with nvim-treesitter. You should go explore a few and see what interests you:
    --
    --    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
    --    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
    --    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
  },


	-- { import = 'colors' },
	{ import = 'plugins' },
}, {})
