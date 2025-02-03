if vim.g.neovide then
    -- Put anything you want to happen only in Neovide here
	vim.keymap.set('n', '<D-w>', ':q<CR>') -- Quit
	vim.keymap.set('n', '<D-s>', ':w<CR>') -- Save
	vim.keymap.set('v', '<D-c>', '"+y') -- Copy
	vim.keymap.set('n', '<D-v>', '"+P') -- Paste normal mode
	vim.keymap.set('v', '<D-v>', '"+P') -- Paste visual mode
	vim.keymap.set('c', '<D-v>', '<C-R>+') -- Paste command mode
	vim.keymap.set('i', '<D-v>', '<ESC>l"+Pli') -- Paste insert mode
	vim.g.neovide_scale_factor = 1.0
	local change_scale_factor = function(delta)
		vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
	end
	vim.keymap.set("n", "<D-=>", function()
		change_scale_factor(1.1)
	end)
	vim.keymap.set("n", "<D-->", function()
		change_scale_factor(1/1.1)
	end)

	vim.g.neovide_input_macos_option_key_is_meta = 'both'

	vim.g.neovide_cursor_smooth_blink = true
	vim.opt.guicursor = "n-v:block-blinkwait500-blinkon600-blinkoff400,i-c:ver25-blinkwait500-blinkon600-blinkoff400"
end

vim.keymap.set('v', 'i,', '<esc>T,vt,', {desc='inside commas'})
vim.keymap.set('v', 'a,', '<esc>F,vf,', {desc='around commas'})
vim.keymap.set('v', 'i.', '<esc>T.vt.', {desc='inside periods'})
vim.keymap.set('v', 'a.', '<esc>F.vf.', {desc='around periods'})

-- [[ Basic Keymaps ]]

vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Next diagnostic message' })
--vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
--vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- WhichKey keymaps
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = 'Find Recent' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = 'Buffers' })
vim.keymap.set('n', '<leader>p', '<cmd>Telescope projects<CR>', { desc = 'Projects' })
vim.keymap.set('n', '<leader>W', '<cmd>ASToggle<CR>', { desc = 'Autosave' })
vim.keymap.set('n', '<leader>/', function() require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown { previewer = false, }) end, { desc = 'Current buffer fzf' })
vim.keymap.set('n', '<leader>s/',  function() require('telescope.builtin').live_grep { grep_open_files = true, prompt_title = 'Grep Open Files', } end, { desc = 'Grep Open Files' })
vim.keymap.set('n', '<leader>;', '<cmd>Alpha<CR>', { desc = 'Dashboard' })
vim.keymap.set('n', '<leader>w', '<cmd>w<CR>', { desc = 'Save buffer' })
vim.keymap.set('n', '<leader>Q', '<cmd>confirm qa<CR>', { desc = 'Quit' })
vim.keymap.set('n', '<leader>q', '<cmd>confirm q<CR>', { desc = 'Close window' })
vim.keymap.set('n', '<leader>c', '<cmd>bp<bar>bd#<CR>', { desc = 'Close buffer' })
vim.keymap.set('n', '<leader>z', '<cmd>ZenMode<CR>', { desc = 'ZenMode' })
vim.keymap.set('n', '<leader>e', '<cmd>NvimTreeToggle<CR>', { desc = 'Explorer' })
vim.keymap.set('n', '<leader>f', function()
	local ok = pcall(require('telescope.builtin').git_files, {})
	if not ok then
		require('telescope.builtin').find_files()
	end
end, { desc = 'Find File' })
--   ["/"] = { "<Plug>(comment_toggle_linewise_current)", "Comment toggle current line" },
--   ["h"] = { "<cmd>nohlsearch<CR>", "No Highlight" },


require("which-key").add({


	{ '<leader>s', group = 'Telescope [S]earch ' },

	{ "<leader>sb", "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find({ sorter = require('telescope.sorters').get_substr_matcher({})})<cr>", desc = "Grep current file" },
	{ "<leader>sB", "<cmd>Telescope git_branches<cr>", desc = "Git branches" },
	{ "<leader>sc", function()
			local builtins = { "zellner", "torte", "slate", "shine", "ron", "quiet", "peachpuff", "habamax",
				"pablo", "murphy", "lunaperche", "koehler", "industry", "evening", "elflord", "morning",
				"desert", "delek", "default", "darkblue", "blue", "vim", "sorbet", "wildcharm", "zaibatsu", "retrobox" }
			local target = vim.fn.getcompletion

			---@diagnostic disable-next-line: duplicate-set-field
			vim.fn.getcompletion = function()
				return vim.tbl_filter(function(color)
					return not vim.tbl_contains(builtins, color)
				end, target("", "color"))
			end

			-- require("lazyvim.util").telescope("colorscheme", { enable_preview = true })()
			require('telescope.builtin').colorscheme {enable_preview = true}
			vim.fn.getcompletion = target
		end, desc = "Colorschemes" },

-- 	s = {
-- 		name = "Telescope [S]earch ",
-- 		b = { "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find({ sorter = require('telescope.sorters').get_substr_matcher({})})<cr>", "Grep current file" },
-- 		B = { "<cmd>Telescope git_branches<cr>", "Git branches" },
-- 		c = { function()
-- 			local builtins = { "zellner", "torte", "slate", "shine", "ron", "quiet", "peachpuff", "habamax",
-- 				"pablo", "murphy", "lunaperche", "koehler", "industry", "evening", "elflord", "morning",
-- 				"desert", "delek", "default", "darkblue", "blue", "vim", "sorbet", "wildcharm", "zaibatsu", "retrobox" }
-- 			local target = vim.fn.getcompletion
--
-- 			---@diagnostic disable-next-line: duplicate-set-field
-- 			vim.fn.getcompletion = function()
-- 				return vim.tbl_filter(function(color)
-- 					return not vim.tbl_contains(builtins, color)
-- 				end, target("", "color"))
-- 			end
--
-- 			-- require("lazyvim.util").telescope("colorscheme", { enable_preview = true })()
-- 			require('telescope.builtin').colorscheme {enable_preview = true}
-- 			vim.fn.getcompletion = target
-- 		end, "Colorschemes" },
-- 		f = { "<cmd>Telescope find_files<cr>", "Files" },
-- 		H = { "<cmd>Telescope help_tags<cr>", "Help tags" },
-- 		h = { "<cmd>Telescope highlights<cr>", "Highlight groups" },
-- 		M = { "<cmd>Telescope man_pages<cr>", "Man pages" },
-- 		-- n = { "<cmd>Telescope notify<cr>", "Notifications" },
-- 		r = { "<cmd>Telescope oldfiles<cr>", "Recent files" },
-- 		R = { "<cmd>Telescope registers<cr>", "Registers" },
-- 		t = { "<cmd>Telescope live_grep<cr>", "Text Grep" },
-- 		g = { '<cmd>LiveGrepGitRoot<cr>', 'Grep on Git Root' },
-- 		w = { require('telescope.builtin').grep_string, 'Grep by current Word' },
-- 		d = { require('telescope.builtin').diagnostics, 'Diagnostics' },
-- 		k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
-- 		C = { "<cmd>Telescope commands<cr>", "Commands" },
-- 		l = { "<cmd>Telescope resume<cr>", "Resume last search" },
-- 		s = { "<cmd>Telescope<cr>", "Select Telescope" },
-- 	},
-- 	a = { "<cmd>AerialToggle<cr>", "Aerial" },
-- 	A = {
-- 		name = "AI copilot",
-- 		A = { "<cmd>CodeiumAuto<cr>", "Auto" },
-- 		M = { "<cmd>CodeiumManual<cr>", "Manual" },
-- 		-- TODO: needs to be insert mode keymapping
-- 		--a = { function() vim.api.nvim_call_function("codeium#Complete", {}) end, "Suggest" },
-- 		e = { "<cmd>CodeiumEnable<cr>", "Enable" },
-- 		d = { "<cmd>CodeiumDisable<cr>", "Disable" },
-- 		a = { "<cmd>CodeiumToggle<cr>", "Toggle" },
-- 	},
	{"<leader>T", ":tabe<cr>", desc="New Tab" },
-- 	t = {
-- 		name = "TODO & Terminal",
-- 		f = { "<cmd>ToggleTerm direction=float<cr>", "Floating Terminal" },
-- 		h = { "<cmd>ToggleTerm direction=horizontal<cr>", "Horizontal Terminal" },
-- 		t = { "<cmd>TodoTelescope<cr>", "Todo Telescope" },
-- 		l = { "<cmd>TodoLocList<cr>", "Todo LocationList" },
-- 		q = { "<cmd>TodoQuickFix<cr>", "Todo QuickFix" },
-- 		r = { "<cmd>TodoTrouble<cr>", "Todo Trouble" },
-- 	},
	{"<leader>C", group="CSV"},
		{"<leader>CC", "<cmd>%UnArrangeColumn|%ArrangeColumn!<cr>", desc="Refresh" },
		{"<leader>Ca", "<cmd>%ArrangeColumn!<cr>", desc="Arrange" },
		{"<leader>Cu", "<cmd>%UnArrangeColumn<cr>", desc="Un-arrange" },
		{"<leader>Cl", "<cmd>let b:csv_arrange_align='l*'|%ArrangeColumn!<cr>", desc="Align Left" },
		{"<leader>Cr", "<cmd>let b:csv_arrange_align='r*'|%ArrangeColumn!<cr>", desc="Align Right" },
		{"<leader>Cc", "<cmd>let b:csv_arrange_align='c*'|%ArrangeColumn!<cr>", desc="Align Center" },
		{"<leader>Cd", "<cmd>let b:csv_arrange_align='.*'|%ArrangeColumn!<cr>", desc="Align Decimal" },
-- 	},
-- 	F = {
-- 		name = "Format",
-- 		i = { "<Esc>gg=G<CR>", "Reindent buffer" },
-- 		F = { "<cmd>!noglob npx prettier % --write<CR>", "Prettier" },
-- 		e = { "<cmd>!noglob eslint_d --fix %<CR>", "ESLint" },
-- 		H = { "<cmd>%!xxd<cr>", "Filter to HEX" },
-- 		h = { "<cmd>%!xxd -r<cr>", "HEX -> text" },
-- 	},
-- 	g = {
-- 		name = 'Git',
--
-- 		--INFO: already <leader>f
-- 		--f = { require 'telescope.builtin'.git_files , 'Search Git Files' },
--
-- 		--INFO: see ./plugins/gitsigns.lua for more
-- 		j = { "<cmd>lua require 'gitsigns'.next_hunk({navigation_message = false})<cr>", "Next Hunk" },
-- 		k = { "<cmd>lua require 'gitsigns'.prev_hunk({navigation_message = false})<cr>", "Prev Hunk" },
--
-- 		--TODO: HEAD or index or ~?
-- 		--d = { "<cmd>Gitsigns diffthis HEAD<cr>", "Git Diff", },
--
-- 		g = {
-- 			function()
-- 				local Terminal = require("toggleterm.terminal").Terminal
-- 				local lazygit = Terminal:new {
-- 					cmd = "lazygit",
-- 					hidden = true,
-- 					direction = "float",
-- 					float_opts = {
-- 						border = "none",
-- 						width = vim.o.columns,
-- 						height = vim.o.lines,
-- 					},
-- 					on_open = function(_)
-- 						vim.cmd "startinsert!"
-- 					end,
-- 					on_close = function(_) end,
-- 					count = 99,
-- 				}
-- 				lazygit:toggle()
-- 			end
-- 			, "Lazygit" },
--
-- 		o = { "<cmd>Telescope git_status<cr>", " Git status (N/A)" },
-- 		B = { "<cmd>Telescope git_branches<cr>", " branches" },
-- 		c = { "<cmd>Telescope git_commits<cr>", " commits" },
-- 		C = { "<cmd>Telescope git_bcommits<cr>", " commits (current file)", },
-- 	},

	{"<leader>u", group="UI"},

-- 	u = {
-- 		name = "UI",
	{"<leader>ux", "<cmd>set tabstop=2<cr><cmd>set shiftwidth=0<cr><cmd>set noet<cr>", desc="Tabstop 2"},
	{"<leader>uy", "<cmd>set tabstop=4<cr><cmd>set shiftwidth=0<cr><cmd>set noet<cr>", desc="Tabstop 4"},
	{"<leader>uz", "<cmd>set tabstop=8<cr><cmd>set shiftwidth=0<cr><cmd>set noet<cr>", desc="Tabstop 8"},
	{"<leader>ui", "<cmd>IBLToggle<cr>", desc="Indent Lines"},
	{"<leader>uc", function() vim.o.cursorline = not vim.o.cursorline end, desc="Cursorline"},
	{"<leader>ue", "<cmd>vert topleft split<cr><cmd>vert res 30<cr><cmd>ene<cr><C-w>l", desc="Pad left" },
-- 		v = { function()
-- 			vim.diagnostic.config({ virtual_text = not vim.diagnostic.config().virtual_text })
-- 			print("Diagnostic virtual text: " .. (vim.diagnostic.config().virtual_text and "ON" or "OFF"))
-- 			end, "Diagnostic virtual text" },
-- 		s = { function()
-- 			vim.diagnostic.config({ signs = not vim.diagnostic.config().signs })
-- 			print("Diagnostic signs: " .. (vim.diagnostic.config().signs and "on" or "off"))
-- 			end, "Diagnostic signs" },
-- 		u = { function()
-- 			vim.diagnostic.config({ underline = not vim.diagnostic.config().underline })
-- 			print("Diagnostic underline: " .. (vim.diagnostic.config().underline and "on" or "off"))
-- 			end, "Diagnostic underline" },
-- 		w = { function() vim.o.list = not vim.o.list end, "Whitespace On/Off" },
-- 		W = { function()
-- 			if vim.o.listchars == "space:⋅,tab:› ,trail:,nbsp:+" then
-- 				vim.o.listchars = "tab:  ,trail:,nbsp:+,lead:"
-- 				print("Show leading / trailing space")
-- 			else
-- 				vim.o.listchars = "space:⋅,tab:› ,trail:,nbsp:+"
-- 				print("Show all whitespace")
-- 			end
-- 		end, "Whitespace Modes" },
-- 		m = { function ()
-- 			if vim.g.minimap_global_toggle then
-- 				vim.g.minimap_global_toggle = false
-- 				require('mini.map').close()
-- 			else
-- 				vim.g.minimap_global_toggle = true
-- 				---@diagnostic disable-next-line: inject-field
-- 				vim.b.minimap_disable = false
-- 				require('mini.map').open()
-- 			end
-- 		end, 'Minimap' },
-- 		b = { function ()
-- 			if vim.opt.background:get() == 'dark' then
-- 				vim.opt.background = 'light'
-- 				print('Light background')
-- 			else
-- 				vim.opt.background = 'dark'
-- 				print('Dark background')
-- 			end
-- 		end, 'Light / Dark Switch' },
-- 		t = { function ()
-- 			if vim.g.transparent_bg_toggle then
-- 				vim.g.transparent_bg_toggle = false
-- 				print('Transparent BG OFF')
-- 			else
-- 				vim.g.transparent_bg_toggle = true
-- 				print('Transparent BG ON')
-- 			end
-- 		end, 'Transparent BG' },
-- 		T = { function ()
-- 			if vim.g.transparent_floats_toggle then
-- 				vim.g.transparent_floats_toggle = false
-- 				print('Transparent floats OFF')
-- 			else
-- 				vim.g.transparent_floats_toggle = true
-- 				print('Transparent floats ON')
-- 			end
-- 		end, 'Transparent Floats' },
-- 	},
-- 	l = {
-- 		name = "LSP",
-- 		-- INFO: more in ./lsp-setup.lua
-- 		d = { "<cmd>Telescope diagnostics bufnr=0 theme=get_ivy<cr>", "Buffer Diagnostics" },
-- 		f = { "<cmd>lua vim.lsp.buf.format()<cr>", "Format" },
-- 		j = { "<cmd>lua vim.diagnostic.goto_next()<cr>", "Next Diagnostic ]d", },
-- 		k = { "<cmd>lua vim.diagnostic.goto_prev()<cr>", "Prev Diagnostic [d", },
-- 		c = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
-- 		q = { "<cmd>lua vim.diagnostic.setloclist()<cr>", "Quickfix" },
-- 		r = { "<cmd>Telescope lsp_references<cr>", "References [gr]" },
-- 		u = { "<cmd>LspRestart<cr>", "Restart LSP" },
-- 		e = { "<cmd>Telescope quickfix<cr>", "Telescope Quickfix" },
-- 	},
-- 	-- T = {
-- 	-- 	name = 'lsp config help',
-- 	-- 	i = { "<cmd>LspInfo<cr>", "Info" },
-- 	-- 	I = { "<cmd>Mason<cr>", "Mason Info" },
-- 	-- },
-- }, { prefix = '<leader>' })





	-- [[ SHOW GROUP HINTS ]]
	-- document existing key chains
	{ '<leader>gh', group = 'Hunk' },
	{ '<leader>gt', group = 'Toggle' },
	{ '<leader>lw', group = 'Workspace' },
	-- register which-key VISUAL mode
	-- required for visual <leader>hs (hunk stage) to work
	{ '<leader>', group = 'VISUAL <leader>', mode = 'v' },
	{ '<leader>g', group = 'Git', mode = 'v' },
	{ '<leader>gh', group = 'Hunk', mode = 'v' },
})


vim.keymap.set('i', '<C-a>', '<Esc>ggVG', { silent = true })

-- [[ My LunarVim ]]
vim.keymap.set('n', '<C-s>', '<cmd>w<cr>', { silent = true })
vim.keymap.set('i', '<C-s>', '<Esc><cmd>w<cr>', { silent = true })

vim.keymap.set('n', '<S-l>', '<cmd>bnext<cr>', { silent = true })
vim.keymap.set('n', '<S-h>', '<cmd>bprevious<cr>', { silent = true })


vim.keymap.set('n', "<A-Down>", "<cmd>m .+1<CR>==")
vim.keymap.set('n', "<A-Up>", "<cmd>m .-2<CR>==")
vim.keymap.set('i', "<A-Down>", "<Esc><cmd>m .+1<CR>==gi")
vim.keymap.set('i', "<A-Up>", "<Esc><cmd>m .-2<CR>==gi")
vim.keymap.set('v', "<A-Down>", ":m '>+1<CR>gv-gv", { silent = true })
vim.keymap.set('v', "<A-Up>", ":m '<-2<CR>gv-gv", { silent = true })
vim.keymap.set('n', "<S-Down>", "<S-v><Down>")
vim.keymap.set('n', "<S-Up>", "<S-v><Up>")
vim.keymap.set('i', "<S-Down>", "<Esc><S-v><Down>")
vim.keymap.set('i', "<S-Up>", "<Esc><S-v><Up>")
vim.keymap.set('v', "<S-Down>", "<Down>")
vim.keymap.set('v', "<S-Up>", "<Up>")
vim.keymap.set('n', "<S-Left>", "v<Left>")
vim.keymap.set('n', "<S-Right>", "v<Right>")
vim.keymap.set('i', "<S-Left>", "<Esc>v<Left>")
vim.keymap.set('i', "<S-Right>", "<Esc>v<Right>")
vim.keymap.set('v', "<S-Left>", "<Left>")
vim.keymap.set('v', "<S-Right>", "<Right>")

vim.keymap.set('n', "<Enter>", "o<Esc>")
vim.keymap.set('n', "<S-Enter>", "<S-o><Esc>")

-- Tab indenting
vim.keymap.set('v', "<Tab>", ">gv")
vim.keymap.set('v', "<S-Tab>", "<gv")
-- I don't want this - overrides C-i / Tab - I can just move to visual line first or use >>
-- vim.keymap.set('n', "<Tab>", ">>")
-- vim.keymap.set('n', "<S-Tab>", "<<")

-- Better vim style indenting
vim.keymap.set('v', ">", ">gv")
vim.keymap.set('v', "<", "<gv")


-- Window movement
vim.keymap.set('n', "<C-h>", "<C-w>h")
vim.keymap.set('n', "<C-j>", "<C-w>j")
vim.keymap.set('n', "<C-k>", "<C-w>k")
vim.keymap.set('n', "<C-l>", "<C-w>l")

-- Resize with arrows
vim.keymap.set('n', "<A-k>", "<cmd>resize -2<CR>", {silent = true})
vim.keymap.set('n', "<A-j>", "<cmd>resize +2<CR>", {silent = true})
vim.keymap.set('n', "<A-h>", "<cmd>vertical resize -2<CR>", {silent = true})
vim.keymap.set('n', "<A-l>", "<cmd>vertical resize +2<CR>", {silent = true})
vim.keymap.set("t", "<A-k>", "<cmd>resize -2<CR>", {silent = true})
vim.keymap.set("t", "<A-j>", "<cmd>resize +2<CR>", {silent = true})
vim.keymap.set("t", "<A-h>", "<cmd>vertical resize -2<CR>", {silent = true})
vim.keymap.set("t", "<A-l>", "<cmd>vertical resize +2<CR>", {silent = true})

-- Different paste behaviour
-- lvim.keys.normal_mode["p"] = [["0p]]
-- lvim.keys.normal_mode["P"] = [["0P]]
-- lvim.keys.visual_mode["p"] = [["0p]]
-- lvim.keys.visual_mode["P"] = [["0P]]



-- unmap a default keymapping
-- vim.keymap.del("n", "<C-Up>")

-- override a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = "<cmd>q<cr>" -- or vim.keymap.set("n", "<C-q>", "<cmd>q<cr>" )


-- [[ LVIM DEFAULTS ]]
--     normal_mode = {
--       ["K"] = { "<cmd>lua vim.lsp.buf.hover()<cr>", "Show hover" },
--       ["gd"] = { "<cmd>lua vim.lsp.buf.definition()<cr>", "Goto definition" },
--       ["gD"] = { "<cmd>lua vim.lsp.buf.declaration()<cr>", "Goto Declaration" },
--       ["gr"] = { "<cmd>lua vim.lsp.buf.references()<cr>", "Goto references" },
--       ["gI"] = { "<cmd>lua vim.lsp.buf.implementation()<cr>", "Goto Implementation" },
--       ["gs"] = { "<cmd>lua vim.lsp.buf.signature_help()<cr>", "show signature help" },
--       -- almost all above are implemented but add this and scrap leader-e
--       ["gl"] = {
--         function()
--           local float = vim.diagnostic.config().float
--
--           if float then
--             local config = type(float) == "table" and float or {}
--             config.scope = "line"
--
--             vim.diagnostic.open_float(config)
--           end
--         end,
--         "Show line diagnostics",
--       },
vim.keymap.set('n', 'gl', vim.diagnostic.open_float, { desc = 'Show line diagnostics' })
--     },
--
-- local defaults = {
--   insert_mode = {
--     -- navigation
--     ["<A-Up>"] = "<C-\\><C-N><C-w>k",
--     ["<A-Down>"] = "<C-\\><C-N><C-w>j",
--     ["<A-Left>"] = "<C-\\><C-N><C-w>h",
--     ["<A-Right>"] = "<C-\\><C-N><C-w>l",
--   },
--
--   normal_mode = {
--
--     -- QuickFix
--     ["]q"] = ":cnext<CR>",
--     ["[q"] = ":cprev<CR>",
--     ["<C-q>"] = ":call QuickFixToggle()<CR>",
--   },
--
--
--
--   command_mode = {
--     -- navigate tab completion with <c-j> and <c-k>
--     -- runs conditionally
--     ["<C-j>"] = { 'pumvisible() ? "\\<C-n>" : "\\<C-j>"', { expr = true, noremap = true } },
--     ["<C-k>"] = { 'pumvisible() ? "\\<C-p>" : "\\<C-k>"', { expr = true, noremap = true } },
--   },
-- }
--
-- if vim.fn.has "mac" == 1 then
--   defaults.normal_mode["<A-Up>"] = defaults.normal_mode["<C-Up>"]
--   defaults.normal_mode["<A-Down>"] = defaults.normal_mode["<C-Down>"]
--   defaults.normal_mode["<A-Left>"] = defaults.normal_mode["<C-Left>"]
--   defaults.normal_mode["<A-Right>"] = defaults.normal_mode["<C-Right>"]
--   Log:debug "Activated mac keymappings"
-- end
