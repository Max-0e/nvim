return {
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		dependencies = {
			{ "nvim-lua/plenary.nvim", branch = "master" },
		},
		build = "make tiktoken",
		opts = {
			model = "gpt-5-mini", -- Default AI model to use
			temperature = 0.1,
			trusted_tools = nil, -- Require approval for all tool calls
			window = {
				layout = "vertical", -- 'vertical', 'horizontal', 'float'
				width = 0.5,
			},
			auto_insert_mode = true, -- Enter insert mode when opening
		},
	},
}
