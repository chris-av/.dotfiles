vim.cmd "hi clear"
vim.g.colors_name = "snazzy"

local palette = {
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

local p = palette
local highlight_groups = {
  Normal                  = { fg = p.foreground, },
  NormalFloat             = { fg = p.foreground, bg = "#282828" },
  Visual                  = { fg = p.selection_fg, bg = p.selection_bg, },
  Directory               = { fg = p.foreground, },
  IncSearch               = { fg = p.background, bg = p.foreground, },
  Search                  = { fg = p.background, bg = p.foreground, bold = true, },
  Substitute              = { fg = p.foreground, },
  MatchParen              = { fg = p.foreground, },
  ModeMsg                 = { fg = p.foreground, },
  MoreMsg                 = { fg = p.foreground, },
  NonText                 = { fg = p.foreground, },
  LineNr                  = { fg = p.yellow, },
  CursorLine              = { fg = '', bg = '' },
  CursorLineNr            = { fg = p.yellow, bold = true, },
  StatusLine              = { fg = p.foreground, },
  StatusLineNC            = { fg = p.foreground, },
  WinSeparator            = { fg = p.foreground, },
  SignColumn              = { fg = p.foreground, },
  Colorcolumn             = { fg = p.foreground, },
  TabLineFill             = { fg = p.foreground, },
  TabLine                 = { fg = p.foreground, },
  TabLineSel              = { fg = p.foreground, },
  Pmenu                   = { fg = p.foreground, },
  PmenuSel                = { fg = p.black, bg = p.foreground },
  PmenuSbar               = { fg = p.foreground, },
  Conceal                 = { fg = p.foreground, },
  Title                   = { fg = p.foreground, },
  Question                = { fg = p.foreground, },
  SpecialKey              = { fg = p.foreground, },
  WildMenu                = { fg = p.background, bg = p.orange, },
  Folded                  = { fg = p.foreground, },
  FoldColumn              = { fg = p.foreground, },

  -- Syntax
  Boolean                 = { fg = p.foreground, },
  Character               = { fg = p.foreground, },
  Comment                 = { fg = p.grey, },
  Conditional             = { fg = p.yellow, },
  Constant                = { fg = p.magenta, },
  Define                  = { fg = p.foreground, },
  Delimiter               = { fg = p.foreground, },
  Float                   = { fg = p.foreground, },
  Function                = { fg = p.orange, },
  Identifier              = { fg = p.yellow, },
  Include                 = { fg = p.yellow, },
  Keyword                 = { fg = p.yellow, },
  Label                   = { fg = p.foreground, },
  Number                  = { fg = p.foreground, },
  Operator                = { fg = p.yellow, },
  PreProc                 = { fg = p.foreground, },
  Repeat                  = { fg = p.yellow, },
  Special                 = { fg = p.yellow, },
  SpecialChar             = { fg = p.foreground, },
  Statement               = { fg = p.yellow, },
  StorageClass            = { fg = p.foreground, },
  String                  = { fg = p.magenta, },
  Structure               = { fg = p.yellow, },
  Tag                     = { fg = p.foreground, },
  Todo                    = { fg = p.foreground, },
  Type                    = { fg = p.yellow, },
  Typedef                 = { fg = p.foreground, },

  -- Diff
  DiffAdd                 = { fg = p.black, bg = "#00d7ff" },
  DiffAdded               = { fg = p.yellow, },
  DiffDelete              = { fg = p.foreground, bg = p.red, },
  DiffRemoved             = { fg = p.foreground, bg = p.red, },
  DiffChange              = { fg = p.cyan, },
  DiffText                = { fg = p.foreground, },
  DiffLine                = { fg = p.foreground, },

  -- Telescope
  TelescopeSelectionCaret = { fg = p.foreground, },
  TelescopeSelection      = { fg = p.foreground, },
  TelescopeMatching       = { fg = p.foreground, },

  -- NvimTree
  NvimTreeFolderIcon      = { fg = p.cyan, },

  -- other
  ["@tag.tsx"]            = { fg = p.yellow, },

}



local function set_hl(hl_group, highlights)
  vim.api.nvim_set_hl(0, hl_group, highlights)
end

for group, val in pairs(highlight_groups) do
  set_hl(group, val)
end
