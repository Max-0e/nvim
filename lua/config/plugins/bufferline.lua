return {
	"romgrk/barbar.nvim",
	dependencies = {
		"lewis6991/gitsigns.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	init = function()
		vim.g.barbar_auto_setup = false
	end,
	opts = {
		auto_hide = 0,
		animation = false,
		maximum_padding = 1,
		minimum_padding = 1,
		icons = {
			button = "", -- empty
			filetype = {
				enable = false,
			},
			buffer_index = true,
			diagnostics = {
				[vim.diagnostic.severity.ERROR] = { enabled = true, icon = "" },
				[vim.diagnostic.severity.WARN] = { enabled = true, icon = "" },
				[vim.diagnostic.severity.INFO] = { enabled = true, icon = "" },
				[vim.diagnostic.severity.HINT] = { enabled = true, icon = "" },
			},
			preset = "slanted",
			gitsigns = {
				added = { enabled = true, icon = "+" },
				changed = { enabled = true, icon = "~" },
				deleted = { enabled = true, icon = "-" },
			},
		},
	},
}
