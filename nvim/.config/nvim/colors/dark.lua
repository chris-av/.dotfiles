vim.cmd "hi clear"
vim.cmd "set termguicolors"
vim.opt.termguicolors = true



local dark = {
  Normal =  { fg = 'white' },
  Comment =  { fg = 'grey', bold = true },
  Constant =  { fg = '#FF5EFF' },
  Conditional =  { fg = 'lightgreen' },
  Identifier =  { fg = '#40ffff' },
  Include =  { fg = 'lightgreen' },
  Function =  { fg = 'white' },
  Keyword =  { fg = 'lightgreen' },
  Error =  { bg = 'red' },
  Directory =  { fg = 'cyan' },
  NonText =  { fg = 'none' },
  IncSearch =  { bold = true, bg = 'yellow', fg = 'black' },
  Search =  { bold = true, fg = 'black', bg = 'yellow' },
  Visual =  { bg = 'darkgrey', fg = 'black' },
  VisualNOS =  { bold = true },
  Operator =  { fg = 'white' },
  Statement =  { fg = 'lightgreen' },


  -- primitives
  Boolean =  { fg = 'yellow' },
  Number =  { fg = 'yellow' },
  String =  { fg = '#FF5EFF' },

  -- splits, borders and cursor
  VertSplit =  { fg = 'None', bg = 'None' },
  FloatBoarder =  { fg = 'None' },
  WinSeparator =  { bg = 'None' },

  -- tabline
  TabLine =  { bg = 'darkgrey' },
  TabLineSel =  { bold = true },
  TabLineFill =  { reverse = true },
  ToolbarLine =  { bg = 'grey50' },
  ToolbarButton =  { bg = 'lightgrey' },

  -- visual, selections, line numbers
  Pmenu =  { bg = 'None' },
  PmenuSel =  { bg = 'darkgrey' },
  PmenuSbar =  { bg = 'grey' },
  PmenuThumb =  { bg = 'black' },
  NormalFloat =  { fg = 'None', bg = 'None' },
  LineNr =  { fg = '#00EA8C' },
  LineNrAbove =  { fg = 'None', bg = 'None' },
  LineNrBelow =  { fg = 'None', bg = 'None' },
  CursorLine =  { fg = 'None', bg = 'None' },
  CursorColumn =  { bg = 'grey40' },
  CursorLineNr =  { bold = true, fg = 'lightgreen' },

  -- status line
  StatusLineTerm =  { bg = 'lightgreen' },
  StatusLineTermNC =  { bg = 'lightgreen' },
  StatusLine =  { bold = true },
  StatusLineNC =  { reverse = true },

  -- spelling?
  SpellBad =  { sp = 'red' },
  SpellCap =  { sp = 'blue' },
  SpellRare =  { sp = 'magenta' },
  SpellLocal =  { sp = 'cyan' },

  -- special
  SpecialKey =  { fg = 'cyan' },
  ErrorMsg =  { fg = 'red' },
  MoreMsg =  { fg = 'seagreen' },
  ModeMsg =  { bold = true },
  Question =  { fg = 'green' },
  Title =  { fg = 'magenta' },
  WarningMsg =  { fg = 'red' },
  WildMenu =  { fg = 'yellow' },
  Folded =  { bg = 'none' },
  FoldColumn =  { bg = 'grey' },
  DiffText =  { bg = 'red' },
  Conceal =  { bg = 'darkgrey' },
  ColorColumn =  { fg = '' },
  MatchParen =  { fg = '' },
  Special =  { fg = 'white' },
  PreProc =  { fg = '#ff80ff' },
  Type =  { fg = '#60ff60' },
  Underlined =  { fg = '#80a0ff' },
  Ignore =  { fg = '' },
  Todo =  { bg = 'yellow' },

  -- use TS highlights
  TSKeyWordFunction =  { bold = true, fg = '#00ffff' },
  TSMethod =  { bold = true, fg = 'skyblue1' },
  TSConstructor =  { bold = true, fg = 'skyblue1' },
  -- TSException =  { fg = '' }, guifg=lightgreen
  TSConditional =  { bold = false, fg = 'lightgreen' },
  TSRepeat =  { bold = false, fg = 'lightgreen' },
  ["@tag"] = { fg = 'lightgreen', bold = true, },
  ["@tag.attribute"] = { fg = 'green', },
  ["@constructor"] = { fg = 'lightgreen', bold = true, },

  -- Nvim Tree highlights
  NvimTreeFolderIcon =  { fg = 'cyan' },
  NvimTreeExecFile =  { bold = true, fg = 'lightgreen' },

  -- git signs
  SignColumn =  { bg = 'None' },
  DiffAdd =  { bg = 'None', fg = 'lightgreen' },
  DiffChange =  { bg = 'None', fg = 'lightblue' },
  DiffDelete =  { bg = 'None', fg = 'red' },

  -- bufferline
  BufferLineBackground =  { bg = 'None', fg = 'grey' },
  BufferLineCloseButton =  { bg = 'None', fg = 'grey' },
  BufferLineCloseButtonSelected =  { bg = 'None', fg = 'white' },
  BufferLineModified =  { bg = 'None', fg = 'grey' },
  BufferLineModifiedSelected =  { bg = 'None', fg = 'white' },
  BufferLineModifiedVisible =  { bg = 'None', fg = 'grey' },

  -- Ufo
  UfoFoldedBg = { bg = 'none' },
  UfoCursorFoldedLine = { bg = 'none' },
  UfoPreviewSbar = { bg = 'none' },
  UfoPreviewCursorLine = { bg = 'none' },

}



local function set_hl(hl_group, highlights)
  vim.api.nvim_set_hl(0, hl_group, highlights)
end




for group, val in pairs(dark) do
  set_hl(group, val)
end


