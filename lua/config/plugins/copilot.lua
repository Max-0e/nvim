return {
	"github/copilot.vim",
	config = function()
		-- vim.g.copilot_no_tab_map = true
		-- vim.api.nvim_set_keymap("i", "", 'copilot#Accept("")', { silent = true, expr = true })
		vim.g.copilot_enterprise_url = "https://sva.ghe.com/"
		vim.g.copilot_auth_provider_url = "https://sva.ghe.com/"
	end,
}
