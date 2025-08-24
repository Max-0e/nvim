-- set language
vim.cmd("language en_US")

vim.g.mapleader = "<space>"

require ("config.lazy")

-- remap comment
vim.keymap.set({"n", "v"}, "<space>/", ":norm gcc<CR>")
-- execution while editing configuration
vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")
vim.keymap.set("n", "<space>x", ":.lua<CR>")
vim.keymap.set("v", "<space>x", ":lua<CR>")

-- save and exit
vim.keymap.set("n", "<space>w", ":w<CR>")
vim.keymap.set("n", "<space>q", ":q<CR>")
vim.keymap.set("n", "<space>cb", ":bd<CR>")

-- clear search etc.
vim.keymap.set("n", "<space>cl", ":noh<CR>")

-- buffer navigation
vim.keymap.set("n", "<space>bn", ":bnext<CR>")
vim.keymap.set("n", "<space>bb", ":bprev<CR>")

vim.o.tabstop = 4 -- A TAB character looks like 4 spaces
vim.o.expandtab = true -- Pressing the TAB key will insert spaces instead of a TAB character
vim.o.softtabstop = 4 -- Number of spaces inserted instead of a TAB character
vim.o.shiftwidth = 4 -- Number of spaces inserted when indenting

vim.o.number = true
vim.o.relativenumber = true
vim.o.clipboard = "unnamedplus"

local open_command = 'xdg-open'
if vim.fn.has('mac') == 1 then
  open_command = 'open'
end

local function url_repo()
  local cursorword = vim.fn.expand('<cfile>')
  if string.find(cursorword, '^[a-zA-Z0-9-_.]*/[a-zA-Z0-9-_.]*$') then
    cursorword = 'https://github.com/' .. cursorword
  end
  return cursorword or ''
end

vim.keymap.set('n', 'gx', function()
  vim.fn.jobstart({ open_command, url_repo() }, { detach = true })
end, { silent = true })

-- enable highlight on yank
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

require('gitsigns').setup{
  on_attach = function(bufnr)
    local gitsigns = require('gitsigns')

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map('n', ']c', function()
      if vim.wo.diff then
        vim.cmd.normal({']c', bang = true})
      else
        gitsigns.nav_hunk('next')
      end
    end)

    map('n', '[c', function()
      if vim.wo.diff then
        vim.cmd.normal({'[c', bang = true})
      else
        gitsigns.nav_hunk('prev')
      end
    end)

    -- Actions
    map('n', '<leader>gs', gitsigns.stage_hunk)
    map('n', '<leader>gr', gitsigns.reset_hunk)

    map('v', '<leader>gs', function()
      gitsigns.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
    end)

    map('v', '<leader>gr', function()
      gitsigns.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
    end)

    map('n', '<leader>gp', gitsigns.preview_hunk)
    map('n', '<leader>gi', gitsigns.preview_hunk_inline)

    map('n', '<leader>gb', function()
      gitsigns.blame_line({ full = true })
    end)

    -- Toggles
    map('n', '<leader>tb', gitsigns.toggle_current_line_blame)
    map('n', '<leader>tw', gitsigns.toggle_word_diff)
  end
}

require("bufferline").setup{}

-- configure floating terminal
require("toggleterm").setup{
  start_in_insert = true,
  open_mapping = [[<c-\>]],
  terminal_mappings = true,
  direction =  'float'
}

function _G.set_terminal_keymaps()
  local opts = { noremap = true }
  vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
  -- vim.api.nvim_buf_set_keymap(0, "t", "jk", [[<C-\><C-n>]], opts)
  -- vim.api.nvim_buf_set_keymap(0, "t", "<C-h>", [[<C-\><C-n><C-W>h]], opts)
  -- vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", [[<C-\><C-n><C-W>j]], opts)
  -- vim.api.nvim_buf_set_keymap(0, "t", "<C-k>", [[<C-\><C-n><C-W>k]], opts)
  -- vim.api.nvim_buf_set_keymap(0, "t", "<C-l>", [[<C-\><C-n><C-W>l]], opts)
end

vim.cmd "autocmd! TermOpen term://* lua set_terminal_keymaps()"
