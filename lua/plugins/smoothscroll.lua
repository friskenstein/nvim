return {
	--[[
	"karb94/neoscroll.nvim",
	event = "WinScrolled",
	config = function()
		require('neoscroll').setup({
			-- All these keys will be mapped to their corresponding default scrolling animation
			-- mappings = {'<C-u>', '<C-d>', 'zt', 'zz', 'zb'},
			mappings = {'zt', 'zz', 'zb'},
			hide_cursor = true,          -- Hide cursor while scrolling
			stop_eof = true,             -- Stop at <EOF> when scrolling downwards
			use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
			respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
			cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
			easing_function = 'quadratic', -- Default easing function
			pre_hook = nil,              -- Function to run before the scrolling animation starts
			post_hook = nil,              -- Function to run after the scrolling animation ends
		})

		local t = {}
		-- Syntax: t[keys] = {function, {function arguments}}
		-- t['<C-u>'] = {'scroll', {'-vim.o.scroll', 'true', '200'}}
		-- t['<C-d>'] = {'scroll', { 'vim.o.scroll', 'true', '200'}}
		t['zt']    = {'zt', {'200'}}
		t['zz']    = {'zz', {'200'}}
		t['zb']    = {'zb', {'200'}}

		require('neoscroll.config').set_mappings(t)
	end
]]--
}
