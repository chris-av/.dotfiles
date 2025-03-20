vim.cmd "hi clear"
vim.g.colors_name = "dark"

local palette = {
  black = "#000000",
  white = "#ffffff",
  grey = "#676767",
  darkgrey = "#262626",
  lightgrey = "#d0d0d0",
  green = "#5af78d",
  yellow = "#eeff03",
  red = "#ff5b56",
  orange = "#ffaf00",
  cyan = "#9aecfe",
  aqua = "#00ffff",
  magenta = "#ff76ff",

  none = 'none',
}

local p = palette

local highlight_groups = {
  Normal      = { fg = p.white },
  Comment     = { fg = p.grey, bold = true },
  Constant    = { fg = p.magenta },
  Conditional = { fg = p.green },
  Identifier  = { fg = p.aqua, },
  Include     = { fg = p.green },
  Function    = { fg = p.orange, },
  Keyword     = { fg = p.green },
  Error       = { bg = p.red },
  Directory   = { fg = p.cyan },
  NonText     = { fg = p.none },
  IncSearch   = { bold = true, bg = p.yellow, fg = p.black },
  Search      = { bold = true, fg = p.black, bg = p.yellow },
  Visual      = { bg = p.green, fg = p.black, },
  VisualNOS   = { bold = true },
  Operator    = { fg = p.white },
  Statement   = { fg = p.green },


  -- primitives
  Boolean                       = { fg = p.yellow },
  Number                        = { fg = p.yellow },
  String                        = { fg = p.magenta },

  -- splits, borders and cursor
  VertSplit                     = { fg = p.none, bg = p.none },
  FloatBoarder                  = { fg = p.none },
  WinSeparator                  = { bg = p.none },

  -- tabline
  TabLine                       = { bg = p.grey },
  TabLineSel                    = { bold = true },
  TabLineFill                   = { reverse = true },
  ToolbarLine                   = { bg = p.grey },
  ToolbarButton                 = { bg = p.grey },

  -- visual, selections, line numbers
  Pmenu                         = { bg = p.none },
  PmenuSel                      = { bg = p.grey, },
  PmenuSbar                     = { bg = p.grey },
  PmenuThumb                    = { bg = p.black },
  NormalFloat                   = { fg = p.none, bg = p.none },
  LineNr                        = { fg = p.green, },
  LineNrAbove                   = { fg = p.none, bg = p.none },
  LineNrBelow                   = { fg = p.none, bg = p.none },
  CursorLine                    = { fg = p.none, bg = p.none },
  CursorColumn                  = { bg = p.grey, },
  CursorLineNr                  = { bold = true, fg = p.green },

  -- status line
  StatusLineTerm                = { bg = p.green },
  StatusLineTermNC              = { bg = p.green },
  StatusLine                    = { bold = true },
  StatusLineNC                  = { reverse = true },

  -- spelling?
  SpellBad                      = { sp = p.red },
  SpellCap                      = { sp = p.cyan, },
  SpellRare                     = { sp = p.magenta, },
  SpellLocal                    = { sp = p.cyan },

  -- special
  SpecialKey                    = { fg = p.cyan },
  ErrorMsg                      = { fg = p.red },
  MoreMsg                       = { fg = p.aqua, },
  ModeMsg                       = { bold = true },
  Question                      = { fg = p.green },
  Title                         = { fg = p.magenta, },
  WarningMsg                    = { fg = p.red },
  WildMenu                      = { fg = p.yellow },
  Folded                        = { bg = p.none },
  FoldColumn                    = { bg = p.grey },
  DiffText                      = { bg = p.red },
  Conceal                       = { bg = p.grey, },
  ColorColumn                   = { fg = p.none, },
  MatchParen                    = { fg = p.none, },
  Special                       = { fg = p.green },
  PreProc                       = { fg = p.magenta, },
  Type                          = { fg = p.green, },
  Underlined                    = { fg = p.magenta, },
  Ignore                        = { fg = '' },
  Todo                          = { bg = p.yellow },

  -- use TS highlights
  TSKeyWordFunction             = { bold = true, fg = p.aqua },
  TSMethod                      = { bold = true, fg = p.cyan },
  TSConstructor                 = { bold = true, fg = p.cyan },
  -- TSException =  { fg = '' }, guifg=green
  TSConditional                 = { bold = false, fg = p.green },
  TSRepeat                      = { bold = false, fg = p.green },
  ["@tag"]                      = { fg = p.green, bold = true, },
  ["@tag.attribute"]            = { fg = p.green, },
  ["@constructor"]              = { fg = p.green, bold = true, },

  -- Nvim Tree highlights
  NvimTreeFolderIcon            = { fg = p.cyan },
  NvimTreeExecFile              = { bold = true, fg = p.green },

  -- git signs
  SignColumn                    = { bg = p.none },
  DiffAdd                       = { bg = p.none, fg = p.green },
  DiffChange                    = { bg = p.none, fg = p.cyan, },
  DiffDelete                    = { bg = p.none, fg = p.red },

  -- bufferline
  BufferLineBackground          = { bg = p.none, fg = p.grey },
  BufferLineCloseButton         = { bg = p.none, fg = p.grey },
  BufferLineCloseButtonSelected = { bg = p.none, fg = p.white },
  BufferLineModified            = { bg = p.none, fg = p.grey },
  BufferLineModifiedSelected    = { bg = p.none, fg = p.white },
  BufferLineModifiedVisible     = { bg = p.none, fg = p.grey },

  -- Ufo
  UfoFoldedBg                   = { bg = p.none },
  UfoCursorFoldedLine           = { bg = p.none },
  UfoPreviewSbar                = { bg = p.none },
  UfoPreviewCursorLine          = { bg = p.none },

  -- Telescope
  -- Telescope
  TelescopeSelectionCaret       = { fg = p.black, bg = p.green, bold = true, },
  TelescopeSelection            = { fg = p.black, bg = p.green },
  TelescopeMatching             = { fg = p.black, bold = true, },

}


local function set_hl(hl_group, highlights)
  vim.api.nvim_set_hl(0, hl_group, highlights)
end


for group, val in pairs(highlight_groups) do
  set_hl(group, val)
end
