-- local colors = require("tokyonight.colors").setup({ transform = true })
-- local config = require("tokyonight.config").options


local colors = {
	bg = '#050508',    --
	fg = '#9ba2c6',    --
	black = '#4a5057', -- ?
	bright_red = '#ff1a69',
	bright_green = '#00ffaa',
	bright_yellow = '#ffa24e',
	bright_blue = '#516fff',
	bright_magenta = '#ff63f4',
	bright_cyan = '#00ffff',
	bright_white = '#a0a8cd',
	transparent_blue = '#140423',
	transparent_cyan = '#042123',
	transparent_green = '#04211A',
	transparent_red = '#210713',
	transparent_yellow = '#211610',
	transparent_magenta = '#210F22',
	comment = '#4a5057',
	red = '#ff1a69',
	green = '#00ffaa',
	yellow = '#ffa24e',
	purple = '#516fff',
	blue = '#8900ff',
	cyan = '#00ffff',
	fuchsia = '#ff63f4',
	magenta = '#ff63f4',
	white = '#a0a8cd',
	grey = '#A9ABAC',
	gutter_fg = '#4B5263',
	lavender = '#6272A4',
	lilac = '#6D5978',
	menu = '#21222C',
	neon_cyan = '#00DFDF',
	nontext = '#3B4048',
	orange = '#ffa24e',
	pink = '#ff63f4',
	bg_statusline = 'NONE',
	none = 'NONE',
	fg_sidebar = '#9ba2c6',
	fg_gutter = '#4a5057',
}

local styles = {}

styles.normal = {
	a = { bg = colors.blue, fg = colors.bg },
	b = { bg = colors.transparent_blue, fg = colors.blue },
	c = { bg = colors.bg_statusline, fg = colors.fg_sidebar },
}

styles.insert = {
	a = { bg = colors.green, fg = colors.bg },
	b = { bg = colors.transparent_green, fg = colors.green },
}

styles.command = {
	a = { bg = colors.yellow, fg = colors.bg },
	b = { bg = colors.transparent_yellow, fg = colors.yellow },
}

styles.visual = {
	a = { bg = colors.magenta, fg = colors.bg },
	b = { bg = colors.transparent_magenta, fg = colors.magenta },
}

styles.replace = {
	a = { bg = colors.red, fg = colors.bg },
	b = { bg = colors.transparent_red, fg = colors.red },
}

styles.terminal = {
	a = { bg = colors.cyan, fg = colors.bg },
	b = { bg = colors.transparent_cyan, fg = colors.cyan },
}

styles.inactive = {
	a = { bg = colors.bg_statusline, fg = colors.blue },
	b = { bg = colors.bg_statusline, fg = colors.fg_gutter, gui = "bold" },
	c = { bg = colors.bg_statusline, fg = colors.fg_gutter },
}

-- if config.lualine_bold then
--   for _, mode in pairs(styles) do
--     mode.a.gui = "bold"
--   end
-- end

return styles
