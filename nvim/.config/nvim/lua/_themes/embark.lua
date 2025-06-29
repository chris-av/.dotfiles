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

M.kitty = {
  -- UI
  foreground = M.palette.astral1,
  background = M.palette.space1,
  selection_foreground = M.palette.astral1,
  selection_background = M.palette.space3,
  cursor = M.palette.green,
  cursor_text_color = M.palette.space1,
  active_border_color = M.palette.green,
  inactive_border_color = M.palette.space4,

  -- black
  color0 = M.palette.space1,
  color8 = M.palette.space4,

  -- red
  color1 = M.palette.red,
  color9 = M.palette.dark_red,

  -- green
  color2 = M.palette.green,
  color10 = M.palette.dark_green,

  -- yellow
  color3 = M.palette.yellow,
  color11 = M.palette.dark_yellow,

  -- blue
  color4 = M.palette.blue,
  color12 = M.palette.dark_blue,

  -- magenta
  color5 = M.palette.purple,
  color13 = M.palette.dark_purple,

  -- cyan
  color6 = M.palette.cyan,
  color14 = M.palette.dark_cyan,

  -- white
  color7 = M.palette.astral1,
  color15 = M.palette.astral0,
}

M.theme = {
  foreground = M.kitty.foreground,
  background = M.kitty.background,

  primary_fg = M.kitty.foreground,
  primary_bg = M.kitty.background,
  secondary_fg = M.kitty.foreground,
  secondary_bg = M.kitty.background,

  success = M.palette.green,
  warn = M.palette.yellow,
  info = M.palette.blue,
  hint = M.palette.cyan,
  error = M.palette.dark_red,

  active = M.palette.green,
  inactive = M.palette.space2,

  selected_fg = M.kitty.selection_foreground,
  selected_bg = M.kitty.selection_background,

  border = M.palette.green,
  popup_fg = M.kitty.foreground,
  popup_bg = M.kitty.background,
  icon = M.palette.blue,

  add = M.palette.green,
  remove = M.palette.red,
  modified = M.palette.yellow,

  folded_fg = M.kitty.foreground,
  folded_bg = M.kitty.background,

}
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
