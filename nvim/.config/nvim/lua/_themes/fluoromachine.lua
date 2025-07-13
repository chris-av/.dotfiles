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

  -- my colors
  space_purple = "#100519",
  white = "#F8F8F8",
  full_white = "#ffffff",
  red_flat = "#FE6973",
  pine_green = "#39795C",
  bright_yellow = "#FFD633",
  pastel_purple = "#BF8AFA",
  magenta = "#FF7EDE",
  magenta2 = "#FF98e2",
  cyan2 = "#81E8FF",

}


M.kitty = {
  -- UI
  foreground = M.palette.teal,
  background = M.palette.space_purple,
  selection_foreground = M.palette.white,
  selection_background = M.palette.darkviolet,
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
  opacity = "0.90",
  foreground = M.palette.teal,
  background = M.palette.space_purple,

  primary_fg = M.palette.teal,
  primary_bg = M.palette.space_purple,
  secondary_fg = M.palette.teal,
  secondary_bg = M.palette.space_purple,

  success = M.palette.green,
  warn = M.palette.yellow,
  info = M.palette.purple,
  hint = M.palette.purple,
  error = M.palette.red,

  active = M.palette.green,
  inactive = M.palette.darkviolet,

  selected_fg = M.palette.white,
  selected_bg = M.palette.darkviolet,

  border = M.palette.bluelavender,
  popup_fg = M.palette.teal,
  popup_bg = M.palette.space_purple,
  icon = M.palette.bluelavender,

  add = M.palette.green,
  remove = M.palette.red,
  modified = M.palette.bluelavender,

  folded_fg = M.palette.teal,
  folded_bg = M.palette.bluelavender,
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
