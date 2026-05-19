local M = {}

M.signs = {
	text = {
		[vim.diagnostic.severity.ERROR] = '',
		[vim.diagnostic.severity.WARN] = '',
		[vim.diagnostic.severity.INFO] = '',
		[vim.diagnostic.severity.HINT] = '󰛨',
	},
	numhl = {
		[vim.diagnostic.severity.ERROR] = 'DiagnosticError',
		[vim.diagnostic.severity.WARN] = 'DiagnosticWarn',
		[vim.diagnostic.severity.INFO] = 'DiagnosticInfo',
		[vim.diagnostic.severity.HINT] = 'DiagnosticHint',
	},
}

function M.enable()
	vim.diagnostic.config({ signs = M.signs })
end

function M.toggle()
	local signs = vim.diagnostic.config().signs
	if signs == false then
		M.enable()
		return true
	end

	vim.diagnostic.config({ signs = false })
	return false
end

return M
