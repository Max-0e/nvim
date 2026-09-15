return {
	"zbirenbaum/copilot.lua",
	dependencies = {
		"copilotlsp-nvim/copilot-lsp",
	},
	config = function()
		require("copilot").setup({
			panel = {
				enabled = true,
				auto_refresh = false,
				keymap = {
					jump_prev = "[[",
					jump_next = "]]",
					accept = "<CR>",
					refresh = "gr",
					open = "<M-CR>",
				},
				layout = {
					position = "right", -- | top | left | right | bottom |
					ratio = 0.4,
				},
			},
			suggestion = {
				enabled = true,
				auto_trigger = true,
				hide_during_completion = true,
				debounce = 15,
				trigger_on_accept = true,
				keymap = {
					accept = "<tab>",
					accept_word = "<M-l>",
					accept_line = "<M-L>",
					next = "<M-]>",
					prev = "<M-[>",
					dismiss = "<C-]>",
					toggle_auto_trigger = false,
				},
			},
			nes = {
				enabled = false, -- requires copilot-lsp as a dependency
				auto_trigger = false,
				keymap = {
					accept_and_goto = false,
					accept = false,
					dismiss = false,
				},
			},
			auth_provider_url = "https://sva.ghe.com/", -- URL to authentication provider, if not "https://github.com/"
			copilot_node_command = "node", -- Node.js version must be > 22
			workspace_folders = {},
			copilot_model = "",
		})
	end,
}
