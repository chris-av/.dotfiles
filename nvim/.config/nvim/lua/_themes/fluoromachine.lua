local M = {}

-- for official palette, refer to : https://github.com/maxmx03/fluoromachine.nvim
M.palette = {
  -- canonical colors
  cyan = "#61E2FF",
  green = "#72F1B8",
  orange = "#FF8B39",
  pink = "#FC199A",
  purple = "#AF6DF9",
  red = "#FE4450",
  yellow = "#FFCC00",
  -- canonical, but I eyeballed a name
  teal = "#8BA7A7",
  indigo = "#262335",
  indigo2 = "#241B2F",
  navy = "#282A36",
  bluelavender = "#495495",
  darkviolet = "#463465",
  lightviolet = "#8C57C7",
}


M.kitty = {
  -- UI
  foreground = M.palette.teal,
  background = M.palette.indigo,
  selection_foreground = M.palette.indigo,
  selection_background = M.palette.teal,
  cursor = M.palette.teal,
  cursor_text_color = M.palette.navy,
  active_border_color = M.palette.teal,
  inactive_border_color = M.palette.indigo,

  -- black
  color0 = M.palette.indigo,
  color8 = M.palette.indigo,

  -- red
  color1 = M.palette.red,
  color9 = M.palette.red,

  -- green
  color2 = M.palette.green,
  color10 = M.palette.green,

  -- yellow
  color3 = M.palette.yellow,
  color11 = M.palette.yellow,

  -- blue
  color4 = M.palette.purple,
  color12 = M.palette.purple,

  -- magenta
  color5 = M.palette.pink,
  color13 = M.palette.pink,

  -- cyan
  color6 = M.palette.cyan,
  color14 = M.palette.cyan,

  -- white
  color7 = M.palette.teal,
  color15 = M.palette.teal,
}

M.theme = {
  foreground = M.palette,
  background = M.palette,

  primary_fg = M.palette,
  primary_bg = M.palette,
  secondary_fg = M.palette,
  secondary_bg = M.palette,

  success = M.palette,
  warn = M.palette,
  info = M.palette,
  hint = M.palette,
  error = M.palette,

  active = M.palette,
  inactive = M.palette,

  selected_fg = M.palette,
  selected_bg = M.palette,

  border = M.palette,
  popup_fg = M.palette,
  popup_bg = M.palette,
  icon = M.palette,

  add = M.palette,
  remove = M.palette,
  modified = M.palette,

  folded_fg = M.palette,
  folded_bg = M.palette,
}

M.lualine = {
  theme = {
    command = {
      a = { bg = "#262335", fg = "#FF8B39", gui = "bold", },
      b = { bg = "#7f451c", fg = "#FF8B39", }
    },
    insert = {
      a = { bg = "#262335", fg = "#FFCC00", gui = "bold", },
      b = { bg = "#7f6600", fg = "#FFCC00" }
    },
    normal = {
      a = { bg = "#262335", fg = "#AF6DF9", gui = "bold", },
      b = { bg = "#57367c", fg = "#AF6DF9", },
      c = { bg = "#241B2F", fg = "#8BA7A7", },
    },
    replace = {
      a = { bg = "#262335", fg = "#FE4450", gui = "bold" },
      b = { bg = "#7f2228", fg = "#FE4450" }
    },
    visual = {
      a = { bg = "#262335", fg = "#61E2FF", gui = "bold" },
      b = { bg = "#30717f", fg = "#61E2FF" }
    }
  },
  components = {
    lualine_a = { "mode" },
    lualine_b = {
      { "branch", icon = " " },
      "diff",
    },
    lualine_c = { "diagnostics", "navic", },
    lualine_x = { "encoding", "fileformat", "filetype" },
    lualine_y = { "" },
    lualine_z = { "location" }
  },
}

return M
