vim.cmd "hi clear"
vim.g.colors_name = "snazzy"

local black = "#000000"
local red = "#fe5b56"
local green = "#5af68d"
local yellow = "#f3f89c"
local blue = "#57c6fe"
local magenta = "#fe69c0"
local cyan = "#9aecfd"
local white = "#f1f0ef"
local orange = "#ffaf00"
local grey = "grey"


local foreground = "#efefea"
local background = "#282935"
local selection_fg = "#000000"
local selection_bg = "#92bbd0"



local colors = {
  Normal = { fg = foreground, },
  NormalFloat = { fg = foreground, bg = "#282828" },
  Visual = { fg = selection_fg, bg = selection_bg, },
  Directory = { fg = foreground, },
  IncSearch = { fg = background, bg = foreground, },
  Search = { fg = background, bg = foreground, bold = true, },
  Substitute = { fg = foreground, },
  MatchParen = { fg = foreground, },
  ModeMsg = { fg = foreground, },
  MoreMsg = { fg = foreground, },
  NonText = { fg = foreground, },
  LineNr = { fg = yellow, },
  CursorLine = { fg = '', bg = '' },
  -- CursorLineNr = { fg = yellow, bold = true, },
  StatusLine = { fg = foreground, },
  StatusLineNC = { fg = foreground, },
  WinSeparator = { fg = foreground, },
  SignColumn = { fg = foreground, },
  Colorcolumn = { fg = foreground, },
  TabLineFill = { fg = foreground, },
  TabLine = { fg = foreground, },
  TabLineSel = { fg = foreground, },
  Pmenu = { fg = foreground, },
  PmenuSel = { fg = 'black', bg = foreground },
  PmenuSbar = { fg = foreground, },
  Conceal = { fg = foreground, },
  Title = { fg = foreground, },
  Question = { fg = foreground, },
  SpecialKey = { fg = foreground, },
  WildMenu = { fg = background, bg = orange, },
  Folded = { fg = foreground, },
  FoldColumn = { fg = foreground, },

  -- Syntax
  Boolean = { fg = foreground, },
  Character = { fg = foreground, },
  Comment = { fg = grey, },
  Conditional = { fg = yellow, },
  Constant = { fg = magenta, },
  Define = { fg = foreground, },
  Delimiter = { fg = foreground, },
  Float = { fg = foreground, },
  Function = { fg = orange, },
  Identifier = { fg = yellow, },
  Include = { fg = yellow, },
  Keyword = { fg = yellow, },
  Label = { fg = foreground, },
  Number = { fg = foreground, },
  Operator = { fg = yellow, },
  PreProc = { fg = foreground, },
  Repeat = { fg = yellow, },
  Special = { fg = yellow, },
  SpecialChar = { fg = foreground, },
  Statement = { fg = yellow, },
  StorageClass = { fg = foreground, },
  String = { fg = magenta, },
  Structure = { fg = yellow, },
  Tag = { fg = foreground, },
  Todo = { fg = foreground, },
  Type = { fg = yellow, },
  Typedef = { fg = foreground, },

  -- Diff
  DiffAdd = { fg = black, bg = "#00d7ff" },
  DiffAdded = { fg = yellow, },
  DiffDelete = { fg = foreground, bg =red, },
  DiffRemoved = { fg = foreground, bg = red, },
  DiffChange = { fg = cyan, },
  DiffText = { fg = foreground, },
  DiffLine = { fg = foreground, },

  -- Telescope
  TelescopeSelectionCaret = { fg = foreground, },
  TelescopeSelection = { fg = foreground, },
  TelescopeMatching = { fg = foreground, },

  -- NvimTree
  NvimTreeFolderIcon = { fg = cyan, },

  -- other
  ["@tag.tsx"] = { fg = yellow, },

}



local function set_hl(hl_group, highlights)
  vim.api.nvim_set_hl(0, hl_group, highlights)
end

for group, val in pairs(colors) do
  set_hl(group, val)
end
