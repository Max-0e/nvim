-- set language
vim.cmd("language en_US")

-- set leader
local global = vim.g

global.mapleader = "<space>"
global.maplocalleader = "<space>"
global.have_nerd_font = true

local opts = vim.o

opts.tabstop = 2
opts.expandtab = true
opts.softtabstop = 2
opts.shiftwidth = 2
opts.number = true
opts.relativenumber = true
opts.breakindent = true
opts.undofile = true
opts.ignorecase = true
opts.smartcase = true
opts.signcolumn = "yes"
opts.updatetime = 250
opts.timeoutlen = 300
opts.list = true
opts.inccommand = "split"
opts.cursorline = true
opts.scrolloff = 8
opts.confirm = true

-- use schedule to not increase startup time when the clipboard contains a lot of data
vim.schedule(function()
	opts.clipboard = "unnamedplus"
end)

local keymap = vim.keymap.set
local defaultOpts = { noremap = true, silent = true }
local remapOpts = { noremap = false, silent = true }

-- remap comment
keymap({ "n", "v" }, "<space>/", ":norm gcc<CR>", defaultOpts)
-- execution while editing configuration
keymap("n", "<space><space>x", "<cmd>source %<CR>", defaultOpts)
keymap("n", "<space><space>L", "<cmd>Lazy<CR>", defaultOpts)
keymap("n", "<space>x", ":.lua<CR>", defaultOpts)
keymap("v", "<space>x", ":lua<CR>", defaultOpts)
-- save and exit
keymap("n", "<space>w", ":w<CR>", defaultOpts)
keymap("n", "<space>q", ":q<CR>", defaultOpts)
keymap("n", "<space>c", ":bd<CR>", defaultOpts)
-- clear search etc.
keymap("n", "<Esc>", ":noh<CR>", defaultOpts)
-- split navigation
keymap("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
keymap("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
keymap("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
keymap("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })
-- buffer navigation
-- Move to previous/next
keymap("n", "<A-h>", "<Cmd>BufferPrevious<CR>", defaultOpts)
keymap("n", "<A-l>", "<Cmd>BufferNext<CR>", defaultOpts)
-- Goto buffer in position...
keymap("n", "<A-1>", "<Cmd>BufferGoto 1<CR>", defaultOpts)
keymap("n", "<A-2>", "<Cmd>BufferGoto 2<CR>", defaultOpts)
keymap("n", "<A-3>", "<Cmd>BufferGoto 3<CR>", defaultOpts)
keymap("n", "<A-4>", "<Cmd>BufferGoto 4<CR>", defaultOpts)
keymap("n", "<A-5>", "<Cmd>BufferGoto 5<CR>", defaultOpts)
keymap("n", "<A-6>", "<Cmd>BufferGoto 6<CR>", defaultOpts)
keymap("n", "<A-7>", "<Cmd>BufferGoto 7<CR>", defaultOpts)
keymap("n", "<A-8>", "<Cmd>BufferGoto 8<CR>", defaultOpts)
keymap("n", "<A-9>", "<Cmd>BufferGoto 9<CR>", defaultOpts)
keymap("n", "<A-0>", "<Cmd>BufferLast<CR>", defaultOpts)
-- Re-order to previous/next
keymap("n", "<A-H>", "<Cmd>BufferMovePrevious<CR>", defaultOpts)
keymap("n", "<A-L>", "<Cmd>BufferMoveNext<CR>", defaultOpts)
-- close tab
keymap("n", "<C-w>", "<Cmd>BufferClose<CR>", defaultOpts)
-- basic code actions and diagnostics hover
keymap({ "n", "x" }, "<A-.>", function()
	require("tiny-code-action").code_action({})
end, defaultOpts)
keymap("n", "K", function()
	vim.lsp.buf.hover({ border = "rounded" })
end, remapOpts)
keymap("n", "KI", function()
	vim.diagnostic.open_float({ border = "rounded" })
end, remapOpts)

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
keymap("n", "gx", function()
	vim.fn.jobstart({ open_command, url_repo() }, { detach = true })
end, defaultOpts)

require("config.lazy")

-- enable highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
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
