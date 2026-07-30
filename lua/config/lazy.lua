-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
	spec = {
		{
			"catppuccin/nvim",
			config = function()
				vim.cmd.colorscheme("catppuccin-mocha")
				-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
				-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
			end,
		},
		{ import = "config.plugins" },
	},
	checker = { enabled = true },
})
require("guess-indent").setup({})
require("gitsigns").setup()
local animate = require("mini.animate")
animate.setup({
	scroll = {
		timing = animate.gen_timing.linear({ duration = 50, unit = "total" }),
		subscroll = animate.gen_subscroll.equal({ max_output_steps = 50 }),
	},
	cursor = { enabled = false },
})
require("notify").setup({
	background_colour = "#000000",
})
-- vim.lsp.config("roslyn", {
-- on_attach = function()
-- print("This will run when the server attaches!")
-- end,
-- settings = {
-- ["csharp|inlay_hints"] = {
-- csharp_enable_inlay_hints_for_implicit_object_creation = true,
-- csharp_enable_inlay_hints_for_implicit_variable_types = true,
-- },
-- ["csharp|code_lens"] = {
-- dotnet_enable_references_code_lens = true,
-- },
-- },
-- })
