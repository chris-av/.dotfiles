local foreground = "#cccccc"
local background = "#0c0c0c"
local selection_fg = "#000000"
local selection_bg = "#cccccc"


local grey = {
  Normal = { fg = foreground, },

  -- Bold = { em = 'bold' },
  -- Italic = { em = 'italic' },
  -- Underlined = { em = 'underline' },

  Visual = { fg = selection_fg, bg = selection_bg, },

  Directory = { fg = foreground, },

  IncSearch = { fg = background, bg = foreground, },
  Search = { fg = background, bg = foreground, bold = true, },
  Substitute = { fg = background, bg = foreground, },

  MatchParen = { fg = foreground, },

  ModeMsg = { fg = foreground, },
  MoreMsg = { fg = foreground, },
  NonText = { fg = foreground, },

  LineNr = { fg = foreground, },
  LineNrAbove = { fg = foreground, },
  LineNrBelow = { fg = foreground, },
  CursorLine = { fg = '', bg = '' },
  CursorLineNr = { fg = foreground, },

  StatusLine = { fg = foreground, },
  StatusLineNC = { fg = 'none', },
  WinSeparator = { fg = foreground, },
  SignColumn = { fg = foreground, },
  Colorcolumn = { fg = foreground, },

  TabLineFill = { fg = foreground, },
  TabLine = { fg = foreground, },
  TabLineSel = { fg = foreground, },

  Pmenu = { fg = foreground, },
  PmenuSel = { fg = background, bg = foreground },
  PmenuSbar = { fg = foreground, },
  Conceal = { fg = foreground, },
  Title = { fg = foreground, },
  Question = { fg = foreground, },
  SpecialKey = { fg = foreground, },
  WildMenu = { fg = foreground, },
  Folded = { fg = foreground, },
  FoldColumn = { fg = foreground, },

  -- Spelling
  -- SpellBad = { em = 'underline' },
  -- SpellLocal = { em = 'underline' },
  -- SpellCap = { em = 'underline' },
  -- SpellRare = { em = 'underline' },

  -- Syntax
  Boolean = { fg = foreground, },
  Character = { fg = foreground, },
  Comment = { fg = foreground, },
  Conditional = { fg = foreground, },
  Constant = { fg = foreground, },
  Define = { fg = foreground, },
  Delimiter = { fg = foreground, },
  Float = { fg = foreground, },
  Function = { fg = foreground, },
  Identifier = { fg = foreground, },
  Include = { fg = foreground, },
  Keyword = { fg = foreground, },
  Label = { fg = foreground, },
  Number = { fg = foreground, },
  Operator = { fg = foreground, },
  PreProc = { fg = foreground, },
  Repeat = { fg = foreground, },
  Special = { fg = foreground, },
  SpecialChar = { fg = foreground, },
  Statement = { fg = foreground, },
  StorageClass = { fg = foreground, },
  String = { fg = foreground, },
  Structure = { fg = foreground, },
  Tag = { fg = foreground, },
  Todo = { fg = foreground, },
  Type = { fg = foreground, },
  Typedef = { fg = foreground, },

  -- TreeSitter
  TSAnnotation = { fg = foreground, },
  TSAttribute = { fg = foreground, },
  TSBoolean = { fg = foreground, },
  TSCharacter = { fg = foreground, },
  TSCharacterSpecial = { fg = foreground, },
  TSComment = { fg = foreground, },
  TSConditional = { fg = foreground, },
  TSConstant = { fg = foreground, },
  TSConstBuiltin = { fg = foreground, },
  TSConstMacro = { fg = foreground, },
  TSConstructor = { fg = foreground, },
  TSDebug = { fg = foreground, },
  TSDefine = { fg = foreground, },
  TSError = { fg = foreground, },
  TSException = { fg = foreground, },
  TSField = { fg = foreground, },
  TSFloat = { fg = foreground, },
  TSFunction = { fg = foreground, },
  TSFuncBuiltin = { fg = foreground, },
  TSFuncMacro = { fg = foreground, },
  TSInclude = { fg = foreground, },
  TSKeyword = { fg = foreground, },
  TSKeywordFunction = { fg = foreground, },
  TSKeywordOperator = { fg = foreground, },
  TSKeywordReturn = { fg = foreground, },
  TSLabel = { fg = foreground, },
  TSMethod = { fg = foreground, },
  TSNamespace = { fg = foreground, },
  TSNone = { fg = foreground, },
  TSNumber = { fg = foreground, },
  TSOperator = { fg = foreground, },
  TSParameter = { fg = foreground, },
  TSParameterReference = { fg = foreground, },
  TSPreProc = { fg = foreground, },
  TSProperty = { fg = foreground, },
  TSPunctDelimiter = { fg = foreground, },
  TSPunctBracket = { fg = foreground, },
  TSPunctSpecial = { fg = foreground, },
  TSRepeat = { fg = foreground, },
  TSStorageClass = { fg = foreground, },
  TSString = { fg = foreground, },
  TSStringRegex = { fg = foreground, },
  TSStringEscape = { fg = foreground, },
  TSStringSpecial = { fg = foreground, },
  TSSymbol = { fg = foreground, },
  TSTag = { fg = foreground, },
  TSTagAttribute = { fg = foreground, },
  TSTagDelimiter = { fg = foreground, },
  TSText = { fg = foreground, },
  -- TSStrong = { em = 'bold' },
  -- TSEmphasis = { em = 'italic' },
  -- TSUnderline = { em = 'underline' },
  -- TSStrike = { em = 'strikethrough' },
  TSTitle = { fg = foreground, },
  TSLiteral = { fg = foreground, },
  TSURI = { fg = foreground, },
  TSMath = { fg = foreground, },
  TSTextReference = { fg = foreground, },
  TSEnvironment = { fg = foreground, },
  TSEnvironmentName = { fg = foreground, },
  TSNote = { fg = foreground, },
  TSWarning = { fg = foreground, },
  TSDanger = { fg = foreground, },
  TSTodo = { fg = foreground, },
  TSType = { fg = foreground, },
  TSTypeBuiltin = { fg = foreground, },
  TSTypeQualifier = { fg = foreground, },
  TSTypeDefinition = { fg = foreground, },
  TSVariable = { fg = foreground, },
  TSVariableBuiltin = { fg = foreground, },

  -- Diff
  DiffAdd = { fg = foreground, },
  DiffAdded = { fg = foreground, },

  DiffDelete = { fg = foreground, },
  DiffRemoved = { fg = foreground, },

  DiffChange = { fg = foreground, },
  DiffText = { fg = foreground, },

  DiffLine = { fg = foreground, },

  -- Telescope
  TelescopeSelectionCaret = { fg = foreground, },
  TelescopeSelection = { fg = foreground, },
  TelescopeMatching = { fg = foreground, },

  -- NvimTree
  NvimTreeFolderIcon = { fg = foreground, },

  -- Netrw
  netrwMarkFile = { fg = foreground, },
}



local function set_hl(hl_group, highlights)
  vim.api.nvim_set_hl(0, hl_group, highlights)
end

for group, val in pairs(grey) do
  set_hl(group, val)
end
