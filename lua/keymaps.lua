-- [[ Basic Keymaps ]]

vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
-- vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
-- vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
--vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
--vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- Telescope keymaps
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = 'Buffers' })
vim.keymap.set('n', '<leader>p', ':Telescope projects<CR>', { desc = 'Projects' })
vim.keymap.set('n', '<leader>W', ':ASToggle<CR>', { desc = 'Autosave' })
vim.keymap.set('n', '<leader>/', function() require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown { previewer = false, }) end, { desc = 'Current buffer fuzzy find' })
vim.keymap.set('n', '<leader>s/',  function() require('telescope.builtin').live_grep { grep_open_files = true, prompt_title = 'Grep Open Files', } end, { desc = 'Grep Open Files' })

require('which-key').register({
  s = {
    name = "Telescope Search ",
    b = { ":lua require('telescope.builtin').current_buffer_fuzzy_find({ sorter = require('telescope.sorters').get_substr_matcher({})})<cr>", "Grep current file" },
    B = { "<cmd>Telescope git_branches<cr>", "Git branches" },
    c = { "<cmd>lua require('telescope.builtin').colorscheme({enable_preview = true})<cr>", "Colorschemes", },
    f = { "<cmd>Telescope find_files<cr>", "Files" },
    h = { "<cmd>Telescope help_tags<cr>", "Help tags" },
    H = { "<cmd>Telescope highlights<cr>", "Highlight groups" },
    M = { "<cmd>Telescope man_pages<cr>", "Man pages" },
    n = { "<cmd>Telescope notify<cr>", "Notifications" },
    r = { "<cmd>Telescope oldfiles<cr>", "Recent files" },
    R = { "<cmd>Telescope registers<cr>", "Registers" },
    t = { "<cmd>Telescope live_grep<cr>", "Text Grep" },
    g = { ':LiveGrepGitRoot<cr>', 'Grep on Git Root' },
    w = { require('telescope.builtin').grep_string, 'Grep by current Word' },
    d = { require('telescope.builtin').diagnostics, 'Diagnostics' },
    k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
    C = { "<cmd>Telescope commands<cr>", "Commands" },
    l = { "<cmd>Telescope resume<cr>", "Resume last search" },
    s = { "<cmd>Telescope<cr>", "Select Telescope" },
  },
  T = {
    name = "TODO & Terminal",
    f = { "<cmd>ToggleTerm direction=float<cr>", "Floating Terminal" },
    h = { "<cmd>ToggleTerm direction=horizontal<cr>", "Horizontal Terminal" },
    t = { "<cmd>TodoTelescope<cr>", "Todo Telescope" },
    l = { "<cmd>TodoLocList<cr>", "Todo LocationList" },
    q = { "<cmd>TodoQuickFix<cr>", "Todo QuickFix" },
    r = { "<cmd>TodoTrouble<cr>", "Todo Trouble" },
  },
  C = {
    name = "CSV",
    C = { ":%UnArrangeColumn|%ArrangeColumn!<cr>", "Refresh" },
    a = { ":%ArrangeColumn!<cr>", "Arrange" },
    u = { ":%UnArrangeColumn<cr>", "Un-arrange" },
    l = { ":let b:csv_arrange_align='l*'|%ArrangeColumn!<cr>", "Align Left" },
    r = { ":let b:csv_arrange_align='r*'|%ArrangeColumn!<cr>", "Align Right" },
    c = { ":let b:csv_arrange_align='c*'|%ArrangeColumn!<cr>", "Align Center" },
    d = { ":let b:csv_arrange_align='.*'|%ArrangeColumn!<cr>", "Align Decimal" },
  },
  F = {
    name = "Format",
    F = { "<cmd>!npx prettier % --write<CR>", "Prettier" },
    e = { "<cmd>!eslint_d --fix %<CR>", "EsLint" },
    H = { ":%!xxd<cr>", "Filter to HEX" },
    h = { ":%!xxd -r<cr>", "HEX -> text" },
  },
  g = {
    name = 'Git',
    -- TODO: fix the cwd
    f = { require 'telescope.builtin'.git_files , 'Search Git Files' },
    g = { "<cmd>lua require 'lvim.core.terminal'.lazygit_toggle()<cr>", "Lazygit" },
    j = { "<cmd>lua require 'gitsigns'.next_hunk({navigation_message = false})<cr>", "Next Hunk" },
    k = { "<cmd>lua require 'gitsigns'.prev_hunk({navigation_message = false})<cr>", "Prev Hunk" },
    l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
    p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
    r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
    R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
    s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
    u = { "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", "Undo Stage Hunk", },
    o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
    b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
    c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
    C = { "<cmd>Telescope git_bcommits<cr>", "Checkout commit(for current file)", },
    d = { "<cmd>Gitsigns diffthis HEAD<cr>", "Git Diff", },
  },
  u = {
    name = "UI Elements",
    x = { ":set tabstop=2<cr>", "tabstop 2"},  --:set shiftwidth=2<cr>
    y = { ":set tabstop=4<cr>", "tabstop 4"},  --  :set shiftwidth=4<cr>
    z = { ":set tabstop=8<cr>", "tabstop 8"},    -- :set shiftwidth=8<cr>
    i = { "<cmd>IndentBlanklineToggle<cr>", "Indent Lines" },
    c = { function() vim.o.cursorline = false end, "Cursorline off" },
    C = { function() vim.o.cursorline = true end, "Cursorline on" },

    v = { function() vim.diagnostic.config({ virtual_text = false }) end, "Diagnostics virtual text off" },
    V = { function() vim.diagnostic.config({ virtual_text = true }) end, "Diagnostics virtual text on" },
    s = { function() vim.diagnostic.config({ signs = false }) end, "Diagnostics signs off" },
    S = { function() vim.diagnostic.config({ signs = true }) end, "Diagnostics signs on" },
    u = { function() vim.diagnostic.config({ underline = false }) end, "Diagnostics underline off" },
    U = { function() vim.diagnostic.config({ underline = true }) end, "Diagnostics underline on" },

    w = { function() vim.opt.list = false end, "Whitespace off" },
    W = { function() vim.opt.list = true end, "Whitespace on" },
    m = { function ()
        if vim.g.minimap_global_toggle then
          vim.g.minimap_global_toggle = false
          require('mini.map').close()
        else
          vim.g.minimap_global_toggle = true
          vim.b.minimap_disable = false
          require('mini.map').open()
        end
      end, 'Minimap' },
    t = { function ()
      vim.cmd("hi @text.todo guibg=NONE")
      vim.cmd("hi @text.note guibg=NONE")
      vim.cmd("hi @text.warning guibg=NONE")
      vim.cmd("hi @text.danger guibg=NONE")
    end, "Clear Treesitter TODO hi"}
  },
  l = {
    name = "LSP",
    a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
    d = { "<cmd>Telescope diagnostics bufnr=0 theme=get_ivy<cr>", "Buffer Diagnostics" },
    --w = { "<cmd>Telescope diagnostics<cr>", "Workspace Diagnostics 🔭" },
    W = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace Diagnostics 🚦" },
    f = { "<cmd>lua require('lvim.lsp.utils').format()<cr>", "Format" },
    i = { "<cmd>LspInfo<cr>", "Info" },
    I = { "<cmd>Mason<cr>", "Mason Info" },
    j = { "<cmd>lua vim.diagnostic.goto_next()<cr>", "Next Diagnostic", },
    k = { "<cmd>lua vim.diagnostic.goto_prev()<cr>", "Prev Diagnostic", },
    l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
    q = { "<cmd>lua vim.diagnostic.setloclist()<cr>", "Quickfix" },
    --r = { "<cmd>Telescope lsp_references<cr>", "References" },
    --R = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
    --s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
    S = { "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "Workspace Symbols", },
    u = { "<cmd>LspRestart<cr>", "Restart LSP" },
    e = { "<cmd>Telescope quickfix<cr>", "Telescope Quickfix" },
  }

}, { prefix = '<leader>' })


-- [[ SHOW GROUP HINTS ]]
-- document existing key chains
require('which-key').register {
  ['<leader>h'] = { name = 'Git Hunk', _ = 'which_key_ignore' },
}
-- register which-key VISUAL mode
-- required for visual <leader>hs (hunk stage) to work
require('which-key').register({
  ['<leader>'] = { name = 'VISUAL <leader>' },
  ['<leader>h'] = { 'Git [H]unk' },
}, { mode = 'v' })



-- [[ My LVIM which-key ]]
vim.keymap.set('n', '<leader>;', '<cmd>Alpha<CR>', { desc = 'Dashboard' })
vim.keymap.set('n', '<leader>w', '<cmd>w<CR>', { desc = 'Save' })
vim.keymap.set('n', '<leader>q', '<cmd>confirm q<CR>', { desc = 'Quit' })
-- TODO: closes windows
vim.keymap.set('n', '<leader>c', '<cmd>bp<bar>bd#<CR>', { desc = 'Close buffer' })
vim.keymap.set('n', '<leader>z', '<cmd>ZenMode<CR>', { desc = 'ZenMode' })
vim.keymap.set('n', '<leader>f', function()
  local ok = pcall(require('telescope.builtin').git_files, {})
  if not ok then
    require('telescope.builtin').find_files()
  end
end, { desc = 'Find File' })
--   ["/"] = { "<Plug>(comment_toggle_linewise_current)", "Comment toggle current line" },
--   ["h"] = { "<cmd>nohlsearch<CR>", "No Highlight" },
--   ["e"] = { "<cmd>NvimTreeToggle<CR>", "Explorer" },

-- [[ My LunarVim ]]
vim.keymap.set('n', '<C-s>', ':w<cr>')
vim.keymap.set('i', '<C-s>', '<Esc>:w<cr>')

vim.keymap.set('n', '<S-l>', ':bnext<cr>')
vim.keymap.set('n', '<S-h>', ':bprevious<cr>')


vim.keymap.set('n', "<A-Down>", ":m .+1<CR>==")
vim.keymap.set('n', "<A-Up>", ":m .-2<CR>==")
vim.keymap.set('i', "<A-Down>", "<Esc>:m .+1<CR>==gi")
vim.keymap.set('i', "<A-Up>", "<Esc>:m .-2<CR>==gi")
vim.keymap.set('v', "<A-Down>", ":m '>+1<CR>gv-gv")
vim.keymap.set('v', "<A-Up>", ":m '<-2<CR>gv-gv")
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
vim.keymap.set('n', "<S-Enter>", "O<Esc>")


-- Better indenting
vim.keymap.set('v', "<", "<gv")
vim.keymap.set('v', ">", ">gv")


-- Window movement
vim.keymap.set('n', "<C-h>", "<C-w>h")
vim.keymap.set('n', "<C-j>", "<C-w>j")
vim.keymap.set('n', "<C-k>", "<C-w>k")
vim.keymap.set('n', "<C-l>", "<C-w>l")
-- Terminal window navigation
vim.keymap.set('t', '<C-h>', "<C-\\><C-N><C-w>h")
vim.keymap.set('t', '<C-j>', "<C-\\><C-N><C-w>j")
vim.keymap.set('t', "<C-k>", "<C-\\><C-N><C-w>k")
vim.keymap.set('t', "<C-l>", "<C-\\><C-N><C-w>l")

-- Resize with arrows
vim.keymap.set('n', "<A-k>", ":resize -2<CR>")
vim.keymap.set('n', "<A-j>", ":resize +2<CR>")
vim.keymap.set('n', "<A-h>", ":vertical resize -2<CR>")
vim.keymap.set('n', "<A-l>", ":vertical resize +2<CR>")
vim.keymap.set("t", "<A-k>", "<cmd>resize -2<CR>")
vim.keymap.set("t", "<A-j>", "<cmd>resize +2<CR>")
vim.keymap.set("t", "<A-h>", "<cmd>vertical resize -2<CR>")
vim.keymap.set("t", "<A-l>", "<cmd>vertical resize +2<CR>")

-- Different paste behaviour
-- lvim.keys.normal_mode["p"] = [["0p]]
-- lvim.keys.normal_mode["P"] = [["0P]]
-- lvim.keys.visual_mode["p"] = [["0p]]
-- lvim.keys.visual_mode["P"] = [["0P]]



-- unmap a default keymapping
-- vim.keymap.del("n", "<C-Up>")

-- override a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>" -- or vim.keymap.set("n", "<C-q>", ":q<cr>" )


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
