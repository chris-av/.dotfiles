local colors = {
  black        = 'black',
  white        = '#000000',
  red          = '#000000',
  green        = 'LightGreen',
  blue         = '#000000',
  yellow       = '#000000',
  gray         = '#000000',
  darkgray     = '#000000',
  lightgray    = '#000000',
  inactivegray = '#000000',
}
return {
  normal = {
    a = {bg = colors.green, fg = colors.black, gui = 'bold'},
    b = {bg = colors.green, fg = colors.white},
    c = {bg = colors.green, fg = colors.gray}
  },
  insert = {
    a = {bg = colors.green, fg = colors.black, gui = 'bold'},
    b = {bg = colors.green, fg = colors.white},
    c = {bg = colors.green, fg = colors.white}
  },
  visual = {
    a = {bg = colors.green, fg = colors.black, gui = 'bold'},
    b = {bg = colors.green, fg = colors.white},
    c = {bg = colors.green, fg = colors.black}
  },
  replace = {
    a = {bg = colors.green, fg = colors.black, gui = 'bold'},
    b = {bg = colors.green, fg = colors.white},
    c = {bg = colors.green, fg = colors.white}
  },
  command = {
    a = {bg = colors.green, fg = colors.black, gui = 'bold'},
    b = {bg = colors.green, fg = colors.white},
    c = {bg = colors.green, fg = colors.black}
  },
  inactive = {
    a = {bg = colors.green, fg = colors.gray, gui = 'bold'},
    b = {bg = colors.green, fg = colors.gray},
    c = {bg = colors.green, fg = colors.gray}
  }
}
