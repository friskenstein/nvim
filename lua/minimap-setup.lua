vim.g.minimap_global_toggle = true


vim.api.nvim_create_autocmd({"BufEnter", "Filetype"}, {
	pattern = "*",
	callback = function()
		local exclude_ft = {
			"qf",
			"NvimTree",
			"toggleterm",
			"TelescopePrompt",
			"alpha",
			"netrw",
			"oil",
		}

		local map = require('mini.map')
		if vim.tbl_contains(exclude_ft, vim.o.filetype) or not vim.g.minimap_global_toggle then
			---@diagnostic disable-next-line: inject-field
			vim.b.minimap_disable = true
			map.close()
		elseif vim.o.buftype == "" then
			---@diagnostic disable-next-line: inject-field
			vim.b.minimap_disable = false
			map.open()
		end
	end,
})
