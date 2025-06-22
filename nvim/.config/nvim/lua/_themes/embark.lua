local M = {}
M.palette = {
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
M.theme = {}
M.lualine = {
  theme = {
    normal = {
      a = { bg = M.palette.astral1, fg = M.palette.space1, gui = "bold" },
      b = { bg = M.palette.space4, fg = M.palette.cyan },
      c = { bg = M.palette.space1, fg = M.palette.astral1 }
    },
    insert = {
      a = { bg = M.palette.dark_blue, fg = M.palette.space1, gui = "bold" },
      b = { bg = M.palette.space1, fg = M.palette.astral1 },
      c = { bg = M.palette.space1, fg = M.palette.astral1 }
    },
    visual = {
      a = { bg = M.palette.dark_yellow, fg = M.palette.space1, gui = "bold" },
      b = { bg = M.palette.space1, fg = M.palette.astral1 },
      c = { bg = M.palette.space1, fg = M.palette.astral1 }
    },
    replace = {
      a = { bg = M.palette.dark_red, fg = M.palette.space1, gui = "bold" },
      b = { bg = M.palette.space1, fg = M.palette.astral1 },
      c = { bg = M.palette.space1, fg = M.palette.astral1 }
    },
    command = {
      a = { bg = M.palette.dark_red, fg = M.palette.space1, gui = "bold" },
      b = { bg = M.palette.space1, fg = M.palette.astral1 },
      c = { bg = M.palette.space1, fg = M.palette.astral1 }
    },
    inactive = {
      a = { bg = M.palette.space4, fg = M.palette.cyan, gui = "bold" },
      b = { bg = M.palette.space1, fg = M.palette.astral1 },
      c = { bg = M.palette.space1, fg = M.palette.astral1 }
    }
  },
  components = {
    lualine_a = { "mode" },
    lualine_b = {
      { "branch", icon = " " },
      "diff",
    },
    lualine_c = {
      {
        "diagnostics",
        diagnostics_color = {
          error = { fg = M.palette.cyan, bg = M.palette.dark_red },
          warn = { fg = M.palette.space0, bg = M.palette.dark_yellow },
          info = { fg = M.palette.cyan, bg = M.palette.dark_green },
          hint = { fg = M.palette.cyan, bg = M.palette.dark_blue },
        },
      },
      "navic",
    },
    lualine_x = { "encoding", "fileformat", "filetype" },
    lualine_y = {},
    lualine_z = { "location" }
  },
}

return M
