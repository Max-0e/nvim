return {
	"Willem-J-an/adopure.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
		-- "sindrets/diffview.nvim" -- Optionally required to open PR in diffview
	},
	config = function()
		vim.g.adopure = {}
	end,
}
