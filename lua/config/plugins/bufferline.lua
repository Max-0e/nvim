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
		auto_hide = 1,
		animation = true,
		maximum_padding = 1,
		minimum_padding = 1,
		icons = {
			button = "", -- empty
			filetype = {
				enable = false,
			},
			buffer_index = true,
			diagnosticts = {
				[vim.diagnostic.severity.ERROR] = { enabled = true, icon = "?" },
				[vim.diagnostic.severity.WARN] = { enabled = false },
				[vim.diagnostic.severity.INFO] = { enabled = false },
				[vim.diagnostic.severity.HINT] = { enabled = true },
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
