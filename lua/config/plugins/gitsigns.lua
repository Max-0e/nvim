local function wrap (cmd)
  return "<cmd>"..cmd.."<cr>"
end

return {
  'lewis6991/gitsigns.nvim',
  keys = {
    -- {
      -- "<leader>gs",
      -- mode = { "n" },
      -- wrap("stage_hunk"),
      -- desc = "Stage the current hunk",
    -- },
    -- {
      -- "<leader>gr",
      -- mode = { "n" },
      -- wrap("reset_hunk"),
      -- desc = "Reset the current hunk",
    -- },
    -- {
      -- "<leader>gp",
      -- mode = { "n" },
      -- wrap("preview_hunk"),
      -- desc = "Preview the current hunk",
    -- },
    -- {
      -- "<leader>gi",
      -- mode = { "n" },
      -- wrap("preview_hunk_inline"),
      -- desc = "Reset the current hunk inline",
    -- },
  }
}

    -- {
      -- "<leader>gs",
      -- mode = { "v" },
      -- function() gitsigns.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') }) end,
      -- desc = "Stage the selected part of the current hunk",
    -- },
    -- {
      -- "<leader>gr",
      -- mode = { "v" },
      -- function() gitsigns.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') }) end,
      -- desc = "Reset the selected part of the current hunk",
    -- },
    -- {
      -- "<leader>gb",
      -- mode = { "n" },
      -- function() gitsigns.blame_line({ full = true }) end,
      -- desc = "Reset the selected part of the current hunk",
    -- }
