vim.cmd "hi clear"
vim.g.colors_name = "matrix"

local none = 'none'
local black = "#000000"
local green = "LightGreen"
local green_dull = "Yellow4"
local red = "red"
local blue = "blue"
local yellow = "yellow"
local cyan = "cyan"
local purple = "#5f00af"
local navy = "#00005f"

local matrix = {
  Pmenu                            = { fg = black, bg = green },
  PmenuSel                         = { fg = black, bg = green, bold = true, },
  Normal                           = { fg = green, bg = black, },
  NormalFloat                      = { fg = green, bg = none },
  FloatBorder                      = { fg = green, bg = none },
  NonText                          = { fg = green, bg = none },
  CursorLine                       = { fg = none, bg = none },
  LineNr                           = { fg = green, bg = none },
  CursorLineNr                     = { bold = true, fg = green },
  VertSplit                        = { fg = green, bg = none },
  MatchParen                       = { bg = none },
  Visual                           = { fg = black, bg = green },
  Statement                        = { fg = green, bg = none },
  Special                          = { fg = green, bg = none },
  Delimiter                        = { fg = green, bg = none },
  Operator                         = { fg = green, bg = none },
  Identifier                       = { fg = green },
  String                           = { fg = green_dull, bold = false, },
  Constant                         = { fg = green, bold = false },
  Comment                          = { fg = green_dull, bold = false, italic = true },
  Number                           = { fg = green, bold = false },
  Function                         = { fg = green, },
  Folded                           = { bg = none, fg = green, bold = true, italic = true, },
  PreProc                          = { fg = green, },
  DiagnosticError                  = { fg = red, bold = true },
  DiagnosticInfo                   = { fg = blue, bold = true },
  DiagnosticWarn                   = { fg = yellow, bold = true },
  DiagnosticHint                   = { fg = green, bold = true },
  DiffText                         = { fg = green, bg = none, },
  DiffAdd                          = { fg = "white", bg = navy, },
  DiffDelete                       = { fg = "black", bg = red, bold = true, },
  DiffChange                       = { fg = '#ffff00', bg = none, bold = true, },

  -- telescope
  TelescopeMatching                = { fg = black, bg = green, bold = true, },

  -- bufferline
  BufferLineBufferSelected         = { fg = green, bg = none, italic = true, bold = true },
  BufferLineBackground             = { fg = green, bg = none },
  BufferLineCloseButton            = { fg = green, bg = none },
  BufferLineCloseButtonVisible     = { fg = green, bg = none },
  BufferLineCloseButtonSelected    = { fg = green, bg = none },
  BufferLineInfoVisible            = { fg = green, bg = none },
  BufferLineBuffer                 = { fg = green, bg = none },
  BufferLineBufferVisible          = { fg = green, bg = none },

  -- Nvim Tree
  NvimTreeFolderIcon               = { fg = cyan, bg = none },

  -- GitSigns
  GitSignsAdd                      = { fg = green, bg = none },
  GitSignsChange                   = { fg = green, bg = none },
  GitSignsDelete                   = { bg = none },

  -- Cmp
  CmpItemKind                      = { fg = black, bg = none },

  -- treesitter highlights
  ["@lsp.type.class"]              = { fg = green, bg = 'none' },
  ["@lsp.type.comment"]            = { fg = green_dull, bg = 'none' },
  ["@lsp.type.decorator"]          = { fg = green, bg = 'none' },
  ["@lsp.type.enum"]               = { fg = green, bg = 'none' },
  ["@lsp.type.enumMember"]         = { fg = green, bg = 'none' },
  ["@lsp.type.event"]              = { fg = green, bg = 'none' },
  ["@lsp.type.function"]           = { fg = green, bg = 'none' },
  ["@lsp.type.interface"]          = { fg = green, bg = 'none' },
  ["@lsp.type.keyword"]            = { fg = green, bg = 'none' },
  ["@lsp.type.macro"]              = { fg = green, bg = 'none' },
  ["@lsp.type.method"]             = { fg = green, bg = 'none' },
  ["@lsp.type.modifier"]           = { fg = green, bg = 'none' },
  ["@lsp.type.namespace"]          = { fg = green, bg = 'none' },
  ["@lsp.type.number"]             = { fg = green, bg = 'none' },
  ["@lsp.type.operator"]           = { fg = green, bg = 'none' },
  ["@lsp.type.parameter"]          = { fg = green, bg = 'none' },
  ["@lsp.type.property"]           = { fg = green, bg = 'none' },
  ["@lsp.type.regexp"]             = { fg = green, bg = 'none' },
  ["@lsp.type.string"]             = { fg = green, bg = 'none' },
  ["@lsp.type.struct"]             = { fg = green, bg = 'none' },
  ["@lsp.type.type"]               = { fg = green, bg = 'none' },
  ["@lsp.type.typeParameter"]      = { fg = green, bg = 'none' },
  ["@lsp.type.variable"]           = { fg = green, bg = 'none' },
  ["@lsp.mod.abstract"]            = { fg = green, bg = 'none' },
  ["@lsp.mod.async"]               = { fg = green, bg = 'none' },
  ["@lsp.mod.declaration"]         = { fg = green, bg = 'none' },
  ["@lsp.mod.defaultLibrary"]      = { fg = green, bg = 'none' },
  ["@lsp.mod.definition"]          = { fg = green, bg = 'none' },
  ["@lsp.mod.deprecated"]          = { fg = green, bg = 'none' },
  ["@lsp.mod.documentation"]       = { fg = green, bg = 'none' },
  ["@lsp.mod.modification"]        = { fg = green, bg = 'none' },
  ["@lsp.mod.readonly"]            = { fg = green, bg = 'none' },
  ["@lsp.mod.static"]              = { fg = green, bg = 'none' },

  ["@variable"]                    = { fg = green, bg = none, },
  ["@variable.builtin"]            = { fg = green, bg = none },
  ["@variable.parameter"]          = { fg = green, bg = none },
  ["@variable.parameter.builtin"]  = { fg = green, bg = none },
  ["@variable.member"]             = { fg = green, bg = none },
  ["@constant"]                    = { fg = green, bg = none },
  ["@constant.builtin"]            = { fg = green, bg = none },
  ["@constant.macro"]              = { fg = green, bg = none },
  ["@module"]                      = { fg = green, bg = none },
  ["@module.builtin"]              = { fg = green, bg = none },
  ["@label"]                       = { fg = green, bg = none },
  ["@string"]                      = { fg = green_dull, bg = none },
  ["@string.documentation"]        = { fg = green_dull, bg = none },
  ["@string.regexp"]               = { fg = green_dull, bg = none },
  ["@string.escape"]               = { fg = green_dull, bg = none },
  ["@string.special"]              = { fg = green_dull, bg = none },
  ["@string.special.symbol"]       = { fg = green_dull, bg = none },
  ["@string.special.path"]         = { fg = green_dull, bg = none },
  ["@string.special.url"]          = { fg = green_dull, bg = none },
  ["@character"]                   = { fg = green, bg = none },
  ["@character.special"]           = { fg = green, bg = none },
  ["@boolean"]                     = { fg = green, bg = none },
  ["@number"]                      = { fg = green, bg = none },
  ["@number.float"]                = { fg = green, bg = none },
  ["@type"]                        = { fg = green, bg = none },
  ["@type.builtin"]                = { fg = green, bg = none },
  ["@type.definition"]             = { fg = green, bg = none },
  ["@attribute"]                   = { fg = green, bg = none },
  ["@attribute.builtin"]           = { fg = green, bg = none },
  ["@property"]                    = { fg = green, bg = none },
  ["@function"]                    = { fg = green, bg = none },
  ["@function.builtin"]            = { fg = green, bg = none },
  ["@function.call"]               = { fg = green, bg = none },
  ["@function.macro"]              = { fg = green, bg = none },
  ["@function.method"]             = { fg = green, bg = none },
  ["@function.method.call"]        = { fg = green, bg = none },
  ["@constructor"]                 = { fg = green, bg = none },
  ["@operator"]                    = { fg = green, bg = none },
  ["@keyword"]                     = { fg = green, bg = none },
  ["@keyword.coroutine"]           = { fg = green, bg = none },
  ["@keyword.function"]            = { fg = green, bg = none },
  ["@keyword.operator"]            = { fg = green, bg = none },
  ["@keyword.import"]              = { fg = green, bg = none },
  ["@keyword.type"]                = { fg = green, bg = none },
  ["@keyword.modifier"]            = { fg = green, bg = none },
  ["@keyword.repeat"]              = { fg = green, bg = none },
  ["@keyword.return"]              = { fg = green, bg = none },
  ["@keyword.debug"]               = { fg = green, bg = none },
  ["@keyword.exception"]           = { fg = green, bg = none },
  ["@keyword.conditional"]         = { fg = green, bg = none },
  ["@keyword.conditional.ternary"] = { fg = green, bg = none },
  ["@keyword.directive"]           = { fg = green, bg = none },
  ["@keyword.directive.define"]    = { fg = green, bg = none },
  ["@punctuation.delimiter"]       = { fg = green, bg = none },
  ["@punctuation.bracket"]         = { fg = green, bg = none },
  ["@punctuation.special"]         = { fg = green, bg = none },
  ["@comment"]                     = { fg = green_dull, bg = none },
  ["@comment.documentation"]       = { fg = green, bg = none },
  ["@comment.error"]               = { fg = red, bg = none },
  ["@comment.warning"]             = { fg = yellow, bg = none },
  ["@comment.todo"]                = { fg = green, bg = none },
  ["@comment.note"]                = { fg = green, bg = none },
  ["@markup.strong"]               = { fg = green, bg = none },
  ["@markup.italic"]               = { fg = green, bg = none },
  ["@markup.strikethrough"]        = { fg = green, bg = none },
  ["@markup.underline"]            = { fg = green, bg = none },
  ["@markup.heading"]              = { fg = green, bg = none },
  ["@markup.heading.1"]            = { fg = green, bg = none },
  ["@markup.heading.2"]            = { fg = green, bg = none },
  ["@markup.heading.3"]            = { fg = green, bg = none },
  ["@markup.heading.4"]            = { fg = green, bg = none },
  ["@markup.heading.5"]            = { fg = green, bg = none },
  ["@markup.heading.6"]            = { fg = green, bg = none },
  ["@markup.quote"]                = { fg = green, bg = none },
  ["@markup.math"]                 = { fg = green, bg = none },
  ["@markup.link"]                 = { fg = green, bg = none },
  ["@markup.link.label"]           = { fg = green, bg = none },
  ["@markup.link.url"]             = { fg = green, bg = none },
  ["@markup.raw"]                  = { fg = green, bg = none },
  ["@markup.raw.block"]            = { fg = green, bg = none },
  ["@markup.list"]                 = { fg = green, bg = none },
  ["@markup.list.checked"]         = { fg = green, bg = none },
  ["@markup.list.unchecked"]       = { fg = green, bg = none },
  ["@diff.plus"]                   = { fg = green, bg = none },
  ["@diff.minus"]                  = { fg = green, bg = none },
  ["@diff.delta"]                  = { fg = green, bg = none },
  ["@tag"]                         = { fg = green, bg = none },
  ["@tag.builtin"]                 = { fg = green, bg = none },
  ["@tag.attribute"]               = { fg = green, bg = none },
  ["@tag.delimiter"]               = { fg = green, bg = none },


}


local function set_hl(hl_group, highlights)
  vim.api.nvim_set_hl(0, hl_group, highlights)
end




for group, val in pairs(matrix) do
  set_hl(group, val)
end
