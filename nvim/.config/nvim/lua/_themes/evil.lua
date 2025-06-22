local M = {}

M.palette = {
  foreground = "#FF0000",
  background = "#000000",
  selection_fg = "#000000",
  selection_bg = "#FF0000",
  cursor = "#FF0000",
  cursor_text_color = "#000000",
}

M.theme = {}

M.highlight_groups = {
  Normal = { fg = M.palette.foreground, },

  -- Bold = { em = 'bold' },
  -- Italic = { em = 'italic' },
  -- Underlined = { em = 'underline' },

  Visual = { fg = M.palette.selection_fg, bg = M.palette.selection_bg, },

  Directory = { fg = M.palette.foreground, },

  IncSearch = { fg = M.palette.background, bg = M.palette.foreground, },
  Search = { fg = M.palette.background, bg = M.palette.foreground, bold = true, },
  Substitute = { fg = M.palette.foreground, },

  MatchParen = { fg = M.palette.foreground, },

  ModeMsg = { fg = M.palette.foreground, },
  MoreMsg = { fg = M.palette.foreground, },
  NonText = { fg = M.palette.foreground, },

  LineNr = { fg = M.palette.foreground, },
  LineNrAbove = { fg = M.palette.foreground, },
  LineNrBelow = { fg = M.palette.foreground, },
  CursorLine = { fg = '', bg = '' },
  CursorLineNr = { fg = M.palette.foreground, },

  StatusLine = { fg = M.palette.foreground, },
  StatusLineNC = { fg = 'none', },
  WinSeparator = { fg = M.palette.foreground, },
  SignColumn = { fg = M.palette.foreground, },
  Colorcolumn = { fg = M.palette.foreground, },

  TabLineFill = { fg = M.palette.foreground, },
  TabLine = { fg = M.palette.foreground, },
  TabLineSel = { fg = M.palette.foreground, },

  Pmenu = { fg = M.palette.foreground, },
  PmenuSel = { fg = M.palette.foreground, },
  PmenuSbar = { fg = M.palette.foreground, },
  Conceal = { fg = M.palette.foreground, },
  Title = { fg = M.palette.foreground, },
  Question = { fg = M.palette.foreground, },
  SpecialKey = { fg = M.palette.foreground, },
  WildMenu = { fg = M.palette.foreground, },
  Folded = { fg = M.palette.foreground, },
  FoldColumn = { fg = M.palette.foreground, },

  -- Spelling
  -- SpellBad = { em = 'underline' },
  -- SpellLocal = { em = 'underline' },
  -- SpellCap = { em = 'underline' },
  -- SpellRare = { em = 'underline' },

  -- Syntax
  Boolean = { fg = M.palette.foreground, },
  Character = { fg = M.palette.foreground, },
  Comment = { fg = M.palette.foreground, },
  Conditional = { fg = M.palette.foreground, },
  Constant = { fg = M.palette.foreground, },
  Define = { fg = M.palette.foreground, },
  Delimiter = { fg = M.palette.foreground, },
  Float = { fg = M.palette.foreground, },
  Function = { fg = M.palette.foreground, },
  Identifier = { fg = M.palette.foreground, },
  Include = { fg = M.palette.foreground, },
  Keyword = { fg = M.palette.foreground, },
  Label = { fg = M.palette.foreground, },
  Number = { fg = M.palette.foreground, },
  Operator = { fg = M.palette.foreground, },
  PreProc = { fg = M.palette.foreground, },
  Repeat = { fg = M.palette.foreground, },
  Special = { fg = M.palette.foreground, },
  SpecialChar = { fg = M.palette.foreground, },
  Statement = { fg = M.palette.foreground, },
  StorageClass = { fg = M.palette.foreground, },
  String = { fg = M.palette.foreground, },
  Structure = { fg = M.palette.foreground, },
  Tag = { fg = M.palette.foreground, },
  Todo = { fg = M.palette.foreground, },
  Type = { fg = M.palette.foreground, },
  Typedef = { fg = M.palette.foreground, },

  -- TreeSitter
  TSAnnotation = { fg = M.palette.foreground, },
  TSAttribute = { fg = M.palette.foreground, },
  TSBoolean = { fg = M.palette.foreground, },
  TSCharacter = { fg = M.palette.foreground, },
  TSCharacterSpecial = { fg = M.palette.foreground, },
  TSComment = { fg = M.palette.foreground, },
  TSConditional = { fg = M.palette.foreground, },
  TSConstant = { fg = M.palette.foreground, },
  TSConstBuiltin = { fg = M.palette.foreground, },
  TSConstMacro = { fg = M.palette.foreground, },
  TSConstructor = { fg = M.palette.foreground, },
  TSDebug = { fg = M.palette.foreground, },
  TSDefine = { fg = M.palette.foreground, },
  TSError = { fg = M.palette.foreground, },
  TSException = { fg = M.palette.foreground, },
  TSField = { fg = M.palette.foreground, },
  TSFloat = { fg = M.palette.foreground, },
  TSFunction = { fg = M.palette.foreground, },
  TSFuncBuiltin = { fg = M.palette.foreground, },
  TSFuncMacro = { fg = M.palette.foreground, },
  TSInclude = { fg = M.palette.foreground, },
  TSKeyword = { fg = M.palette.foreground, },
  TSKeywordFunction = { fg = M.palette.foreground, },
  TSKeywordOperator = { fg = M.palette.foreground, },
  TSKeywordReturn = { fg = M.palette.foreground, },
  TSLabel = { fg = M.palette.foreground, },
  TSMethod = { fg = M.palette.foreground, },
  TSNamespace = { fg = M.palette.foreground, },
  TSNone = { fg = M.palette.foreground, },
  TSNumber = { fg = M.palette.foreground, },
  TSOperator = { fg = M.palette.foreground, },
  TSParameter = { fg = M.palette.foreground, },
  TSParameterReference = { fg = M.palette.foreground, },
  TSPreProc = { fg = M.palette.foreground, },
  TSProperty = { fg = M.palette.foreground, },
  TSPunctDelimiter = { fg = M.palette.foreground, },
  TSPunctBracket = { fg = M.palette.foreground, },
  TSPunctSpecial = { fg = M.palette.foreground, },
  TSRepeat = { fg = M.palette.foreground, },
  TSStorageClass = { fg = M.palette.foreground, },
  TSString = { fg = M.palette.foreground, },
  TSStringRegex = { fg = M.palette.foreground, },
  TSStringEscape = { fg = M.palette.foreground, },
  TSStringSpecial = { fg = M.palette.foreground, },
  TSSymbol = { fg = M.palette.foreground, },
  TSTag = { fg = M.palette.foreground, },
  TSTagAttribute = { fg = M.palette.foreground, },
  TSTagDelimiter = { fg = M.palette.foreground, },
  TSText = { fg = M.palette.foreground, },
  -- TSStrong = { em = 'bold' },
  -- TSEmphasis = { em = 'italic' },
  -- TSUnderline = { em = 'underline' },
  -- TSStrike = { em = 'strikethrough' },
  TSTitle = { fg = M.palette.foreground, },
  TSLiteral = { fg = M.palette.foreground, },
  TSURI = { fg = M.palette.foreground, },
  TSMath = { fg = M.palette.foreground, },
  TSTextReference = { fg = M.palette.foreground, },
  TSEnvironment = { fg = M.palette.foreground, },
  TSEnvironmentName = { fg = M.palette.foreground, },
  TSNote = { fg = M.palette.foreground, },
  TSWarning = { fg = M.palette.foreground, },
  TSDanger = { fg = M.palette.foreground, },
  TSTodo = { fg = M.palette.foreground, },
  TSType = { fg = M.palette.foreground, },
  TSTypeBuiltin = { fg = M.palette.foreground, },
  TSTypeQualifier = { fg = M.palette.foreground, },
  TSTypeDefinition = { fg = M.palette.foreground, },
  TSVariable = { fg = M.palette.foreground, },
  TSVariableBuiltin = { fg = M.palette.foreground, },

  -- Diff
  DiffAdd = { fg = M.palette.foreground, },
  DiffAdded = { fg = M.palette.foreground, },

  DiffDelete = { fg = M.palette.foreground, },
  DiffRemoved = { fg = M.palette.foreground, },

  DiffChange = { fg = M.palette.foreground, },
  DiffText = { fg = M.palette.foreground, },

  DiffLine = { fg = M.palette.foreground, },

  -- Telescope
  TelescopeSelectionCaret = { fg = M.palette.foreground, },
  TelescopeSelection = { fg = M.palette.foreground, },
  TelescopeMatching = { fg = M.palette.foreground, },

  -- Netrw
  netrwMarkFile = { fg = M.palette.foreground, },
}

M.lualine = {
  theme = {},
  components = {},
}

return M
