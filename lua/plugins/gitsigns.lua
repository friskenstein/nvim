return {

	-- Adds git related signs to the gutter, as well as utilities for managing changes
	'lewis6991/gitsigns.nvim',
	opts = {
		-- See `:help gitsigns.txt`
		signs = {
			add = { text = '+' },
			change = { text = '~' },
			delete = { text = '_' },
			topdelete = { text = '‾' },
			changedelete = { text = '~' },
		},
		on_attach = function(bufnr)
			local gs = package.loaded.gitsigns

			local function map(mode, l, r, opts)
				opts = opts or {}
				opts.buffer = bufnr
				vim.keymap.set(mode, l, r, opts)
			end

			-- Navigation
			map({ 'n', 'v' }, ']c', function()
				if vim.wo.diff then
					return ']c'
				end
				vim.schedule(function()
					gs.next_hunk()
				end)
				return '<Ignore>'
			end, { expr = true, desc = 'Next hunk' })

			map({ 'n', 'v' }, '[c', function()
				if vim.wo.diff then
					return '[c'
				end
				vim.schedule(function()
					gs.prev_hunk()
				end)
				return '<Ignore>'
			end, { expr = true, desc = 'Previous hunk' })

			-- Actions
			-- visual mode
			map('v', '<leader>ghs', function()
				gs.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
			end, { desc = 'Stage' })

			map('v', '<leader>ghr', function()
				gs.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
			end, { desc = 'Reset' })

			-- normal mode
			map('n', '<leader>ghs', gs.stage_hunk, { desc = 'Stage' })
			map('n', '<leader>ghr', gs.reset_hunk, { desc = 'Reset' })
			map('n', '<leader>ghu', gs.undo_stage_hunk, { desc = 'Undo stage' })
			map('n', '<leader>ghp', gs.preview_hunk, { desc = 'Preview' })

			map('n', '<leader>gs', gs.stage_buffer, { desc = 'Stage buffer' })
			map('n', '<leader>gr', gs.reset_buffer, { desc = 'Reset buffer' })
			map('n', '<leader>gb', function()
				gs.blame_line { full = false }
			end, { desc = 'Blame' })
			map('n', '<leader>gd', gs.diffthis, { desc = 'Diff vs. index' })
			map('n', '<leader>gD', function()
				gs.diffthis '~'
			end, { desc = 'Diff vs. last commit' })

			-- Toggles
			map('n', '<leader>gtb', gs.toggle_current_line_blame, { desc = 'Blame line' })
			map('n', '<leader>gtd', gs.toggle_deleted, { desc = 'Show deleted' })

			-- Text object
			map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>', { desc = 'Select git hunk' })
		end,
	},
}
