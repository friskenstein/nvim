-- [[ Configure nvim-cmp ]]
--
-- See `:help cmp`
local cmp = require 'cmp'
local luasnip = require 'luasnip'
require('luasnip.loaders.from_vscode').lazy_load()
luasnip.config.setup {}

local iconz = {
	kind = {
		Method = "󰆧",
		Function = "󰊕",
		Constructor = "",
		Variable = "󰀫",
		Module = "",
		Unit = "󰑭",
		Value = "󰎠",
		Snippet = "",
		Color = "󰏘",
		File = "󰈙",
		Struct = "󰙅",
		Event = "",
		Array = "",
		Boolean = "",
		Class = "󰠱", --Class = "",
		Constant = "󰏿", --Constant = "",
		Enum = "",
		EnumMember = "",
		Field = "", --Field = "",
		Folder = "󰉋",
		Interface = "", --Interface = "",
		Key = "",
		Keyword = "󰌋",
		Namespace = "",
		Null = "󰟢",
		Number = "",
		Object = "",
		Operator = "",--Operator = "󰆕",
		Package = "",
		Property = "",
		Reference = "󰈇",--Reference = "",
		String = "",
		Text = "",
		TypeParameter = "",
	},
	git = {
		LineAdded = "󰐕", --"", --
		LineModified = "󰜥", --"", -- 
		LineRemoved = "󰍴", --"", -- 
		FileDeleted = "",
		FileIgnored = "◌",
		FileRenamed = "",
		FileStaged = "S",
		FileUnmerged = "",
		FileUnstaged = "",
		FileUntracked = "U",
		Diff = "",
		Repo = "",
		Octoface = "",
		Branch = "",
	},
	ui = {
		ArrowCircleDown = "",
		ArrowCircleLeft = "",
		ArrowCircleRight = "",
		ArrowCircleUp = "",
		BoldArrowDown = "",
		BoldArrowLeft = "",
		BoldArrowRight = "",
		BoldArrowUp = "",
		BoldClose = "",
		BoldDividerLeft = "",
		BoldDividerRight = "",
		BoldLineLeft = "▎",
		BookMark = "",
		BoxChecked = "",
		Bug = "",
		Stacks = "",
		Scopes = "",
		Watches = "󰂥",
		DebugConsole = "",
		Calendar = "",
		Check = "",
		ChevronRight = ">",
		ChevronShortDown = "",
		ChevronShortLeft = "",
		ChevronShortRight = "",
		ChevronShortUp = "",
		Circle = "",
		Close = "󰅖",
		CloudDownload = "",
		Code = "",
		Comment = "",
		Dashboard = "",
		DividerLeft = "",
		DividerRight = "",
		DoubleChevronRight = "»",
		Ellipsis = '…', -- "",
		EmptyFolder = "",
		EmptyFolderOpen = "",
		File = "",
		FileSymlink = "",
		Files = "",
		FindFile = "󰈞",
		FindText = "󰊄",
		Fire = "",
		Folder = "󰉋",
		FolderOpen = "",
		FolderSymlink = "",
		Forward = "",
		Gear = "",
		History = "",
		Lightbulb = "",
		LineLeft = "▏",
		LineMiddle = "│",
		List = "",
		Lock = "",
		NewFile = "",
		Note = "",
		Package = "",
		Pencil = "󰏫",
		Plus = "",
		Project = "",
		Search = "",
		SignIn = "",
		SignOut = "",
		Tab = "󰌒",
		Table = "",
		Target = "󰀘",
		Telescope = "",
		Text = "",
		Tree = "",
		Triangle = "󰐊",
		TriangleShortArrowDown = "",
		TriangleShortArrowLeft = "",
		TriangleShortArrowRight = "",
		TriangleShortArrowUp = "",
	},
	diagnostics = {
		BoldError = "",
		Error = "", -- 
		BoldWarning = "",  -- 󱇎
		Warning = "", --
		BoldInformation = "",
		Information = "", --  
		BoldQuestion = "",
		Question = "",
		BoldHint = "󰛨",
		Hint = "", -- 󰌶 
		Debug = "",
		Trace = "✎",
	},
	misc = {
		Robot = "󰚩",
		Squirrel = "",
		Tag = "",
		Watch = "",
		Smiley = "",
		Package = "",
		CircuitBoard = "",
	},
}

local cmp_max_width = 40

local cmp_duplicates = {
	buffer = 1,
	path = 1,
	nvim_lsp = 0,
	luasnip = 1,
}

local cmp_duplicates_default = 0

cmp.setup {
	window = {
		completion = {
			border = 'rounded',
			-- winhighlight = 'Normal:Pmenu,FloatBorder:Pmenu,CursorLine:PmenuSel,Search:None',
			winhighlight = 'Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None',
		},
		documentation = {
			border = 'rounded',
			-- winhighlight = 'FloatBorder:NormalFloat',
			winhighlight = 'FloatBorder:FloatBorder',
		},
	},
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	completion = {
		completeopt = 'menu,menuone,noinsert',
		-- keyword_length = 2,
	},
	mapping = cmp.mapping.preset.insert {
		['<C-n>'] = cmp.mapping.select_next_item(),
		['<C-p>'] = cmp.mapping.select_prev_item(),
		['<C-b>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		--['<C-Space>'] = cmp.mapping.complete {},
		['<CR>'] = cmp.mapping.confirm {
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		},
		['<Tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_locally_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end, { 'i', 's' }),
		['<S-Tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.locally_jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { 'i', 's' }),
	},
	sources = {
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' },
		{ name = 'path' },
	},
	formatting = {
		fields = { "abbr", "kind", "menu" },
		--max_width = cmp_max_width,
		kind_icons = iconz.kind,
		source_names = {
			nvim_lsp = "(LSP)",
			emoji = "(Emoji)",
			path = "(Path)",
			calc = "(Calc)",
			cmp_tabnine = "(Tabnine)",
			vsnip = "(Snippet)",
			luasnip = "(Snippet)",
			buffer = "(Buffer)",
			tmux = "(TMUX)",
			copilot = "(Copilot)",
			treesitter = "(TreeSitter)",
		},
		-- TODO: is duplicate check unnecessary?
		duplicates = cmp_duplicates,
		duplicates_default = cmp_duplicates_default,
		format = function(entry, vim_item)
			local max_width = cmp_max_width
			if max_width ~= 0 and #vim_item.abbr > max_width then
				vim_item.abbr = string.sub(vim_item.abbr, 1, max_width - 1) .. ""
			end

			vim_item.kind = iconz.kind[vim_item.kind] .. " " .. vim_item.kind

			if entry.source.name == "copilot" then
				vim_item.kind = iconz.git.Octoface
				vim_item.kind_hl_group = "CmpItemKindCopilot"
			end

			if entry.source.name == "cmp_tabnine" then
				vim_item.kind = iconz.misc.Robot
				vim_item.kind_hl_group = "CmpItemKindTabnine"
			end

			if entry.source.name == "crates" then
				vim_item.kind = iconz.misc.Package
				vim_item.kind_hl_group = "CmpItemKindCrate"
			end

			if entry.source.name == "lab.quick_data" then
				vim_item.kind = iconz.misc.CircuitBoard
				vim_item.kind_hl_group = "CmpItemKindConstant"
			end

			if entry.source.name == "emoji" then
				vim_item.kind = iconz.misc.Smiley
				vim_item.kind_hl_group = "CmpItemKindEmoji"
			end

			-- truncate menu
			if vim_item.menu and #vim_item.menu > 20 then
				vim_item.menu = string.sub(vim_item.menu, 1, 19) .. iconz.ui.Ellipsis
			end

			vim_item.dup = cmp_duplicates[entry.source.name] or cmp_duplicates_default
			return vim_item
		end,
	},

}
