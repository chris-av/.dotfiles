local colors = {
  -- Space
  space0      = "#100e23",
  space1      = "#1e1c31",
  space2      = "#2d2b40",
  space3      = "#3e3859",
  space4      = "#585273",
  -- Astral
  astral0     = "#8A889D",
  astral1     = "#cbe3e7",
  -- Nebula
  red         = "#F48FB1",
  dark_red    = "#F02E6E",
  green       = "#A1EFD3",
  dark_green  = "#7fe9c3",
  yellow      = "#ffe6b3",
  dark_yellow = "#F2B482",
  blue        = "#91ddff",
  dark_blue   = "#78a8ff",
  purple      = "#d4bfff",
  dark_purple = "#7676ff",
  cyan        = "#ABF8F7",
  dark_cyan   = "#63f2f1",
  nebula10    = "#78A8ff",
  nebula11    = "#7676ff",

}

-- bg: space0
-- fg: astral1

local lualine_theme = {
  normal = {
    a = { bg = colors.astral1, fg = colors.space1, gui = "bold" },
    b = { bg = colors.space4, fg = colors.cyan },
    c = { bg = colors.space1, fg = colors.astral1 }
  },
  insert = {
    a = { bg = colors.dark_blue, fg = colors.space1, gui = "bold" },
    b = { bg = colors.space1, fg = colors.astral1 },
    c = { bg = colors.space1, fg = colors.astral1 }
  },
  visual = {
    a = { bg = colors.dark_yellow, fg = colors.space1, gui = "bold" },
    b = { bg = colors.space1, fg = colors.astral1 },
    c = { bg = colors.space1, fg = colors.astral1 }
  },
  replace = {
    a = { bg = colors.dark_red, fg = colors.space1, gui = "bold" },
    b = { bg = colors.space1, fg = colors.astral1 },
    c = { bg = colors.space1, fg = colors.astral1 }
  },
  command = {
    a = { bg = colors.dark_red, fg = colors.space1, gui = "bold" },
    b = { bg = colors.space1, fg = colors.astral1 },
    c = { bg = colors.space1, fg = colors.astral1 }
  },
  inactive = {
    a = { bg = colors.space4, fg = colors.cyan, gui = "bold" },
    b = { bg = colors.space1, fg = colors.astral1 },
    c = { bg = colors.space1, fg = colors.astral1 }
  }
}

local lualine_components = {
  lualine_a = { "mode" },
  lualine_b = {
    "branch",
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
