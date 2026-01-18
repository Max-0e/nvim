local function wrap (cmd)
  return "<cmd>"..cmd.."<cr>"
end

return {
  'lewis6991/gitsigns.nvim',
  keys = { },
  signs ={
    add = { text = '+' },
    change = { text = '~' },
    delete = { text = '_' },
    topdelete = { text = '‾' },
    changedelete = { text = '~' },
  }
}
