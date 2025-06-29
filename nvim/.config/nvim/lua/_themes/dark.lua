local M = {}

M.palette = {
  black = "#000000",
  white = "#ffffff",
  grey = "#676767",
  darkgrey = "#262626",
  lightgrey = "#c7c7c7",
  green = "#5af78d",
  yellow = "#eeff03",
  red = "#ff5b56",
  orange = "#ffaf00",
  cyan = "#9aecfe",
  blue = "#57c7fe",
  lightblue = "#c1ddff",
  aqua = "#00ffff",
  magenta = "#ff76ff",
  none = "none",
}

M.kitty = {
  -- UI
  foreground = M.palette.white,
  background = M.palette.black,
  selection_foreground = M.palette.black,
  selection_background = M.palette.white,
  cursor = M.palette.lightgrey,
  cursor_text_color = M.palette.black,
  active_border_color = M.palette.green,
  inactive_border_color = M.palette.lightgrey,

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
  background = M.palette.black,

  primary_fg = M.palette.white,
  primary_bg = M.palette.black,
  secondary_fg = M.palette.white,
  secondary_bg = M.palette.black,

  success = M.palette.green,
  warn = M.palette.yellow,
  info = M.palette.blue,
  hint = M.palette.blue,
  error = M.palette.red,

  active = M.palette.green,
  inactive = M.palette.lightgrey,

  selected_fg = M.palette.black,
  selected_bg = M.palette.lightblue,

  border = M.palette.lightgrey,
  popup_fg = M.palette.white,
  popup_bg = M.palette.black,
  icon = M.palette.green,

  add = M.palette.green,
  remove = M.palette.red,
  modified = M.palette.yellow,

  folded_fg = M.palette.green,
  folded_bg = M.palette.black,

}

M.highlight_groups = {
  Normal      = { fg = M.palette.white },
  Comment     = { fg = M.palette.grey, bold = true },
  Constant    = { fg = M.palette.magenta },
  Conditional = { fg = M.palette.green },
  Identifier  = { fg = M.palette.aqua, },
  Include     = { fg = M.palette.green },
  Function    = { fg = M.palette.orange, },
  Keyword     = { fg = M.palette.green },
  Error       = { bg = M.palette.red },
  Directory   = { fg = M.palette.cyan },
  NonText     = { fg = M.palette.none },
  IncSearch   = { bold = true, bg = M.palette.yellow, fg = M.palette.black },
  Search      = { bold = true, fg = M.palette.black, bg = M.palette.yellow },
  Visual      = { bg = M.palette.green, fg = M.palette.black, },
  VisualNOS   = { bold = true },
  Operator    = { fg = M.palette.white },
  Statement   = { fg = M.palette.green },


  -- primitives
  Boolean                       = { fg = M.palette.yellow },
  Number                        = { fg = M.palette.yellow },
  String                        = { fg = M.palette.magenta },

  -- splits, borders and cursor
  VertSplit                     = { fg = M.palette.none, bg = M.palette.none },
  FloatBoarder                  = { fg = M.palette.none },
  WinSeparator                  = { bg = M.palette.none },

  -- tabline
  TabLine                       = { bg = M.palette.grey },
  TabLineSel                    = { bold = true },
  TabLineFill                   = { reverse = true },
  ToolbarLine                   = { bg = M.palette.grey },
  ToolbarButton                 = { bg = M.palette.grey },

  -- visual, selections, line numbers
  Pmenu                         = { bg = M.palette.none },
  PmenuSel                      = { bg = M.palette.grey, },
  PmenuSbar                     = { bg = M.palette.grey },
  PmenuThumb                    = { bg = M.palette.black },
  NormalFloat                   = { fg = M.palette.none, bg = M.palette.none },
  LineNr                        = { fg = M.palette.green, },
  LineNrAbove                   = { fg = M.palette.none, bg = M.palette.none },
  LineNrBelow                   = { fg = M.palette.none, bg = M.palette.none },
  CursorLine                    = { fg = M.palette.none, bg = M.palette.none },
  CursorColumn                  = { bg = M.palette.grey, },
  CursorLineNr                  = { bold = true, fg = M.palette.green },

  -- status line
  StatusLineTerm                = { bg = M.palette.green },
  StatusLineTermNC              = { bg = M.palette.green },
  StatusLine                    = { bold = true },
  StatusLineNC                  = { reverse = true },

  -- spelling?
  SpellBad                      = { sp = M.palette.red },
  SpellCap                      = { sp = M.palette.cyan, },
  SpellRare                     = { sp = M.palette.magenta, },
  SpellLocal                    = { sp = M.palette.cyan },

  -- special
  SpecialKey                    = { fg = M.palette.cyan },
  ErrorMsg                      = { fg = M.palette.red },
  MoreMsg                       = { fg = M.palette.aqua, },
  ModeMsg                       = { bold = true },
  Question                      = { fg = M.palette.green },
  Title                         = { fg = M.palette.magenta, },
  WarningMsg                    = { fg = M.palette.red },
  WildMenu                      = { fg = M.palette.yellow },
  Folded                        = { bg = M.palette.none },
  FoldColumn                    = { bg = M.palette.grey },
  DiffText                      = { bg = M.palette.red },
  Conceal                       = { bg = M.palette.grey, },
  ColorColumn                   = { fg = M.palette.none, },
  MatchParen                    = { fg = M.palette.none, },
  Special                       = { fg = M.palette.green },
  PreProc                       = { fg = M.palette.magenta, },
  Type                          = { fg = M.palette.green, },
  Underlined                    = { fg = M.palette.magenta, },
  Ignore                        = { fg = '' },
  Todo                          = { bg = M.palette.yellow },

  -- use TS highlights
  TSKeyWordFunction             = { bold = true, fg = M.palette.aqua },
  TSMethod                      = { bold = true, fg = M.palette.cyan },
  TSConstructor                 = { bold = true, fg = M.palette.cyan },
  -- TSException =  { fg = '' }, guifg=green
  TSConditional                 = { bold = false, fg = M.palette.green },
  TSRepeat                      = { bold = false, fg = M.palette.green },
  ["@tag"]                      = { fg = M.palette.green, bold = true, },
  ["@tag.attribute"]            = { fg = M.palette.green, },
  ["@constructor"]              = { fg = M.palette.green, bold = true, },

  -- Nvim Tree highlights
  NvimTreeFolderIcon            = { fg = M.palette.cyan },
  NvimTreeExecFile              = { bold = true, fg = M.palette.green },

  -- git signs
  SignColumn                    = { bg = M.palette.none },
  DiffAdd                       = { bg = M.palette.none, fg = M.palette.green },
  DiffChange                    = { bg = M.palette.none, fg = M.palette.cyan, },
  DiffDelete                    = { bg = M.palette.none, fg = M.palette.red },

  -- bufferline
  BufferLineBackground          = { bg = M.palette.none, fg = M.palette.grey },
  BufferLineCloseButton         = { bg = M.palette.none, fg = M.palette.grey },
  BufferLineCloseButtonSelected = { bg = M.palette.none, fg = M.palette.white },
  BufferLineModified            = { bg = M.palette.none, fg = M.palette.grey },
  BufferLineModifiedSelected    = { bg = M.palette.none, fg = M.palette.white },
  BufferLineModifiedVisible     = { bg = M.palette.none, fg = M.palette.grey },

  -- Ufo
  UfoFoldedBg                   = { bg = M.palette.none },
  UfoCursorFoldedLine           = { bg = M.palette.none },
  UfoPreviewSbar                = { bg = M.palette.none },
  UfoPreviewCursorLine          = { bg = M.palette.none },

  -- Telescope
  -- Telescope
  TelescopeSelectionCaret       = { fg = M.palette.black, bg = M.palette.green, bold = true, },
  TelescopeSelection            = { fg = M.palette.black, bg = M.palette.green },
  TelescopeMatching             = { fg = M.palette.black, bold = true, },

}

M.lualine = {
  theme = "auto",
  components = {
    lualine_a = { "mode" },
    lualine_b = { { "branch", icon = " " }, "diff", "diagnostics", },
    lualine_c = { "navic", },
    lualine_x = { "encoding", "fileformat", "filetype" },
    lualine_y = {},
    lualine_z = { "location" }
  },
}

return M
