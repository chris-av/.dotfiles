local M = {}

M.palette = {
  black = "#000000",
  white = "#efefea",
  grey = "#686767",
  red = "#fe5b56",
  green = "#5af68d",
  yellow = "#f3f89c",
  blue = "#57c6fe",
  magenta = "#fe69c0",
  cyan = "#9aecfd",
  orange = "#ffaf00",
  dark_teal = "#282935",
  teal = "#92bbd0",
}

M.kitty = {
  foreground = M.palette.white,
  background = M.palette.dark_teal,
  selection_foreground = M.palette.black,
  selection_background = M.palette.teal,
  cursor = M.palette.white,
  cursor_text_color = M.palette.black,
  active_border_color = M.palette.green,
  inactive_border_color = M.palette.dark_teal,

  -- black
  color0 = M.palette.black,
  color8 = M.palette.grey,

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
  color4 = M.palette.blue,
  color12 = M.palette.blue,

  -- magenta
  color5 = M.palette.magenta,
  color13 = M.palette.magenta,

  -- cyan
  color6 = M.palette.cyan,
  color14 = M.palette.cyan,

  -- white
  color7 = M.palette.white,
  color15 = M.palette.white,
}

M.theme = {
  foreground = M.palette.white,
  background = M.palette.dark_teal,

  primary_fg = M.palette.white,
  primary_bg = M.palette.dark_teal,
  secondary_fg = M.palette.white,
  secondary_bg = M.palette.dark_teal,

  success = M.palette.green,
  warn = M.palette.orange,
  info = M.palette.blue,
  hint = M.palette.blue,
  error = M.palette.red,

  active = M.palette.green,
  inactive = M.palette.dark_teal,

  selected_fg = M.palette.black,
  selected_bg = M.palette.white,

  border = M.palette.white,
  popup_fg = M.palette.white,
  popup_bg = M.palette.dark_teal,
  icon = M.palette.green,

  add = M.palette.green,
  remove = M.palette.red,
  modified = M.palette.yellow,

  folded_fg = M.palette.white,
  folded_bg = M.palette.dark_teal,

}


M.highlight_groups = {
  Normal                  = { fg = M.theme.foreground, },
  NormalFloat             = { fg = M.theme.foreground, bg = M.palette.dark_teal },
  Visual                  = { fg = M.palette.selection_fg, bg = M.theme.selected_bg, },
  Directory               = { fg = M.theme.foreground, },
  IncSearch               = { fg = M.palette.background, bg = M.theme.foreground, },
  Search                  = { fg = M.palette.background, bg = M.theme.foreground, bold = true, },
  Substitute              = { fg = M.theme.foreground, },
  MatchParen              = { fg = M.theme.foreground, },
  ModeMsg                 = { fg = M.theme.foreground, },
  MoreMsg                 = { fg = M.theme.foreground, },
  NonText                 = { fg = M.theme.foreground, },
  LineNr                  = { fg = M.palette.yellow, },
  CursorLine              = { fg = '', bg = 'none' },
  CursorLineNr            = { fg = M.palette.yellow, bold = true, },
  StatusLine              = { fg = M.theme.foreground, },
  StatusLineNC            = { fg = M.theme.foreground, },
  WinSeparator            = { fg = M.theme.foreground, },
  SignColumn              = { fg = M.theme.foreground, },
  Colorcolumn             = { fg = M.theme.foreground, },
  TabLineFill             = { fg = M.theme.foreground, },
  TabLine                 = { fg = M.theme.foreground, },
  TabLineSel              = { fg = M.theme.foreground, },
  Pmenu                   = { fg = M.theme.foreground, },
  PmenuSel                = { fg = M.palette.black, bg = M.theme.foreground },
  PmenuSbar               = { fg = M.theme.foreground, },
  Conceal                 = { fg = M.theme.foreground, },
  Title                   = { fg = M.theme.foreground, },
  Question                = { fg = M.theme.foreground, },
  SpecialKey              = { fg = M.theme.foreground, },
  WildMenu                = { fg = M.palette.background, bg = M.palette.orange, },
  Folded                  = { fg = M.theme.foreground, },
  FoldColumn              = { fg = M.theme.foreground, },

  -- Syntax
  Boolean                 = { fg = M.theme.foreground, },
  Character               = { fg = M.theme.foreground, },
  Comment                 = { fg = M.palette.grey, },
  Conditional             = { fg = M.palette.yellow, },
  Constant                = { fg = M.palette.magenta, },
  Define                  = { fg = M.theme.foreground, },
  Delimiter               = { fg = M.theme.foreground, },
  Float                   = { fg = M.theme.foreground, },
  Function                = { fg = M.palette.orange, },
  Identifier              = { fg = M.palette.yellow, },
  Include                 = { fg = M.palette.yellow, },
  Keyword                 = { fg = M.palette.yellow, },
  Label                   = { fg = M.theme.foreground, },
  Number                  = { fg = M.theme.foreground, },
  Operator                = { fg = M.palette.yellow, },
  PreProc                 = { fg = M.theme.foreground, },
  Repeat                  = { fg = M.palette.yellow, },
  Special                 = { fg = M.palette.yellow, },
  SpecialChar             = { fg = M.theme.foreground, },
  Statement               = { fg = M.palette.yellow, },
  StorageClass            = { fg = M.theme.foreground, },
  String                  = { fg = M.palette.magenta, },
  Structure               = { fg = M.palette.yellow, },
  Tag                     = { fg = M.theme.foreground, },
  Todo                    = { fg = M.theme.foreground, },
  Type                    = { fg = M.palette.yellow, },
  Typedef                 = { fg = M.theme.foreground, },

  -- Diff
  DiffAdd                 = { fg = M.palette.black, bg = M.palette.cyan, },
  DiffAdded               = { fg = M.palette.yellow, },
  DiffDelete              = { fg = M.theme.foreground, bg = M.palette.red, },
  DiffRemoved             = { fg = M.theme.foreground, bg = M.palette.red, },
  DiffChange              = { fg = M.palette.cyan, },
  DiffText                = { fg = M.theme.foreground, },
  DiffLine                = { fg = M.theme.foreground, },

  -- Telescope
  TelescopeSelectionCaret = { fg = M.theme.foreground, },
  TelescopeSelection      = { fg = M.theme.foreground, },
  TelescopeMatching       = { fg = M.theme.foreground, },

  -- NvimTree
  NvimTreeFolderIcon      = { fg = M.palette.cyan, },

  -- other
  ["@tag.tsx"]            = { fg = M.palette.yellow, },

}

M.lualine = {
  theme = require("lualine.themes.gruvbox"),
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
