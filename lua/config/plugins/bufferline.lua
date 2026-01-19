-- return {
-- 'akinsho/bufferline.nvim',
-- version = "*",
-- dependencies = 'nvim-tree/nvim-web-devicons'
-- }
--
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
		icons = {
			filetype = {
				enable = false,
			},
			buffer_index = true,
			buffer_number = true,
			diagnosticts = {
				[vim.diagnostic.severity.ERROR] = { enabled = true, icon = "?" },
				[vim.diagnostic.severity.WARN] = { enabled = false },
				[vim.diagnostic.severity.INFO] = { enabled = false },
				[vim.diagnostic.severity.HINT] = { enabled = true },
			},
			gitsigns = {
				added = { enabled = true, icon = "+" },
				changed = { enabled = true, icon = "~" },
				deleted = { enabled = true, icon = "-" },
			},
		},
	},
}
