-- by Friskenstein

-- Reset highlighting.
vim.cmd.highlight 'clear'
if vim.fn.exists 'syntax_on' then
	vim.cmd.syntax 'reset'
end
vim.o.termguicolors = true
vim.g.colors_name = 'chiaroscuro-light'

-- primary colors
local c = {
	bg = '#ffffff', -- '#050508',
	-- fg = '#050508', -- '#9ba2c6',
	fg = '#17181C',
	-- light_grey = '#33373D',
	light_grey = '#4a5057', -- ansi black
	grey = '#676D82',
	black = '#9ba2c6',
	deep = '#CDD1E3',
	red = '#8B1943', -- '#ff1a69',
	green = '#0C8C63',-- '#00ffaa',
	yellow = '#8B5D35', -- '#ffa24e',
	blue = '#500C8E',--'#8900ff',
	magenta = '#8B3E88',--'#ff63f4',
	cyan = '#0C8C8E', -- '#00ffff',
	white = '#a0a8cd',
	bold = '#196A5C', -- '#1abc9c',
}

local colors = {
	bg = c.bg,
	deep = c.deep,
	black = c.black,
	grey = c.grey,
	light_grey = c.light_grey,
	fg = c.fg,
	-- colors
	red = c.red,
	green = c.green,
	yellow = c.yellow,
	blue = c.blue,
	magenta = c.magenta,
	cyan = c.cyan,
	white = c.white,
	-- other colors
	fuchsia = c.magenta,
	orange = c.yellow,
	pink = c.magenta,
	-- special
	bold = c.bold,
	-- bright versions
	bright_red = c.red,
	bright_green = c.green,
	bright_yellow = c.yellow,
	bright_blue = c.blue,
	bright_magenta = c.magenta,
	bright_cyan = c.cyan,
	bright_white = c.white,
	-- element alias
	comment = c.black,
	gutter_fg = c.black,
	lavender = c.magenta,
	nontext = c.deep,
	selection = c.deep,
	visual = c.deep,
	-- effects
	transparent_black   = c.deep,
	transparent_blue    = '#F9F1FF', -- '#F2E3FF',
	transparent_cyan    = '#EAFFFF', -- '#E3FFFF',
	transparent_green   = '#F1FFFB', -- '#E3FFF6',
	transparent_red     = '#FFF3F7', -- '#FFE6EE',
	transparent_yellow  = '#FFF8F0', -- '#FFF5EB',
	transparent_magenta = '#FFF2FE', -- '#FFEEFE',
	transparent_bold    = '#F3FCFA', -- '#E6F8F4',
}

-- Terminal colors.
vim.g.terminal_color_0 = colors.grey
vim.g.terminal_color_1 = colors.red
vim.g.terminal_color_2 = colors.green
vim.g.terminal_color_3 = colors.yellow
vim.g.terminal_color_4 = colors.blue
vim.g.terminal_color_5 = colors.magenta
vim.g.terminal_color_6 = colors.cyan
vim.g.terminal_color_7 = colors.white
vim.g.terminal_color_8 = colors.grey
vim.g.terminal_color_9 = colors.bright_red
vim.g.terminal_color_10 = colors.bright_green
vim.g.terminal_color_11 = colors.bright_yellow
vim.g.terminal_color_12 = colors.bright_blue
vim.g.terminal_color_13 = colors.bright_magenta
vim.g.terminal_color_14 = colors.bright_cyan
vim.g.terminal_color_15 = colors.bright_white
vim.g.terminal_color_background = colors.bg
vim.g.terminal_color_foreground = colors.fg

-- TODO: remove
-- Groups used for statusline.
---@type table<string, vim.api.keyset.highlight>
local statusline_groups = {}
for mode, color in pairs {
	Normal = 'blue',
	Pending = 'pink',
	Visual = 'yellow',
	Insert = 'green',
	Command = 'cyan',
	Other = 'orange',
} do
	statusline_groups['StatuslineMode' .. mode] = { fg = colors.transparent_black, bg = colors[color] }
	statusline_groups['StatuslineModeSeparator' .. mode] = { fg = colors[color], bg = colors.transparent_black }
end
statusline_groups = vim.tbl_extend('error', statusline_groups, {
	StatuslineItalic = { fg = colors.grey, bg = colors.transparent_black, italic = true },
	StatuslineSpinner = { fg = colors.bright_green, bg = colors.transparent_black, bold = true },
	StatuslineTitle = { fg = colors.bright_white, bg = colors.transparent_black, bold = true },
})

---@type table<string, vim.api.keyset.highlight>
local groups = vim.tbl_extend('error', statusline_groups, {
	-- Builtins.
	Boolean = { fg = colors.yellow, bg = colors.transparent_yellow },
	Character = { fg = colors.green, bg = colors.transparent_green },
	ColorColumn = { bg = colors.selection },
	Comment = { fg = colors.comment, italic = true },
	Conceal = { fg = colors.comment },
	Conditional = { fg = colors.pink },
	Constant = { fg = colors.orange },
	CurSearch = { fg = colors.bg, bg = colors.orange },
	Cursor = { fg = colors.bg, bg = colors.fg },
	CursorColumn = { bg = colors.selection },
	CursorLine = { bg = colors.selection },
	CursorLineNr = { fg = colors.comment, bold = true },
	Define = { fg = colors.blue, bg = colors.transparent_blue },
	Directory = { fg = colors.blue, bg = colors.transparent_blue },
	Delimiter = { fg = colors.grey },
	EndOfBuffer = { fg = colors.bg },
	Error = { fg = colors.bright_red },
	ErrorMsg = { fg = colors.bright_red },
	FoldColumn = {},
	Folded = { bg = colors.transparent_black },
	Function = { fg = colors.blue, bg = colors.transparent_blue },
	Identifier = { fg = colors.magenta, bg = colors.transparent_magenta },
	IncSearch = { link = 'CurSearch' },
	Include = { fg = colors.blue, bg = colors.transparent_blue },
	Keyword = { fg = colors.blue, bg = colors.transparent_blue },
	Label = { fg = colors.blue, bg = colors.transparent_blue },
	LineNr = { fg = colors.comment },
	Macro = { fg = colors.blue, bg = colors.transparent_blue },
	MatchParen = { fg = colors.orange, bold = true },
	NonText = { fg = colors.nontext },
	Normal = { fg = colors.light_grey, bg = colors.bg },
	NormalFloat = { fg = colors.light_grey, bg = colors.bg },
	Number = { fg = colors.orange },
	Pmenu = { fg = colors.fg, bg = colors.transparent_black },
	PmenuSbar = { bg = colors.black },
	PmenuSel = { bg = colors.selection },
	PmenuThumb = { bg = colors.black },
	PreCondit = { fg = colors.cyan, bg = colors.transparent_cyan },
	PreProc = { fg = colors.cyan, bg = colors.transparent_cyan },
	Question = { fg = colors.blue, bg = colors.transparent_blue },
	Repeat = { fg = colors.blue, bg = colors.transparent_blue },
	Search = { fg = colors.fg, bg = colors.blue },
	SignColumn = { fg = colors.comment },
	Special = { fg = colors.green, bg = colors.transparent_green, italic = true },
	SpecialComment = { fg = colors.comment, italic = true },
	SpecialKey = { fg = colors.nontext },
	SpellBad = { sp = colors.bright_red, underline = true },
	SpellCap = { sp = colors.yellow, underline = true },
	SpellLocal = { sp = colors.yellow, underline = true },
	SpellRare = { sp = colors.yellow, underline = true },
	Statement = { fg = colors.blue, bg = colors.transparent_blue },
	StatusLine = { fg = colors.fg, bg = colors.bg },
	StorageClass = { fg = colors.pink },
	Structure = { fg = colors.green, bg = colors.transparent_green },
	String = { fg = colors.bold, bg = colors.transparent_bold },
	Substitute = { fg = colors.bg, bg = colors.transparent_red, bold = true },
	Title = { fg = colors.blue, bg = colors.transparent_blue, bold = true },
	Todo = { fg = colors.blue, bg = colors.transparent_blue, bold = true, italic = true },
	Type = { fg = colors.cyan, bg = colors.transparent_cyan },
	TypeDef = { link = 'Type' },
	Underlined = { underline = true },
	VertSplit = { fg = colors.comment },
	Visual = { bg = colors.visual },
	VisualNOS = { fg = colors.visual },
	WarningMsg = { fg = colors.yellow, bg = colors.transparent_yellow },
	WildMenu = { bg = colors.transparent_black },

	-- Treesitter.
	['@error'] = { fg = colors.bright_red },
	['@keyword.function.ruby'] = { fg = colors.pink },
	['@keyword.include'] = { fg = colors.pink },
	['@markup.link.uri'] = { fg = colors.yellow, bg = colors.transparent_yellow, italic = true },
	['@parameter.reference'] = { fg = colors.orange },
	['@string.special.symbol'] = { fg = colors.blue, bg = colors.transparent_blue },
	['@structure'] = { fg = colors.blue, bg = colors.transparent_blue },

	-- Semantic tokens.
	['@class'] = { fg = colors.cyan, bg = colors.transparent_cyan },
	['@decorator'] = { fg = colors.cyan, bg = colors.transparent_cyan },
	['@enum'] = { fg = colors.cyan, bg = colors.transparent_cyan },
	['@enumMember'] = { fg = colors.blue, bg = colors.transparent_blue },
	['@event'] = { fg = colors.cyan, bg = colors.transparent_cyan },
	['@interface'] = { fg = colors.cyan, bg = colors.transparent_cyan },
	['@lsp.type.class'] = { fg = colors.cyan, bg = colors.transparent_cyan },
	['@lsp.type.function'] = { fg = colors.green, bg = colors.transparent_green },
	['@lsp.type.macro'] = { fg = colors.cyan, bg = colors.transparent_cyan },
	['@lsp.type.method'] = { fg = colors.green, bg = colors.transparent_green },
	['@lsp.type.struct'] = { fg = colors.cyan, bg = colors.transparent_cyan },
	['@lsp.type.type'] = { fg = colors.bright_cyan },
	['@modifier'] = { fg = colors.cyan, bg = colors.transparent_cyan },
	['@regexp'] = { fg = colors.yellow, bg = colors.transparent_yellow },
	['@struct'] = { fg = colors.cyan, bg = colors.transparent_cyan },
	['@typeParameter'] = { fg = colors.cyan, bg = colors.transparent_cyan },


	["@annotation"] = { link = "PreProc" },
	["@attribute"] = { link = "PreProc" },
	["@boolean"] = { link = "Boolean" },
	["@character"] = { link = "Character" },
	["@character.special"] = { link = "Special" },
	["@comment"] = { link = "Comment" },
	["@keyword.conditional"] = { link = "Conditional" },
	["@constant"] = { link = "Constant" },
	["@constant.builtin"] = { link = "Special" },
	["@constant.macro"] = { link = "Define" },
	["@keyword.debug"] = { link = "Debug" },
	["@keyword.directive.define"] = { link = "Define" },
	["@keyword.exception"] = { link = "Exception" },
	["@number.float"] = { link = "Float" },
	["@function"] = { link = "Function" },
	["@function.builtin"] = { link = "Special" },
	["@function.call"] = { link = "@function" },
	["@function.macro"] = { link = "Macro" },
	["@keyword.import"] = { link = "Include" },
	["@keyword.coroutine"] = { link = "@keyword" },
	["@keyword.operator"] = { link = "@operator" },
	["@keyword.return"] = { link = "@keyword" },
	["@function.method"] = { link = "Function" },
	["@function.method.call"] = { link = "@function.method" },
	["@namespace.builtin"] = { link = "@variable.builtin" },
	["@none"] = {},
	["@number"] = { link = "Number" },
	["@keyword.directive"] = { link = "PreProc" },
	["@keyword.repeat"] = { link = "Repeat" },
	["@keyword.storage"] = { link = "StorageClass" },
	["@string"] = { link = "String" },
	["@markup.link.label"] = { link = "SpecialChar" },
	["@markup.link.label.symbol"] = { link = "Identifier" },
	["@tag"] = { link = "Label" },
	["@tag.attribute"] = { link = "@property" },
	["@tag.delimiter"] = { link = "Delimiter" },
	["@markup"] = { link = "@none" },
	["@markup.environment"] = { link = "Macro" },
	["@markup.environment.name"] = { link = "Type" },
	["@markup.raw"] = { link = "String" },
	["@markup.math"] = { link = "Special" },
	["@markup.strong"] = { bold = true },
	["@markup.emphasis"] = { italic = true },
	["@markup.strikethrough"] = { strikethrough = true },
	["@markup.underline"] = { underline = true },
	["@markup.heading"] = { link = "Title" },
	["@comment.note"] = { fg = colors.cyan, bg = colors.transparent_cyan },
	["@comment.error"] = { fg = colors.red, bg = colors.transparent_red },
	["@comment.hint"] = { fg = colors.cyan, bg = colors.transparent_cyan },
	["@comment.info"] = { fg = colors.cyan, bg = colors.transparent_cyan },
	["@comment.warning"] = { fg = colors.yellow, bg = colors.transparent_yellow },
	["@comment.todo"] = { fg = colors.cyan, bg = colors.transparent_cyan },
	["@markup.link.url"] = { link = "Underlined" },
	["@type"] = { link = "Type" },
	["@type.definition"] = { link = "Typedef" },
	["@type.qualifier"] = { link = "@keyword" },

	--- Misc
	-- TODO:
	-- ["@comment.documentation"] = { },
	["@operator"] = { fg = c.blue }, -- For any operator: `+`, but also `->` and `*` in C.

	--- Punctuation
	["@punctuation.delimiter"] = { fg = colors.blue }, -- For delimiters ie: `.`
	["@punctuation.bracket"] = { fg = colors.grey },   -- For brackets and parens.
	["@punctuation.special"] = { fg = colors.blue, bg = colors.transparent_blue },   -- For special symbols (e.g. `{}` in string interpolation)
	["@markup.list"] = { fg = colors.blue, bg = colors.transparent_blue },           -- For special punctutation that does not fall in the catagories before.
	["@markup.list.markdown"] = { fg = colors.orange, bold = true },

	--- Literals
	["@string.documentation"] = { fg = colors.yellow, bg = colors.transparent_yellow },
	["@string.regexp"] = { fg = colors.blue, bg = colors.transparent_blue },    -- For regexes.
	["@string.escape"] = { fg = colors.magenta, bg = colors.transparent_magenta }, -- For escape characters within a string.

	--- Functions
	["@constructor"] = { fg = colors.magenta, bg = colors.transparent_magenta },               -- For constructor calls and definitions: `= { }` in Lua, and Java constructors.
	["@variable.parameter"] = { fg = colors.yellow, bg = colors.transparent_yellow },         -- For parameters of a function.
	["@variable.parameter.builtin"] = { fg = colors.yellow, bg = colors.transparent_yellow }, -- For builtin parameters of a function, e.g. "..." or Smali's p[1-99]

	--- Keywords
	["@keyword"] = { fg = colors.blue, bg = colors.transparent_blue, italic = true }, -- For keywords that don't fall in previous categories.
	["@keyword.function"] = { fg = colors.magenta, bg = colors.transparent_magenta },      -- For keywords used to define a fuction.

	["@label"] = { fg = colors.blue, bg = colors.transparent_blue },                    -- For labels: `label:` in C and `:label:` in Lua.

	--- Types
	["@type.builtin"] = { fg = colors.blue, bg = colors.transparent_blue },
	["@variable.member"] = { fg = colors.green, bg = colors.transparent_green }, -- For fields.
	["@property"] = { fg = colors.green, bg = colors.transparent_green },

	--- Identifiers
	["@variable"] = { fg = colors.fg },           -- Any variable name that does not have another highlight.
	["@variable.builtin"] = { fg = colors.grey }, -- Variable names that are defined by the languages, like `this` or `self`.
	["@module.builtin"] = { fg = colors.red, bg = colors.transparent_red },    -- Variable names that are defined by the languages, like `this` or `self`.

	--- Text
	-- ["@markup.raw.markdown"] = { fg = colors.blue, bg = colors.transparent_blue },
	["@markup.raw.markdown_inline"] = { bg = colors.terminal_black, fg = c.blue },
	["@markup.link"] = { fg = colors.cyan, bg = colors.transparent_cyan },

	["@markup.list.unchecked"] = { fg = colors.blue, bg = colors.transparent_blue }, -- For brackets and parens.
	["@markup.list.checked"] = { fg = colors.green, bg = colors.transparent_green },  -- For brackets and parens.

	["@diff.plus"] = { link = "DiffAdd" },
	["@diff.minus"] = { link = "DiffDelete" },
	["@diff.delta"] = { link = "DiffChange" },

	["@module"] = { link = "Include" },

	-- tsx
	["@tag.tsx"] = { fg = colors.red, bg = colors.transparent_red },
	["@constructor.tsx"] = { fg = colors.blue, bg = colors.transparent_blue },
	["@tag.delimiter.tsx"] = { link = 'Delimiter' },

	-- LSP Semantic Token Groups
	["@lsp.type.boolean"] = { link = "@boolean" },
	["@lsp.type.builtinType"] = { link = "@type.builtin" },
	["@lsp.type.comment"] = { link = "@comment" },
	["@lsp.type.decorator"] = { link = "@attribute" },
	["@lsp.type.deriveHelper"] = { link = "@attribute" },
	["@lsp.type.enum"] = { link = "@type" },
	["@lsp.type.enumMember"] = { link = "@constant" },
	["@lsp.type.escapeSequence"] = { link = "@string.escape" },
	["@lsp.type.formatSpecifier"] = { link = "@markup.list" },
	["@lsp.type.generic"] = { link = "@variable" },
	["@lsp.type.interface"] = { fg = colors.blue, bg = colors.transparent_blue },
	["@lsp.type.keyword"] = { link = "@keyword" },
	["@lsp.type.lifetime"] = { link = "@keyword.storage" },
	["@lsp.type.namespace"] = { link = "@module" },
	["@lsp.type.number"] = { link = "@number" },
	["@lsp.type.operator"] = { link = "@operator" },
	["@lsp.type.parameter"] = { link = "@variable.parameter" },
	["@lsp.type.property"] = { link = "@property" },
	["@lsp.type.selfKeyword"] = { link = "@variable.builtin" },
	["@lsp.type.selfTypeKeyword"] = { link = "@variable.builtin" },
	["@lsp.type.string"] = { link = "@string" },
	["@lsp.type.typeAlias"] = { link = "@type.definition" },
	["@lsp.type.unresolvedReference"] = { undercurl = true, sp = colors.red },
	["@lsp.type.variable"] = {}, -- use treesitter styles for regular variables
	["@lsp.typemod.class.defaultLibrary"] = { link = "@type.builtin" },
	["@lsp.typemod.enum.defaultLibrary"] = { link = "@type.builtin" },
	["@lsp.typemod.enumMember.defaultLibrary"] = { link = "@constant.builtin" },
	["@lsp.typemod.function.defaultLibrary"] = { link = "@function.builtin" },
	["@lsp.typemod.keyword.async"] = { link = "@keyword.coroutine" },
	["@lsp.typemod.keyword.injected"] = { link = "@keyword" },
	["@lsp.typemod.macro.defaultLibrary"] = { link = "@function.builtin" },
	["@lsp.typemod.method.defaultLibrary"] = { link = "@function.builtin" },
	["@lsp.typemod.operator.injected"] = { link = "@operator" },
	["@lsp.typemod.string.injected"] = { link = "@string" },
	["@lsp.typemod.struct.defaultLibrary"] = { link = "@type.builtin" },
	["@lsp.typemod.type.defaultLibrary"] = { fg = colors.blue, bg = colors.transparent_blue },
	["@lsp.typemod.typeAlias.defaultLibrary"] = { fg = colors.blue, bg = colors.transparent_blue },
	["@lsp.typemod.variable.callable"] = { link = "@function" },
	["@lsp.typemod.variable.defaultLibrary"] = { link = "@variable.builtin" },
	["@lsp.typemod.variable.injected"] = { link = "@variable" },
	["@lsp.typemod.variable.static"] = { link = "@constant" },


	-- Package manager.
	LazyDimmed = { fg = colors.grey },

	-- LSP.
	DiagnosticDeprecated = { strikethrough = true, fg = colors.fg },
	DiagnosticError = { fg = colors.red, bg = colors.transparent_red },
	DiagnosticFloatingError = { fg = colors.red, bg = colors.transparent_red },
	DiagnosticFloatingHint = { fg = colors.cyan, bg = colors.transparent_cyan },
	DiagnosticFloatingInfo = { fg = colors.cyan, bg = colors.transparent_cyan },
	DiagnosticFloatingWarn = { fg = colors.yellow, bg = colors.transparent_yellow },
	DiagnosticHint = { fg = colors.cyan, bg = colors.transparent_cyan },
	DiagnosticInfo = { fg = colors.cyan, bg = colors.transparent_cyan },
	DiagnosticUnderlineError = { undercurl = true, sp = colors.red },
	DiagnosticUnderlineHint = { undercurl = true, sp = colors.cyan },
	DiagnosticUnderlineInfo = { undercurl = true, sp = colors.cyan },
	DiagnosticUnderlineWarn = { undercurl = true, sp = colors.yellow },
	DiagnosticUnnecessary = { fg = colors.grey, italic = true },
	DiagnosticVirtualTextError = { fg = colors.red, bg = colors.transparent_red },
	DiagnosticVirtualTextHint = { fg = colors.cyan, bg = colors.transparent_cyan },
	DiagnosticVirtualTextInfo = { fg = colors.cyan, bg = colors.transparent_cyan },
	DiagnosticVirtualTextWarn = { fg = colors.yellow, bg = colors.transparent_yellow },
	DiagnosticWarn = { fg = colors.yellow, bg = colors.transparent_yellow },
	LspCodeLens = { fg = colors.cyan, bg = colors.transparent_cyan },
	LspFloatWinBorder = { fg = colors.comment },
	LspInlayHint = { fg = colors.lavender, italic = true },
	LspReferenceRead = { bg = colors.transparent_blue },
	LspReferenceText = {},
	LspReferenceWrite = { bg = colors.transparent_red },
	LspSignatureActiveParameter = { bold = true, underline = true, sp = colors.fg },

	-- Completions:
	BlinkCmpKindClass = { link = '@type' },
	BlinkCmpKindColor = { link = 'DevIconCss' },
	BlinkCmpKindConstant = { link = '@constant' },
	BlinkCmpKindConstructor = { link = '@type' },
	BlinkCmpKindEnum = { link = '@variable.member' },
	BlinkCmpKindEnumMember = { link = '@variable.member' },
	BlinkCmpKindEvent = { link = '@constant' },
	BlinkCmpKindField = { link = '@variable.member' },
	BlinkCmpKindFile = { link = 'Directory' },
	BlinkCmpKindFolder = { link = 'Directory' },
	BlinkCmpKindFunction = { link = '@function' },
	BlinkCmpKindInterface = { link = '@type' },
	BlinkCmpKindKeyword = { link = '@keyword' },
	BlinkCmpKindMethod = { link = '@function.method' },
	BlinkCmpKindModule = { link = '@module' },
	BlinkCmpKindOperator = { link = '@operator' },
	BlinkCmpKindProperty = { link = '@property' },
	BlinkCmpKindReference = { link = '@parameter.reference' },
	BlinkCmpKindSnippet = { link = '@markup' },
	BlinkCmpKindStruct = { link = '@structure' },
	BlinkCmpKindText = { link = '@markup' },
	BlinkCmpKindTypeParameter = { link = '@variable.parameter' },
	BlinkCmpKindUnit = { link = '@variable.member' },
	BlinkCmpKindValue = { link = '@variable.member' },
	BlinkCmpKindVariable = { link = '@variable' },
	BlinkCmpLabelDeprecated = { link = 'DiagnosticDeprecated' },
	BlinkCmpLabelDescription = { fg = colors.grey, italic = true },
	BlinkCmpLabelDetail = { fg = colors.grey, bg = colors.bg },
	BlinkCmpMenu = { bg = colors.bg },
	BlinkCmpMenuBorder = { bg = colors.bg },

	-- Dap UI.
	DapStoppedLine = { default = true, link = 'Visual' },
	NvimDapVirtualText = { fg = colors.lavender, underline = true },

	-- Diffs.
	DiffAdd = { fg = colors.green, bg = colors.transparent_green },
	DiffChange = { fg = colors.blue, bg = colors.transparent_blue },
	DiffDelete = { fg = colors.red, bg = colors.transparent_red },
	DiffText = { fg = colors.orange, bg = colors.transparent_yellow, bold = true },
	DiffviewFolderSign = { fg = colors.cyan, bg = colors.transparent_cyan },
	DiffviewNonText = { fg = colors.comment },
	diffAdded = { fg = colors.bright_green, bold = true },
	diffChanged = { fg = colors.bright_blue, bold = true },
	diffRemoved = { fg = colors.bright_red, bold = true },
	Added = { fg = colors.bright_green },
	Changed = { fg = colors.bright_blue },
	Removed = { fg = colors.bright_red },

	-- Command line.
	MoreMsg = { fg = colors.bright_white, bold = true },
	MsgArea = { fg = colors.cyan, bg = colors.transparent_cyan },
	MsgSeparator = { fg = colors.comment },

	-- Winbar styling.
	WinBar = { fg = colors.fg, bg = colors.transparent_black },
	WinBarNC = { bg = colors.transparent_black },
	WinBarDir = { fg = colors.bright_magenta, bg = colors.transparent_black, italic = true },
	WinBarSeparator = { fg = colors.green, bg = colors.transparent_black },

	-- Quickfix window.
	QuickFixLine = { italic = true, bg = colors.transparent_red },

	-- Gitsigns.
	GitSignsAdd = { fg = colors.bright_green },
	GitSignsChange = { fg = colors.blue, bg = colors.transparent_blue },
	GitSignsDelete = { fg = colors.bright_red },
	GitSignsStagedAdd = { fg = colors.orange },
	GitSignsStagedChange = { fg = colors.orange },
	GitSignsStagedDelete = { fg = colors.orange },

	-- Gitlinker.
	NvimGitLinkerHighlightTextObject = { link = 'Visual' },

	-- Bufferline.
	BufferLineBufferSelected = { bg = colors.bg, underline = true, sp = colors.blue },
	BufferLineFill = { bg = colors.bg },
	TabLine = { fg = colors.comment, bg = colors.bg },
	TabLineFill = { bg = colors.bg },
	TabLineSel = { bg = colors.blue },


	LeapMatch = { bg = colors.transparent_red, fg = colors.fg, bold = true },
	LeapLabelPrimary = { fg = colors.red, bg = colors.transparent_red, bold = true },
	LeapLabelSecondary = { fg = colors.green, bg = colors.transparent_green, bold = true },
	LeapBackdrop = { fg = colors.comment },

	-- When triggering flash, use a white font and make everything in the backdrop italic.
	FlashBackdrop = { italic = true },
	FlashPrompt = { link = 'Normal' },

	-- Make these titles more visible.
	MiniClueTitle = { bold = true, fg = colors.cyan, bg = colors.transparent_cyan },
	MiniFilesTitleFocused = { bold = true, fg = colors.cyan, bg = colors.transparent_cyan },

	-- Nicer yanky highlights.
	YankyPut = { link = 'Visual' },
	YankyYanked = { link = 'Visual' },

	-- Highlight for the Treesitter sticky context.
	TreesitterContextBottom = { underline = true, sp = colors.comment },

	-- Fzf overrides.
	FzfLuaBorder = { fg = colors.comment },
	FzfLuaHeaderBind = { fg = colors.lavender },
	FzfLuaHeaderText = { fg = colors.pink },
	FzfLuaLivePrompt = { link = 'Normal' },
	FzfLuaLiveSym = { fg = colors.fuchsia },
	FzfLuaPreviewTitle = { fg = colors.fg },
	FzfLuaSearch = { bg = colors.transparent_red },

	-- Links.
	HighlightUrl = { underline = true, fg = colors.cyan, bg = colors.transparent_cyan, sp = colors.cyan },
})

for group, opts in pairs(groups) do
	vim.api.nvim_set_hl(0, group, opts)
end
