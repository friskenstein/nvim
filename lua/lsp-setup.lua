-- [[ Configure LSP ]]


-- mason-lspconfig requires that these setup functions are called in this order
-- before setting up the servers.
require('mason').setup()
require('mason-lspconfig').setup()

-- Enable the following language servers
--  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
--
--  Add any additional override configuration in the following tables. They will be passed to
--  the `settings` field of the server config. You must look up that documentation yourself.
--
--  If you want to override the default filetypes that your language server will attach to you can
--  define the property 'filetypes' to the map in question.
local servers = {
	-- clangd = {},
	-- gopls = {},
	pyright = {},
	rust_analyzer = {},
	tsserver = {},
	svelte = {},
	html = {},

	lua_ls = {
		Lua = {
			workspace = { checkThirdParty = false },
			telemetry = { enable = false },
			-- NOTE: toggle below to ignore Lua_LS's noisy `missing-fields` warnings
			diagnostics = { disable = { 'missing-fields' } },
		},
	},
	cssls = {
		css = {
			validate = true,
			lint = {
				unknownAtRules = "ignore",
			},
		},
	},
}


-- Setup neovim lua configuration
require('neodev').setup()

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)


--  This function gets run when an LSP connects to a particular buffer.
local on_attach = function(_, bufnr)

	local nmap = function(keys, func, desc)
		if desc then
			desc = 'LSP: ' .. desc
		end

		vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
	end

	-- g hotkeys
	nmap('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
	nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
	nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
	nmap('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')

	-- WhichKey
	nmap('<leader>lR', vim.lsp.buf.rename, 'Rename')
	nmap('<leader>la', vim.lsp.buf.code_action, 'Code Action')
	nmap('<leader>lD', require('telescope.builtin').lsp_type_definitions, 'Type Definition')
	nmap('<leader>ls', require('telescope.builtin').lsp_document_symbols, 'Document Symbols')

	-- See `:help K` for why this keymap
	nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
	--TODO: bring back
	--nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

	-- Workspace
	nmap('<leader>lwd', require('telescope.builtin').diagnostics, 'Diagnostics ')
	nmap('<leader>lws', require('telescope.builtin').lsp_dynamic_workspace_symbols, 'Symbols')
	nmap('<leader>lwa', vim.lsp.buf.add_workspace_folder, 'Add Folder')
	nmap('<leader>lwr', vim.lsp.buf.remove_workspace_folder, 'Remove Folder')
	nmap('<leader>lwl', function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, 'List Folders')

	-- Create a command `:Format` local to the LSP buffer
	vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
		vim.lsp.buf.format()
	end, { desc = 'Format current buffer with LSP' })
end

-- Ensure the servers above are installed
local mason_lspconfig = require 'mason-lspconfig'

mason_lspconfig.setup {
	ensure_installed = vim.tbl_keys(servers),
}

mason_lspconfig.setup_handlers {
	function(server_name)
		require('lspconfig')[server_name].setup {
			capabilities = capabilities,
			on_attach = on_attach,
			settings = servers[server_name],
			filetypes = (servers[server_name] or {}).filetypes,
		}
	end,
}

