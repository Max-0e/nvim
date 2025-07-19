local builtin = require('telescope.builtin')

return {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
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
}
