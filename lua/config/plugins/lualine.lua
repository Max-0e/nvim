local colors = {
	blue = "#8aadf4",
	cyan = "#8bd5ca",
	black = "#080808",
	white = "#c6c6c6",
	red = "#ed8796",
	violet = "#c6a0f6",
	grey = "#303030",
	transparent = "none",
}

local maxs_theme = {
	normal = {
		a = { fg = colors.black, bg = colors.violet },
		b = { fg = colors.white, bg = colors.grey },
		c = { fg = colors.white, bg = colors.transparent },
	},

	insert = { a = { fg = colors.black, bg = colors.blue } },
	visual = { a = { fg = colors.black, bg = colors.cyan } },
	replace = { a = { fg = colors.black, bg = colors.red } },

	inactive = {
		a = { fg = colors.white, bg = colors.transparent },
		b = { fg = colors.white, bg = colors.transparent },
		c = { fg = colors.white, bg = colors.transparent },
	},
}

local leftSeperator = { left = "", right = "" }
local rightSeperator = { right = "", left = "" }

local sections = {
	lualine_a = {
		{ "mode", separator = leftSeperator, right_padding = 2 },
	},
	lualine_b = {
		{ "filename", separator = leftSeperator },
		{ "branch", separator = leftSeperator },
		{ "lsp_status", separator = leftSeperator },
		{ "show_macro_recording" },
	},
	lualine_c = {
		"%=",
	},
	lualine_x = {
		{ "copilot", seperator = rightSeperator, right_padding = 2 },
	},
	lualine_y = {
		{ "filetype", seperator = rightSeperator, right_padding = 2 },
		"progress",
	},
	lualine_z = {
		{ "location", separator = rightSeperator, left_padding = 2 },
	},
}

return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"AndreM222/copilot-lualine",
			"pnx/lualine-lsp-status",
		},
		config = function()
			require("lualine").setup({
				theme = maxs_theme,
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				sections = sections,
				always_divide_middle = true,
				tabline = {},
				extensions = {},
			})
		end,
	},
}
