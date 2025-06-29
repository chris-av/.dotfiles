local M = {}

M.palette = {
  red = "#FF0000",
  black = "#000000",
  none = "none",
}

M.kitty = {
  -- UI
  foreground = M.palette.red,
  background = M.palette.black,
  selection_foreground = M.palette.black,
  selection_background = M.palette.red,
  cursor = M.palette.red,
  cursor_text_color = M.palette.black,
  active_border_color = M.palette.red,
  inactive_border_color = M.palette.black,

  -- black
  color0 = M.palette.black,
  color8 = M.palette.black,

  -- red
  color1 = M.palette.red,
  color9 = M.palette.red,

  -- green
  color2 = M.palette.red,
  color10 = M.palette.red,

  -- yellow
  color3 = M.palette.red,
  color11 = M.palette.red,

  -- blue
  color4 = M.palette.red,
  color12 = M.palette.red,

  -- magenta
  color5 = M.palette.red,
  color13 = M.palette.red,

  -- cyan
  color6 = M.palette.red,
  color14 = M.palette.red,

  -- white
  color7 = M.palette.red,
  color15 = M.palette.red,
}

M.theme = {
  foreground = M.palette.red,
  background = M.palette.black,

  primary_fg = M.palette.red,
  primary_bg = M.palette.black,
  secondary_fg = M.palette.red,
  secondary_bg = M.palette.black,

  success = M.palette.red,
  warn = M.palette.red,
  info = M.palette.red,
  hint = M.palette.red,
  error = M.palette.red,

  active = M.palette.red,
  inactive = M.palette.red,

  selected_fg = M.palette.black,
  selected_bg = M.palette.red,

  border = M.palette.red,
  popup_fg = M.palette.red,
  popup_bg = M.palette.black,
  icon = M.palette.red,

  add = M.palette.red,
  remove = M.palette.red,
  modified = M.palette.red,

  folded_fg = M.palette.red,
  folded_bg = M.palette.black,

}

M.highlight_groups = {
  Normal = { fg = M.palette.red, },

  -- Bold = { em = 'bold' },
  -- Italic = { em = 'italic' },
  -- Underlined = { em = 'underline' },

  Visual = { fg = M.palette.selection_fg, bg = M.palette.selection_bg, },

  Directory = { fg = M.palette.red, },

  IncSearch = { fg = M.palette.black, bg = M.palette.red, },
  Search = { fg = M.palette.black, bg = M.palette.red, bold = true, },
  Substitute = { fg = M.palette.red, },

  MatchParen = { fg = M.palette.red, },

  ModeMsg = { fg = M.palette.red, },
  MoreMsg = { fg = M.palette.red, },
  NonText = { fg = M.palette.red, },

  LineNr = { fg = M.palette.red, },
  LineNrAbove = { fg = M.palette.red, },
  LineNrBelow = { fg = M.palette.red, },
  CursorLine = { fg = '', bg = '' },
  CursorLineNr = { fg = M.palette.red, },

  StatusLine = { fg = M.palette.red, },
  StatusLineNC = { fg = M.palette.none, },
  WinSeparator = { fg = M.palette.red, },
  SignColumn = { fg = M.palette.red, },
  Colorcolumn = { fg = M.palette.red, },

  TabLineFill = { fg = M.palette.red, },
  TabLine = { fg = M.palette.red, },
  TabLineSel = { fg = M.palette.red, },

  Pmenu = { fg = M.palette.red, },
  PmenuSel = { fg = M.palette.red, },
  PmenuSbar = { fg = M.palette.red, },
  Conceal = { fg = M.palette.red, },
  Title = { fg = M.palette.red, },
  Question = { fg = M.palette.red, },
  SpecialKey = { fg = M.palette.red, },
  WildMenu = { fg = M.palette.red, },
  Folded = { fg = M.palette.red, },
  FoldColumn = { fg = M.palette.red, },

  -- Spelling
  -- SpellBad = { em = 'underline' },
  -- SpellLocal = { em = 'underline' },
  -- SpellCap = { em = 'underline' },
  -- SpellRare = { em = 'underline' },

  -- Syntax
  Boolean = { fg = M.palette.red, },
  Character = { fg = M.palette.red, },
  Comment = { fg = M.palette.red, },
  Conditional = { fg = M.palette.red, },
  Constant = { fg = M.palette.red, },
  Define = { fg = M.palette.red, },
  Delimiter = { fg = M.palette.red, },
  Float = { fg = M.palette.red, },
  Function = { fg = M.palette.red, },
  Identifier = { fg = M.palette.red, },
  Include = { fg = M.palette.red, },
  Keyword = { fg = M.palette.red, },
  Label = { fg = M.palette.red, },
  Number = { fg = M.palette.red, },
  Operator = { fg = M.palette.red, },
  PreProc = { fg = M.palette.red, },
  Repeat = { fg = M.palette.red, },
  Special = { fg = M.palette.red, },
  SpecialChar = { fg = M.palette.red, },
  Statement = { fg = M.palette.red, },
  StorageClass = { fg = M.palette.red, },
  String = { fg = M.palette.red, },
  Structure = { fg = M.palette.red, },
  Tag = { fg = M.palette.red, },
  Todo = { fg = M.palette.red, },
  Type = { fg = M.palette.red, },
  Typedef = { fg = M.palette.red, },

  -- TreeSitter
  TSAnnotation = { fg = M.palette.red, },
  TSAttribute = { fg = M.palette.red, },
  TSBoolean = { fg = M.palette.red, },
  TSCharacter = { fg = M.palette.red, },
  TSCharacterSpecial = { fg = M.palette.red, },
  TSComment = { fg = M.palette.red, },
  TSConditional = { fg = M.palette.red, },
  TSConstant = { fg = M.palette.red, },
  TSConstBuiltin = { fg = M.palette.red, },
  TSConstMacro = { fg = M.palette.red, },
  TSConstructor = { fg = M.palette.red, },
  TSDebug = { fg = M.palette.red, },
  TSDefine = { fg = M.palette.red, },
  TSError = { fg = M.palette.red, },
  TSException = { fg = M.palette.red, },
  TSField = { fg = M.palette.red, },
  TSFloat = { fg = M.palette.red, },
  TSFunction = { fg = M.palette.red, },
  TSFuncBuiltin = { fg = M.palette.red, },
  TSFuncMacro = { fg = M.palette.red, },
  TSInclude = { fg = M.palette.red, },
  TSKeyword = { fg = M.palette.red, },
  TSKeywordFunction = { fg = M.palette.red, },
  TSKeywordOperator = { fg = M.palette.red, },
  TSKeywordReturn = { fg = M.palette.red, },
  TSLabel = { fg = M.palette.red, },
  TSMethod = { fg = M.palette.red, },
  TSNamespace = { fg = M.palette.red, },
  TSNone = { fg = M.palette.red, },
  TSNumber = { fg = M.palette.red, },
  TSOperator = { fg = M.palette.red, },
  TSParameter = { fg = M.palette.red, },
  TSParameterReference = { fg = M.palette.red, },
  TSPreProc = { fg = M.palette.red, },
  TSProperty = { fg = M.palette.red, },
  TSPunctDelimiter = { fg = M.palette.red, },
  TSPunctBracket = { fg = M.palette.red, },
  TSPunctSpecial = { fg = M.palette.red, },
  TSRepeat = { fg = M.palette.red, },
  TSStorageClass = { fg = M.palette.red, },
  TSString = { fg = M.palette.red, },
  TSStringRegex = { fg = M.palette.red, },
  TSStringEscape = { fg = M.palette.red, },
  TSStringSpecial = { fg = M.palette.red, },
  TSSymbol = { fg = M.palette.red, },
  TSTag = { fg = M.palette.red, },
  TSTagAttribute = { fg = M.palette.red, },
  TSTagDelimiter = { fg = M.palette.red, },
  TSText = { fg = M.palette.red, },
  -- TSStrong = { em = 'bold' },
  -- TSEmphasis = { em = 'italic' },
  -- TSUnderline = { em = 'underline' },
  -- TSStrike = { em = 'strikethrough' },
  TSTitle = { fg = M.palette.red, },
  TSLiteral = { fg = M.palette.red, },
  TSURI = { fg = M.palette.red, },
  TSMath = { fg = M.palette.red, },
  TSTextReference = { fg = M.palette.red, },
  TSEnvironment = { fg = M.palette.red, },
  TSEnvironmentName = { fg = M.palette.red, },
  TSNote = { fg = M.palette.red, },
  TSWarning = { fg = M.palette.red, },
  TSDanger = { fg = M.palette.red, },
  TSTodo = { fg = M.palette.red, },
  TSType = { fg = M.palette.red, },
  TSTypeBuiltin = { fg = M.palette.red, },
  TSTypeQualifier = { fg = M.palette.red, },
  TSTypeDefinition = { fg = M.palette.red, },
  TSVariable = { fg = M.palette.red, },
  TSVariableBuiltin = { fg = M.palette.red, },

  -- Diff
  DiffAdd = { fg = M.palette.red, },
  DiffAdded = { fg = M.palette.red, },

  DiffDelete = { fg = M.palette.red, },
  DiffRemoved = { fg = M.palette.red, },

  DiffChange = { fg = M.palette.red, },
  DiffText = { fg = M.palette.red, },

  DiffLine = { fg = M.palette.red, },

  -- Telescope
  TelescopeSelectionCaret = { fg = M.palette.red, },
  TelescopeSelection = { fg = M.palette.red, },
  TelescopeMatching = { fg = M.palette.red, },

  -- Netrw
  netrwMarkFile = { fg = M.palette.red, },
}

M.lualine = {
  theme = {},
  components = {},
}

return M
