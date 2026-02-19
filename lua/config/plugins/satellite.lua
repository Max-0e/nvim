return {
	"lewis6991/satellite.nvim",
	opts = {
		current_only = false,
		winblend = 50,
		zindex = 10,
		excluded_filetypes = {},
		width = 3,
		handlers = {
			cursor = {
				enable = true,
				symbols = { "|" },
			},
			search = {
				enable = true,
			},
			diagnostic = {
				enable = true,
				signs = { "" },
				-- signs = { "", "", "", "?" },
				min_severity = vim.diagnostic.severity.HINT,
			},
			gitsigns = {
				enable = true,
				signs = { -- can only be a single character (multibyte is okay)
					add = "+",
					change = "~",
					delete = "-",
				},
			},
			marks = {
				enable = true,
				show_builtins = false, -- shows the builtin marks like [ ] < >
				key = "m",
				-- Highlights:
				-- SatelliteMark (default links to Normal)
			},
			quickfix = {
				signs = { "-", "=", "?" },
				-- Highlights:
				-- SatelliteQuickfix (default links to WarningMsg)
			},
		},
	},
}
