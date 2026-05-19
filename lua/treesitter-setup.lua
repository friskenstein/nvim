local M = {}

M.parsers = {
	'bash',
	'c',
	'cpp',
	'diff',
	'go',
	'html',
	'javascript',
	'lua',
	'luadoc',
	'markdown',
	'markdown_inline',
	'python',
	'query',
	'rust',
	'tsx',
	'typescript',
	'vim',
	'vimdoc',
}

local indent_filetypes = {
	bash = true,
	c = true,
	cpp = true,
	go = true,
	html = true,
	javascript = true,
	lua = true,
	markdown = true,
	python = true,
	rust = true,
	typescript = true,
	typescriptreact = true,
	vim = true,
}

local function set_visual_selection(node)
	local start_row, start_col, end_row, end_col = node:range()
	vim.fn.setpos('.', { 0, start_row + 1, start_col + 1, 0 })
	vim.cmd('normal! v')
	vim.fn.setpos('.', { 0, end_row + 1, end_col, 0 })
end

local function select_node(node)
	if node then
		vim.b.ts_incremental_node = node
		set_visual_selection(node)
	end
end

local function node_at_cursor()
	return vim.treesitter.get_node({ ignore_injections = false })
end

local function select_parent()
	local node = vim.b.ts_incremental_node or node_at_cursor()
	if node and node:parent() then
		select_node(node:parent())
	end
end

local function select_child()
	local node = vim.b.ts_incremental_node
	if node and node:named_child_count() > 0 then
		select_node(node:named_child(0))
	end
end

function M.setup_core()
	vim.api.nvim_create_autocmd('FileType', {
		group = vim.api.nvim_create_augroup('treesitter-start', { clear = true }),
		callback = function(event)
			if vim.bo[event.buf].filetype == 'ruby' then
				return
			end

			pcall(vim.treesitter.start, event.buf)

			if indent_filetypes[vim.bo[event.buf].filetype] then
				vim.bo[event.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
			end
		end,
	})

	vim.keymap.set({ 'n', 'x' }, '<c-space>', function()
		select_node(node_at_cursor())
	end, { desc = 'Treesitter select node' })

	vim.keymap.set({ 'n', 'x' }, '<c-s>', select_parent, { desc = 'Treesitter select parent' })
	vim.keymap.set({ 'n', 'x' }, '<M-space>', select_child, { desc = 'Treesitter select child' })
end

function M.setup_textobjects()
	local ok, textobjects = pcall(require, 'nvim-treesitter-textobjects')
	if not ok then
		return
	end

	textobjects.setup({
		select = {
			lookahead = true,
			selection_modes = {
				['@function.outer'] = 'V',
				['@class.outer'] = 'V',
			},
		},
		move = {
			set_jumps = true,
		},
	})

	local select = require('nvim-treesitter-textobjects.select').select_textobject
	local move = require('nvim-treesitter-textobjects.move')
	local swap = require('nvim-treesitter-textobjects.swap')

	vim.keymap.set({ 'x', 'o' }, 'aa', function() select('@parameter.outer', 'textobjects') end, { desc = 'Outer argument' })
	vim.keymap.set({ 'x', 'o' }, 'ia', function() select('@parameter.inner', 'textobjects') end, { desc = 'Inner argument' })
	vim.keymap.set({ 'x', 'o' }, 'af', function() select('@function.outer', 'textobjects') end, { desc = 'Outer function' })
	vim.keymap.set({ 'x', 'o' }, 'if', function() select('@function.inner', 'textobjects') end, { desc = 'Inner function' })
	vim.keymap.set({ 'x', 'o' }, 'ac', function() select('@class.outer', 'textobjects') end, { desc = 'Outer class' })
	vim.keymap.set({ 'x', 'o' }, 'ic', function() select('@class.inner', 'textobjects') end, { desc = 'Inner class' })

	vim.keymap.set({ 'n', 'x', 'o' }, ']m', function() move.goto_next_start('@function.outer', 'textobjects') end, { desc = 'Next function start' })
	vim.keymap.set({ 'n', 'x', 'o' }, ']c', function() move.goto_next_start('@class.outer', 'textobjects') end, { desc = 'Next class start' })
	vim.keymap.set({ 'n', 'x', 'o' }, ']M', function() move.goto_next_end('@function.outer', 'textobjects') end, { desc = 'Next function end' })
	vim.keymap.set({ 'n', 'x', 'o' }, ']C', function() move.goto_next_end('@class.outer', 'textobjects') end, { desc = 'Next class end' })
	vim.keymap.set({ 'n', 'x', 'o' }, '[m', function() move.goto_previous_start('@function.outer', 'textobjects') end, { desc = 'Previous function start' })
	vim.keymap.set({ 'n', 'x', 'o' }, '[c', function() move.goto_previous_start('@class.outer', 'textobjects') end, { desc = 'Previous class start' })
	vim.keymap.set({ 'n', 'x', 'o' }, '[M', function() move.goto_previous_end('@function.outer', 'textobjects') end, { desc = 'Previous function end' })
	vim.keymap.set({ 'n', 'x', 'o' }, '[C', function() move.goto_previous_end('@class.outer', 'textobjects') end, { desc = 'Previous class end' })

	vim.keymap.set('n', '<leader>lSp', function() swap.swap_next('@parameter.inner') end, { desc = 'Swap next parameter' })
	vim.keymap.set('n', '<leader>lSP', function() swap.swap_previous('@parameter.inner') end, { desc = 'Swap previous parameter' })
end

function M.setup()
	M.setup_core()
	M.setup_textobjects()
end

return M
