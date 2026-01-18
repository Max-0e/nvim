-- set language
vim.cmd("language en_US")

-- set leader
vim.g.mapleader = "<space>"
vim.g.maplocalleader = "<space>"
vim.g.have_nerd_font = true

-- remap comment
vim.keymap.set({ "n", "v" }, "<space>/", ":norm gcc<CR>")
-- execution while editing configuration
vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")
vim.keymap.set("n", "<space><space>L", "<cmd>Lazy<CR>")
vim.keymap.set("n", "<space>x", ":.lua<CR>")
vim.keymap.set("v", "<space>x", ":lua<CR>")

-- save and exit
vim.keymap.set("n", "<space>w", ":w<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<space>q", ":q<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<space>c", ":bd<CR>", { noremap = true, silent = true })

-- clear search etc.
vim.keymap.set("n", "<Esc>", ":noh<CR>", { silent = true })

-- split navigation
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- buffer navigation
vim.keymap.set("n", "<space>bn", ":bnext<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<space>bb", ":bprev<CR>", { noremap = true, silent = true })

vim.o.tabstop = 2 -- A TAB character looks like 4 spaces
vim.o.expandtab = true -- Pressing the TAB key will insert spaces instead of a TAB character
vim.o.softtabstop = 2 -- Number of spaces inserted instead of a TAB character
vim.o.shiftwidth = 2 -- Number of spaces inserted when indenting

vim.o.number = true
vim.o.relativenumber = true
vim.schedule(function()
	vim.o.clipboard = "unnamedplus"
end)
vim.o.breakindent = true
vim.o.undofile = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.signcolumn = "yes"
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- Sets how neovim will display certain whitespace characters in the editor.
vim.o.list = true

vim.o.inccommand = "split"
vim.o.cursorline = true
vim.o.scrolloff = 8
vim.o.confirm = true

vim.keymap.set({ "n", "x" }, "<D-.>", function()
	require("tiny-code-action").code_action()
end, { noremap = true, silent = true })
vim.keymap.set("n", "K", function()
	vim.lsp.buf.hover({ border = "rounded" })
end, { noremap = false, silent = true })
vim.keymap.set("n", "KI", function()
	vim.diagnostic.open_float({ border = "rounded" })
end, { noremap = false, silent = true })

require("config.lazy")

local open_command = "xdg-open"
if vim.fn.has("mac") == 1 then
	open_command = "open"
end

local function url_repo()
	local cursorword = vim.fn.expand("<cfile>")
	if string.find(cursorword, "^[a-zA-Z0-9-_.]*/[a-zA-Z0-9-_.]*$") then
		cursorword = "https://github.com/" .. cursorword
	end
	return cursorword or ""
end

vim.keymap.set("n", "gx", function()
	vim.fn.jobstart({ open_command, url_repo() }, { detach = true })
end, { silent = true })

-- enable highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

require("gitsigns").setup({
	on_attach = function(bufnr)
		local gitsigns = require("gitsigns")

		local function map(mode, l, r, opts)
			opts = opts or {}
			opts.buffer = bufnr
			vim.keymap.set(mode, l, r, opts)
		end

		-- Navigation
		map("n", "]c", function()
			if vim.wo.diff then
				vim.cmd.normal({ "]c", bang = true })
			else
				gitsigns.nav_hunk("next")
			end
		end)

		map("n", "[c", function()
			if vim.wo.diff then
				vim.cmd.normal({ "[c", bang = true })
			else
				gitsigns.nav_hunk("prev")
			end
		end)

		-- Actions
		map("n", "<leader>gs", gitsigns.stage_hunk)
		map("n", "<leader>gr", gitsigns.reset_hunk)

		map("v", "<leader>gs", function()
			gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
		end)

		map("v", "<leader>gr", function()
			gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
		end)

		map("n", "<leader>gp", gitsigns.preview_hunk)
		map("n", "<leader>gi", gitsigns.preview_hunk_inline)

		map("n", "<leader>gb", function()
			gitsigns.blame_line({ full = true })
		end)

		-- Toggles
		map("n", "<leader>tb", gitsigns.toggle_current_line_blame)
		map("n", "<leader>tw", gitsigns.toggle_word_diff)
	end,
})

-- configure floating terminal
require("toggleterm").setup({
	start_in_insert = true,
	open_mapping = [[<c-\>]],
	terminal_mappings = true,
	direction = "float",
})

function _G.set_terminal_keymaps()
	local opts = { noremap = true }
	vim.api.nvim_buf_set_keymap(0, "t", "<leader><esc>", [[<C-\><C-n>]], opts)
end

vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
