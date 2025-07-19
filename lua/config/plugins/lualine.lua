local colors = {
  blue   = '#8aadf4',
  cyan   = '#8bd5ca',
  black  = '#080808',
  white  = '#c6c6c6',
  red    = '#ed8796',
  violet = '#c6a0f6',
  grey   = '#303030',
}

local my_theme = {
  normal = {
    a = { fg = colors.black, bg = colors.violet },
    b = { fg = colors.white, bg = colors.grey },
    c = { fg = colors.white },
  },

  insert = { a = { fg = colors.black, bg = colors.blue } },
  visual = { a = { fg = colors.black, bg = colors.cyan } },
  replace = { a = { fg = colors.black, bg = colors.red } },

  inactive = {
    a = { fg = colors.white, bg = colors.black },
    b = { fg = colors.white, bg = colors.black },
    c = { fg = colors.white },
  },
}

local leftSeperator = { left = '█', right = '' }
local rightSeperator = { right = '█', left = '' }


local sections = {
  lualine_a = { 
      { 'mode', separator = leftSeperator, right_padding = 2 } 
  },
  lualine_b = { 
      { 'filename', separator = leftSeperator }, 
      { 'branch', separator = leftSeperator }
  },
  lualine_c = {
    '%=', --[[ add your center components here in place of this comment ]]
  },
  lualine_x = {},
  lualine_y = { 
      { 'filetype', seperator = rightSeperator, right_padding = 2 }, 
      'progress'
  },
  lualine_z = {
    { 'location', separator = rightSeperator, left_padding = 2 }
  }
}

return {
    { 
        'nvim-lualine/lualine.nvim',
        config = function() 
            require('lualine').setup {
                theme = my_theme,
                component_separators = { left = '', right = '' },
                section_separators = { left = '', right = '' },
                sections = sections
            }
        end
    }
}
