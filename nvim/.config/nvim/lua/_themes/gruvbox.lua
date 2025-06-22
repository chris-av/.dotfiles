local M = {}

M.palette = {
  black = "#000000",
  red = "#fe5b56",
  green = "#5af68d",
  yellow = "#f3f89c",
  blue = "#57c6fe",
  magenta = "#fe69c0",
  cyan = "#9aecfd",
  white = "#f1f0ef",
  orange = "#ffaf00",
  grey = "grey",
  foreground = "#efefea",
  background = "#282935",
  selection_fg = "#000000",
  selection_bg = "#92bbd0",
}

M.theme = {}

M.highlight_groups = {
  Normal                  = { fg = M.palette.foreground, },
  NormalFloat             = { fg = M.palette.foreground, bg = "#282828" },
  Visual                  = { fg = M.palette.selection_fg, bg = M.palette.selection_bg, },
  Directory               = { fg = M.palette.foreground, },
  IncSearch               = { fg = M.palette.background, bg = M.palette.foreground, },
  Search                  = { fg = M.palette.background, bg = M.palette.foreground, bold = true, },
  Substitute              = { fg = M.palette.foreground, },
  MatchParen              = { fg = M.palette.foreground, },
  ModeMsg                 = { fg = M.palette.foreground, },
  MoreMsg                 = { fg = M.palette.foreground, },
  NonText                 = { fg = M.palette.foreground, },
  LineNr                  = { fg = M.palette.yellow, },
  CursorLine              = { fg = '', bg = 'none' },
  CursorLineNr            = { fg = M.palette.yellow, bold = true, },
  StatusLine              = { fg = M.palette.foreground, },
  StatusLineNC            = { fg = M.palette.foreground, },
  WinSeparator            = { fg = M.palette.foreground, },
  SignColumn              = { fg = M.palette.foreground, },
  Colorcolumn             = { fg = M.palette.foreground, },
  TabLineFill             = { fg = M.palette.foreground, },
  TabLine                 = { fg = M.palette.foreground, },
  TabLineSel              = { fg = M.palette.foreground, },
  Pmenu                   = { fg = M.palette.foreground, },
  PmenuSel                = { fg = M.palette.black, bg = M.palette.foreground },
  PmenuSbar               = { fg = M.palette.foreground, },
  Conceal                 = { fg = M.palette.foreground, },
  Title                   = { fg = M.palette.foreground, },
  Question                = { fg = M.palette.foreground, },
  SpecialKey              = { fg = M.palette.foreground, },
  WildMenu                = { fg = M.palette.background, bg = M.palette.orange, },
  Folded                  = { fg = M.palette.foreground, },
  FoldColumn              = { fg = M.palette.foreground, },

  -- Syntax
  Boolean                 = { fg = M.palette.foreground, },
  Character               = { fg = M.palette.foreground, },
  Comment                 = { fg = M.palette.grey, },
  Conditional             = { fg = M.palette.yellow, },
  Constant                = { fg = M.palette.magenta, },
  Define                  = { fg = M.palette.foreground, },
  Delimiter               = { fg = M.palette.foreground, },
  Float                   = { fg = M.palette.foreground, },
  Function                = { fg = M.palette.orange, },
  Identifier              = { fg = M.palette.yellow, },
  Include                 = { fg = M.palette.yellow, },
  Keyword                 = { fg = M.palette.yellow, },
  Label                   = { fg = M.palette.foreground, },
  Number                  = { fg = M.palette.foreground, },
  Operator                = { fg = M.palette.yellow, },
  PreProc                 = { fg = M.palette.foreground, },
  Repeat                  = { fg = M.palette.yellow, },
  Special                 = { fg = M.palette.yellow, },
  SpecialChar             = { fg = M.palette.foreground, },
  Statement               = { fg = M.palette.yellow, },
  StorageClass            = { fg = M.palette.foreground, },
  String                  = { fg = M.palette.magenta, },
  Structure               = { fg = M.palette.yellow, },
  Tag                     = { fg = M.palette.foreground, },
  Todo                    = { fg = M.palette.foreground, },
  Type                    = { fg = M.palette.yellow, },
  Typedef                 = { fg = M.palette.foreground, },

  -- Diff
  DiffAdd                 = { fg = M.palette.black, bg = "#00d7ff" },
  DiffAdded               = { fg = M.palette.yellow, },
  DiffDelete              = { fg = M.palette.foreground, bg = M.palette.red, },
  DiffRemoved             = { fg = M.palette.foreground, bg = M.palette.red, },
  DiffChange              = { fg = M.palette.cyan, },
  DiffText                = { fg = M.palette.foreground, },
  DiffLine                = { fg = M.palette.foreground, },

  -- Telescope
  TelescopeSelectionCaret = { fg = M.palette.foreground, },
  TelescopeSelection      = { fg = M.palette.foreground, },
  TelescopeMatching       = { fg = M.palette.foreground, },

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

