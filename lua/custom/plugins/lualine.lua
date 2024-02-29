local customTheme = function()
  local colors = {
    primary = '#B5B5B5',
    secondary = '#787878',
    bg = '#292929',
    red = '#6C5959',
    green = '#565D4C',
    yellow = '#676054',
    blue = '#495559',
  }

  return {
    normal = {
      a = { bg = colors.primary, fg = colors.bg, gui = 'bold' },
      b = { bg = colors.bg, fg = colors.primary },
      c = { bg = colors.bg, fg = colors.primary },
    },
    insert = {
      a = { bg = colors.blue, fg = colors.primary, gui = 'bold' },
      b = { bg = colors.bg, fg = colors.primary },
      c = { bg = colors.bg, fg = colors.primary },
    },
    visual = {
      a = { bg = colors.yellow, fg = colors.primary, gui = 'bold' },
      b = { bg = colors.bg, fg = colors.primary },
      c = { bg = colors.bg, fg = colors.primary },
    },
    replace = {
      a = { bg = colors.red, fg = colors.primary, gui = 'bold' },
      b = { bg = colors.bg, fg = colors.primary },
      c = { bg = colors.bg, fg = colors.primary },
    },
    command = {
      a = { bg = colors.green, fg = colors.primary, gui = 'bold' },
      b = { bg = colors.bg, fg = colors.primary },
      c = { bg = colors.bg, fg = colors.primary },
    },
    inactive = {
      a = { bg = colors.bg, fg = colors.primary, gui = 'bold' },
      b = { bg = colors.bg, fg = colors.primary },
      c = { bg = colors.bg, fg = colors.primary },
    },
  }
end

return {
  -- Set lualine as statusline
  'nvim-lualine/lualine.nvim',
  opts = {
    options = {
      icons_enabled = false,
      theme = customTheme,
      component_separators = ' ',
      section_separators = '',
    },
  },
}
