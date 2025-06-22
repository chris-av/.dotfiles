local M = {}

M.palette = {
  black = "#000000",
  grey = "#cccccc"
}

M.theme = {
  foreground = M.grey,
  background = M.black,
  selection_fg = M.black,
  selection_bg = M.grey,
}

M.highlight_groups = {
  Normal = { fg = M.theme.foreground, },
  NormalFloat = { fg = M.theme.foreground, bg = M.theme.background, },

  Visual = { fg = M.theme.selection_fg, bg = M.theme.selection_bg, reverse = true, },

  Directory = { fg = M.theme.foreground, },

  IncSearch = { fg = M.theme.background, bg = M.theme.foreground, },
  Search = { fg = M.theme.background, bg = M.theme.foreground, bold = true, },
  Substitute = { fg = M.theme.background, bg = M.theme.foreground, },

  MatchParen = { fg = M.theme.background, bg = M.theme.foreground, },

  ModeMsg = { fg = M.theme.foreground, },
  MoreMsg = { fg = M.theme.foreground, },
  NonText = { fg = M.theme.foreground, },

  LineNr = { fg = M.theme.foreground, },
  LineNrAbove = { fg = M.theme.foreground, },
  LineNrBelow = { fg = M.theme.foreground, },
  CursorLine = { fg = '', bg = '' },
  CursorLineNr = { fg = M.theme.foreground, },

  StatusLine = { fg = M.theme.foreground, },
  StatusLineNC = { fg = 'none', },
  WinSeparator = { fg = M.theme.foreground, },
  SignColumn = { fg = M.theme.foreground, },
  Colorcolumn = { fg = M.theme.foreground, },

  TabLineFill = { fg = M.theme.foreground, },
  TabLine = { fg = M.theme.foreground, },
  TabLineSel = { fg = M.theme.foreground, },

  Pmenu = { fg = M.theme.foreground, },
  PmenuSel = { fg = M.theme.background, bg = M.theme.foreground },
  PmenuSbar = { fg = M.theme.foreground, },
  Conceal = { fg = M.theme.foreground, },
  Title = { fg = M.theme.foreground, },
  Question = { fg = M.theme.foreground, },
  SpecialKey = { fg = M.theme.foreground, },
  WildMenu = { fg = M.theme.foreground, },
  Folded = { fg = M.theme.foreground, },
  FoldColumn = { fg = M.theme.foreground, },

  -- Spelling
  -- SpellBad = { em = 'underline' },
  -- SpellLocal = { em = 'underline' },
  -- SpellCap = { em = 'underline' },
  -- SpellRare = { em = 'underline' },

  -- Syntax
  Boolean = { fg = M.theme.foreground, },
  Character = { fg = M.theme.foreground, },
  Comment = { fg = M.theme.foreground, },
  Conditional = { fg = M.theme.foreground, },
  Constant = { fg = M.theme.foreground, },
  Define = { fg = M.theme.foreground, },
  Delimiter = { fg = M.theme.foreground, },
  Float = { fg = M.theme.foreground, bg = M.theme.background, },
  Function = { fg = M.theme.foreground, },
  Identifier = { fg = M.theme.foreground, },
  Include = { fg = M.theme.foreground, },
  Keyword = { fg = M.theme.foreground, },
  Label = { fg = M.theme.foreground, },
  Number = { fg = M.theme.foreground, },
  Operator = { fg = M.theme.foreground, },
  PreProc = { fg = M.theme.foreground, },
  Repeat = { fg = M.theme.foreground, },
  Special = { fg = M.theme.foreground, },
  SpecialChar = { fg = M.theme.foreground, },
  Statement = { fg = M.theme.foreground, },
  StorageClass = { fg = M.theme.foreground, },
  String = { fg = M.theme.foreground, },
  Structure = { fg = M.theme.foreground, },
  Tag = { fg = M.theme.foreground, },
  Todo = { fg = M.theme.foreground, },
  Type = { fg = M.theme.foreground, },
  Typedef = { fg = M.theme.foreground, },

  -- TreeSitter
  TSAnnotation = { fg = M.theme.foreground, },
  TSAttribute = { fg = M.theme.foreground, },
  TSBoolean = { fg = M.theme.foreground, },
  TSCharacter = { fg = M.theme.foreground, },
  TSCharacterSpecial = { fg = M.theme.foreground, },
  TSComment = { fg = M.theme.foreground, },
  TSConditional = { fg = M.theme.foreground, },
  TSConstant = { fg = M.theme.foreground, },
  TSConstBuiltin = { fg = M.theme.foreground, },
  TSConstMacro = { fg = M.theme.foreground, },
  TSConstructor = { fg = M.theme.foreground, },
  TSDebug = { fg = M.theme.foreground, },
  TSDefine = { fg = M.theme.foreground, },
  TSError = { fg = M.theme.foreground, },
  TSException = { fg = M.theme.foreground, },
  TSField = { fg = M.theme.foreground, },
  TSFloat = { fg = M.theme.foreground, },
  TSFunction = { fg = M.theme.foreground, },
  TSFuncBuiltin = { fg = M.theme.foreground, },
  TSFuncMacro = { fg = M.theme.foreground, },
  TSInclude = { fg = M.theme.foreground, },
  TSKeyword = { fg = M.theme.foreground, },
  TSKeywordFunction = { fg = M.theme.foreground, },
  TSKeywordOperator = { fg = M.theme.foreground, },
  TSKeywordReturn = { fg = M.theme.foreground, },
  TSLabel = { fg = M.theme.foreground, },
  TSMethod = { fg = M.theme.foreground, },
  TSNamespace = { fg = M.theme.foreground, },
  TSNone = { fg = M.theme.foreground, },
  TSNumber = { fg = M.theme.foreground, },
  TSOperator = { fg = M.theme.foreground, },
  TSParameter = { fg = M.theme.foreground, },
  TSParameterReference = { fg = M.theme.foreground, },
  TSPreProc = { fg = M.theme.foreground, },
  TSProperty = { fg = M.theme.foreground, },
  TSPunctDelimiter = { fg = M.theme.foreground, },
  TSPunctBracket = { fg = M.theme.foreground, },
  TSPunctSpecial = { fg = M.theme.foreground, },
  TSRepeat = { fg = M.theme.foreground, },
  TSStorageClass = { fg = M.theme.foreground, },
  TSString = { fg = M.theme.foreground, },
  TSStringRegex = { fg = M.theme.foreground, },
  TSStringEscape = { fg = M.theme.foreground, },
  TSStringSpecial = { fg = M.theme.foreground, },
  TSSymbol = { fg = M.theme.foreground, },
  TSTag = { fg = M.theme.foreground, },
  TSTagAttribute = { fg = M.theme.foreground, },
  TSTagDelimiter = { fg = M.theme.foreground, },
  TSText = { fg = M.theme.foreground, },
  -- TSStrong = { em = 'bold' },
  -- TSEmphasis = { em = 'italic' },
  -- TSUnderline = { em = 'underline' },
  -- TSStrike = { em = 'strikethrough' },
  TSTitle = { fg = M.theme.foreground, },
  TSLiteral = { fg = M.theme.foreground, },
  TSURI = { fg = M.theme.foreground, },
  TSMath = { fg = M.theme.foreground, },
  TSTextReference = { fg = M.theme.foreground, },
  TSEnvironment = { fg = M.theme.foreground, },
  TSEnvironmentName = { fg = M.theme.foreground, },
  TSNote = { fg = M.theme.foreground, },
  TSWarning = { fg = M.theme.foreground, },
  TSDanger = { fg = M.theme.foreground, },
  TSTodo = { fg = M.theme.foreground, },
  TSType = { fg = M.theme.foreground, },
  TSTypeBuiltin = { fg = M.theme.foreground, },
  TSTypeQualifier = { fg = M.theme.foreground, },
  TSTypeDefinition = { fg = M.theme.foreground, },
  TSVariable = { fg = M.theme.foreground, },
  TSVariableBuiltin = { fg = M.theme.foreground, },

  -- Diff
  DiffAdd = { fg = M.theme.foreground, },
  DiffAdded = { fg = M.theme.foreground, },

  DiffDelete = { fg = M.theme.foreground, },
  DiffRemoved = { fg = M.theme.foreground, },

  DiffChange = { fg = M.theme.foreground, },
  DiffText = { fg = M.theme.foreground, },

  DiffLine = { fg = M.theme.foreground, },

  -- Telescope
  TelescopeSelectionCaret = { fg = M.theme.foreground, },
  TelescopeSelection = { fg = M.theme.foreground, },
  TelescopeMatching = { fg = M.theme.foreground, },

  -- NvimTree
  NvimTreeFolderIcon = { fg = M.theme.foreground, },

  -- Netrw
  netrwMarkFile = { fg = M.theme.foreground, },

  -- Diagnostics
  DiagnosticOk = { fg = M.theme.foreground, },
  DiagnosticHint = { fg = M.theme.foreground, },
  DiagnosticInfo = { fg = M.theme.foreground, },
  DiagnosticWarn = { fg = M.theme.foreground, },
  DiagnosticError = { fg = M.theme.foreground, },

  DiagnosticSignOk = { fg = M.theme.foreground, },
  DiagnosticSignHint = { fg = M.theme.foreground, },
  DiagnosticSignInfo = { fg = M.theme.foreground, },
  DiagnosticSignWarn = { fg = M.theme.foreground, },
  DiagnosticSignError = { fg = M.theme.foreground, },

  DiagnosticFloatingOk = { fg = M.theme.foreground, },
  DiagnosticFloatingHint = { fg = M.theme.foreground, },
  DiagnosticFloatingInfo = { fg = M.theme.foreground, },
  DiagnosticFloatingWarn = { fg = M.theme.foreground, },
  DiagnosticFloatingError = { fg = M.theme.foreground, },

  DiagnosticUnderlineOk = { fg = M.theme.foreground, },
  DiagnosticUnderlineHint = { fg = M.theme.foreground, },
  DiagnosticUnderlineInfo = { fg = M.theme.foreground, },
  DiagnosticUnderlineWarn = { fg = M.theme.foreground, },
  DiagnosticUnderlineError = { fg = M.theme.foreground, },

  DiagnosticVirtualTextOk = { fg = M.theme.foreground, },
  DiagnosticVirtualTextHint = { fg = M.theme.foreground, },
  DiagnosticVirtualTextInfo = { fg = M.theme.foreground, },
  DiagnosticVirtualTextWarn = { fg = M.theme.foreground, },
  DiagnosticVirtualTextError = { fg = M.theme.foreground, },

  -- Git
  Added = { fg = M.theme.foreground, },
  Removed = { fg = M.theme.foreground, },

}

M.lualine = {
  theme = {
    normal = {
      a = { bg = M.palette.grey, fg = M.palette.black, gui = "bold" },
      b = { bg = M.palette.black, fg = M.palette.grey, },
      c = { bg = M.palette.black, fg = M.palette.grey, }
    },
    insert = {
      a = { bg = M.palette.grey, fg = M.palette.black, gui = "bold" },
      b = { bg = M.palette.grey, fg = M.palette.black, },
      c = { bg = M.palette.black, fg = M.palette.grey, }
    },
    visual = {
      a = { bg = M.palette.grey, fg = M.palette.black, gui = "bold" },
      b = { bg = M.palette.black, fg = M.palette.grey, },
      c = { bg = M.palette.black, fg = M.palette.grey, }
    },
    replace = {
      a = { bg = M.palette.grey, fg = M.palette.black, gui = "bold" },
      b = { bg = M.palette.grey, fg = M.palette.black, },
      c = { bg = M.palette.black, fg = M.palette.grey, }
    },
    command = {
      a = { bg = M.palette.grey, fg = M.palette.black, gui = "bold" },
      b = { bg = M.palette.grey, fg = M.palette.black, },
      c = { bg = M.palette.black, fg = M.palette.grey, }
    },
    inactive = {
      a = { bg = M.palette.grey, fg = M.palette.black, gui = "bold" },
      b = { bg = M.palette.grey, fg = M.palette.black, },
      c = { bg = M.palette.black, fg = M.palette.grey, }
    },
  },
  components = {
    lualine_a = { "mode", },
    lualine_b = {
      { "branch", icon = " " },
      {
        "diff",
        colored = true,
        diff_color = {
          added = { fg = M.palette.black, bg = M.palette.grey, },
          modified = { fg = M.palette.black, bg = M.palette.grey, },
          deleted = { fg = M.palette.black, bg = M.palette.grey, },
        },
      },
      {
        "diagnostics",
        diagnostics_color = {
          error = { fg = M.palette.black, bg = M.palette.grey },
          warn = { fg = M.palette.black, bg = M.palette.grey },
          info = { fg = M.palette.black, bg = M.palette.grey },
          hint = { fg = M.palette.black, bg = M.palette.grey },
        },
      },
    },
    lualine_c = { "navic", },
    lualine_x = { "encoding", "fileformat", "filetype" },
    lualine_y = {},
    lualine_z = { "location" },
  },
}

return M
