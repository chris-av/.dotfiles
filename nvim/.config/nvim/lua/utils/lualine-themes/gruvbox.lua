local colors = {
  black        = "#282828",
  white        = "#ebdbb2",
  red          = "#fb4934",
  green        = "#b8bb26",
  blue         = "#83a598",
  yellow       = "#fe8019",
  gray         = "#a89984",
  darkgray     = "#3c3836",
  lightgray    = "#504945",
  inactivegray = "#7c6f64",
}

local lualine_theme = {
  normal = {
    a = { bg = colors.gray, fg = colors.black, gui = "bold" },
    b = { bg = colors.lightgray, fg = colors.white },
    c = { bg = colors.darkgray, fg = colors.gray },
  },
  insert = {
    a = { bg = colors.blue, fg = colors.black, gui = "bold" },
    b = { bg = colors.lightgray, fg = colors.white },
    c = { bg = colors.lightgray, fg = colors.white },
  },
  visual = {
    a = { bg = colors.yellow, fg = colors.black, gui = "bold" },
    b = { bg = colors.lightgray, fg = colors.white },
    c = { bg = colors.inactivegray, fg = colors.black },
  },
  replace = {
    a = { bg = colors.red, fg = colors.black, gui = "bold" },
    b = { bg = colors.lightgray, fg = colors.white },
    c = { bg = colors.black, fg = colors.white },
  },
  command = {
    a = { bg = colors.green, fg = colors.black, gui = "bold" },
    b = { bg = colors.lightgray, fg = colors.white },
    c = { bg = colors.inactivegray, fg = colors.black },
  },
  inactive = {
    a = { bg = colors.darkgray, fg = colors.gray, gui = "bold" },
    b = { bg = colors.darkgray, fg = colors.gray },
    c = { bg = colors.darkgray, fg = colors.gray },
  },
}


local lualine_components = {
  lualine_a = { "mode" },
  lualine_b = {
    { "branch", icon = " " },
    "diff",
  },
  lualine_c = {
  {
      "diagnostics",
      diagnostics_color = {
        error = { fg = colors.cyan, bg = colors.dark_red },
        warn = { fg = colors.space0, bg = colors.dark_yellow },
        info = { fg = colors.cyan, bg = colors.dark_green },
        hint = { fg = colors.cyan, bg = colors.dark_blue },
      },
    },
    "navic",
  },
  lualine_x = { "encoding", "fileformat", "filetype" },
  lualine_y = {},
  lualine_z = { "location" }
}

return {
  theme = lualine_theme,
  components = lualine_components,
}