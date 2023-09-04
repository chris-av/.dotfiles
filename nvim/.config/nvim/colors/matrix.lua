vim.cmd "hi clear"
vim.cmd "set termguicolors"

local matrix = {
  Pmenu = { fg = 'black', bg = 'LightGreen' },
  PmenuSel = { fg = 'white', bg = 'LightGreen' },
  NormalFloat = { fg = 'LightGreen', bg = 'none' },
  FloatBorder = { fg = 'LightGreen', bg = 'none' },
  NonText = { fg = 'LightGreen', bg = 'none' },
  CursorLine = { fg = 'none', bg = 'none' },
  LineNr = { fg = 'LightGreen', bg = 'none' },
  CursorLineNr = { bold = true, fg = 'LightGreen' },
  VertSplit = { fg = 'LightGreen', bg = 'none' },
  MatchParen = { bg = 'none' },
  Visual = { fg = 'black', bg = 'LightGreen' },



  Identifier = { fg = 'LightGreen' },
  String = { fg = 'Yellow4', bold = false, },
  Constant = { fg = 'LightGreen', bold = false },
  Comment = { fg = 'Yellow4', bold = false, italic = true  },
  Number = { fg = 'LightGreen', bold = false },
  Function = { fg = 'LightGreen', },
  Folded = { bg = 'none', fg = 'LightGreen', bold = true, italic = true, },

  PreProc = { fg = 'LightGreen', },

  DiagnosticError  = { fg = 'red', bold = true },
  DiagnosticInfo  = { fg = 'blue', bold = true },
  DiagnosticWarn  = { fg = 'yellow', bold = true },
  DiagnosticHint  = { fg = 'LightGreen', bold = true },

  -- bufferline
  BufferLineBufferSelected = { fg = 'LightGreen', bg = 'none', italic = true, bold = true },
  BufferLineBackground = { fg = 'LightGreen', bg = 'none' },
  BufferLineCloseButton = { fg = 'LightGreen', bg = 'none' },
  BufferLineCloseButtonVisible = { fg = 'LightGreen', bg = 'none' },
  BufferLineCloseButtonSelected = { fg = 'LightGreen', bg = 'none' },
  BufferLineInfoVisible = { fg = 'LightGreen', bg = 'none' },
  BufferLineBuffer = { fg = 'LightGreen', bg = 'none' },
  BufferLineBufferVisible = { fg = 'LightGreen', bg = 'none' },

  -- Nvim Tree
  NvimTreeFolderIcon = { fg = 'cyan', bg = 'none' },

  -- GitSigns
  GitSignsAdd = { fg = 'LightGreen', bg = 'none' },
  GitSignsChange = { fg = 'LightGreen', bg = 'none' },
  GitSignsDelete = { bg = 'none' },

  -- Cmp
  CmpItemKind = { fg = 'black', bg = 'none' },

}


local function set_hl(hl_group, highlights)
  vim.api.nvim_set_hl(0, hl_group, highlights)
end




for group, val in pairs(matrix) do
  set_hl(group, val)
end



