local colors = {
  black        = "black",
  white        = "#000000",
  red          = "#000000",
  green        = "LightGreen",
  blue         = "#000000",
  yellow       = "#000000",
  gray         = "#000000",
  darkgray     = "#000000",
  lightgray    = "#000000",
  inactivegray = "#000000",
}

local lualine_theme = {
  normal = {
    a = { bg = colors.green, fg = colors.black, gui = "bold" },
    b = { bg = colors.green, fg = colors.black },
    c = { bg = colors.green, fg = colors.gray }
  },
  insert = {
    a = { bg = colors.green, fg = colors.black, gui = "bold" },
    b = { bg = colors.green, fg = colors.black },
    c = { bg = colors.green, fg = colors.black }
  },
  visual = {
    a = { bg = colors.green, fg = colors.black, gui = "bold" },
    b = { bg = colors.green, fg = colors.black },
    c = { bg = colors.green, fg = colors.black }
  },
  replace = {
    a = { bg = colors.green, fg = colors.black, gui = "bold" },
    b = { bg = colors.green, fg = colors.black },
    c = { bg = colors.green, fg = colors.black }
  },
  command = {
    a = { bg = colors.green, fg = colors.black, gui = "bold" },
    b = { bg = colors.green, fg = colors.black },
    c = { bg = colors.green, fg = colors.black }
  },
  inactive = {
    a = { bg = colors.green, fg = colors.black, gui = "bold" },
    b = { bg = colors.green, fg = colors.black },
    c = { bg = colors.green, fg = colors.black }
  }
}

local lualine_components = {
  lualine_a = { "mode" },
  lualine_b = {
    "branch",
    "diff",
    {
      "diagnostics",
      diagnostics_color = {
        error = { fg = colors.black, bg = colors.green },
        warn = { fg = colors.black, bg = colors.green },
        info = { fg = colors.black, bg = colors.green },
        hint = { fg = colors.black, bg = colors.green },
      },
    },
  },
  lualine_c = { "navic", },
  lualine_x = { "encoding", "fileformat", "filetype" },
  lualine_y = {},
  lualine_z = { "location" }
}

return {
  theme = lualine_theme,
  components = lualine_components,
}
