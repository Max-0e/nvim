local builtin = require("telescope.builtin")

return {
	"nvim-telescope/telescope.nvim",
	keys = {
		{
			"<leader>ff",
			mode = { "n" },
			builtin.find_files,
			desc = "Telescope find files",
		},
		{
			"<leader>fg",
			mode = { "n" },
			builtin.live_grep,
			desc = "Telescope live grep",
		},
		{
			"<leader>fb",
			mode = { "n" },
			builtin.buffers,
			desc = "Telescope buffers",
		},
		{
			"<leader>fh",
			mode = { "n" },
			builtin.help_tags,
			desc = "Telescope help tags",
		},
	},
	opts = {
		defaults = {
			file_ignore_patterns = { ".git/" },
		},
		pickers = {
			find_files = {
				hidden = true,
			},
			live_grep = {
				hidden = true,
			},
		},
	},
}
