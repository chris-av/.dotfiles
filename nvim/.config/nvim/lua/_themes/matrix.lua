local M = {}
M.palette = {
  none = "none",
  black = "#000000",
  green = "#90ee90",
  green_dull = "#878700",
  red = "#ff0000",
  blue = "#0000ff",
  yellow = "#ffff00",
  cyan = "#00ffff",
  purple = "#5f00af",
  navy = "#00005f",
}

M.kitty = {
  -- UI
  foreground = M.palette.green,
  background = M.palette.black,
  selection_foreground = M.palette.black,
  selection_background = M.palette.green,
  cursor = M.palette.green,
  cursor_text_color = M.palette.black,
  active_border_color = M.palette.green,
  inactive_border_color = M.palette.black,

  -- black
  color0 = M.palette.black,
  color8 = M.palette.black,

  -- red
  color1 = M.palette.green,
  color9 = M.palette.green,

  -- green
  color2 = M.palette.green,
  color10 = M.palette.green,

  -- yellow
  color3 = M.palette.green,
  color11 = M.palette.green,

  -- blue
  color4 = M.palette.green,
  color12 = M.palette.green,

  -- magenta
  color5 = M.palette.green,
  color13 = M.palette.green,

  -- purple
  color6 = M.palette.green,
  color14 = M.palette.green,

  -- white
  color7 = M.palette.green,
  color15 = M.palette.green,
}

M.theme = {
  foreground = M.palette.green,
  background = M.palette.black,

  primary_fg = M.palette.green,
  primary_bg = M.palette.green,
  secondary_fg = M.palette.green,
  secondary_bg = M.palette.green,

  success = M.palette.green,
  warn = M.palette.green,
  info = M.palette.green,
  hint = M.palette.green,
  error = M.palette.red,

  active = M.palette.green,
  inactive = M.palette.green,

  selected_fg = M.palette.black,
  selected_bg = M.palette.green,

  border = M.palette.green,
  popup_fg = M.palette.green,
  popup_bg = M.palette.black,
  icon = M.palette.green,

  add = M.palette.green,
  remove = M.palette.green,
  modified = M.palette.green,

  folded_fg = M.palette.green,
  folded_bg = M.palette.black,

}

M.highlight_groups = {
  Pmenu                            = { fg = M.palette.black, bg = M.palette.green },
  PmenuSel                         = { fg = M.palette.black, bg = M.palette.green, bold = true, },
  Normal                           = { fg = M.palette.green, bg = M.palette.black, },
  NormalFloat                      = { fg = M.palette.green, bg = M.palette.none },
  FloatBorder                      = { fg = M.palette.green, bg = M.palette.none },
  NonText                          = { fg = M.palette.green, bg = M.palette.none },
  CursorLine                       = { fg = M.palette.none, bg = M.palette.none },
  LineNr                           = { fg = M.palette.green, bg = M.palette.none },
  CursorLineNr                     = { bold = true, fg = M.palette.green },
  VertSplit                        = { fg = M.palette.green, bg = M.palette.none },
  MatchParen                       = { bg = M.palette.none },
  Visual                           = { fg = M.palette.black, bg = M.palette.green },
  Statement                        = { fg = M.palette.green, bg = M.palette.none },
  Special                          = { fg = M.palette.green, bg = M.palette.none },
  Delimiter                        = { fg = M.palette.green, bg = M.palette.none },
  Operator                         = { fg = M.palette.green, bg = M.palette.none },
  Identifier                       = { fg = M.palette.green },
  String                           = { fg = M.palette.green_dull, bold = false, },
  Constant                         = { fg = M.palette.green, bold = false },
  Comment                          = { fg = M.palette.green_dull, bold = false, italic = true },
  Number                           = { fg = M.palette.green, bold = false },
  Function                         = { fg = M.palette.green, },
  Folded                           = { bg = M.palette.none, fg = M.palette.green, bold = true, italic = true, },
  PreProc                          = { fg = M.palette.green, },
  DiagnosticError                  = { fg = M.palette.red, bold = true },
  DiagnosticInfo                   = { fg = M.palette.blue, bold = true },
  DiagnosticWarn                   = { fg = M.palette.yellow, bold = true },
  DiagnosticHint                   = { fg = M.palette.green, bold = true },
  DiffText                         = { fg = M.palette.green, bg = M.palette.none, },
  DiffAdd                          = { fg = M.palette.green, bg = M.palette.navy, },
  DiffDelete                       = { fg = M.palette.black, bg = M.palette.red, bold = true, },
  DiffChange                       = { fg = M.palette.green, bg = M.palette.none, bold = true, },

  -- telescope
  TelescopeMatching                = { fg = M.palette.black, bg = M.palette.green, bold = true, },
  TelescopeSelection               = { bg = M.palette.none, },

  -- bufferline
  BufferLineBufferSelected         = { fg = M.palette.green, bg = M.palette.none, italic = true, bold = true },
  BufferLineBackground             = { fg = M.palette.green, bg = M.palette.none },
  BufferLineCloseButton            = { fg = M.palette.green, bg = M.palette.none },
  BufferLineCloseButtonVisible     = { fg = M.palette.green, bg = M.palette.none },
  BufferLineCloseButtonSelected    = { fg = M.palette.green, bg = M.palette.none },
  BufferLineInfoVisible            = { fg = M.palette.green, bg = M.palette.none },
  BufferLineBuffer                 = { fg = M.palette.green, bg = M.palette.none },
  BufferLineBufferVisible          = { fg = M.palette.green, bg = M.palette.none },

  -- Nvim Tree
  NvimTreeFolderIcon               = { fg = M.palette.cyan, bg = M.palette.none },

  -- GitSigns
  GitSignsAdd                      = { fg = M.palette.green, bg = M.palette.none },
  GitSignsChange                   = { fg = M.palette.green, bg = M.palette.none },
  GitSignsDelete                   = { bg = M.palette.none },

  -- Cmp
  CmpItemKind                      = { fg = M.palette.black, bg = M.palette.none },

  -- treesitter highlights
  ["@lsp.type.class"]              = { fg = M.palette.green, bg = M.palette.none },
  ["@lsp.type.comment"]            = { fg = M.palette.green_dull, bg = M.palette.none },
  ["@lsp.type.decorator"]          = { fg = M.palette.green, bg = M.palette.none },
  ["@lsp.type.enum"]               = { fg = M.palette.green, bg = M.palette.none },
  ["@lsp.type.enumMember"]         = { fg = M.palette.green, bg = M.palette.none },
  ["@lsp.type.event"]              = { fg = M.palette.green, bg = M.palette.none },
  ["@lsp.type.function"]           = { fg = M.palette.green, bg = M.palette.none },
  ["@lsp.type.interface"]          = { fg = M.palette.green, bg = M.palette.none },
  ["@lsp.type.keyword"]            = { fg = M.palette.green, bg = M.palette.none },
  ["@lsp.type.macro"]              = { fg = M.palette.green, bg = M.palette.none },
  ["@lsp.type.method"]             = { fg = M.palette.green, bg = M.palette.none },
  ["@lsp.type.modifier"]           = { fg = M.palette.green, bg = M.palette.none },
  ["@lsp.type.namespace"]          = { fg = M.palette.green, bg = M.palette.none },
  ["@lsp.type.number"]             = { fg = M.palette.green, bg = M.palette.none },
  ["@lsp.type.operator"]           = { fg = M.palette.green, bg = M.palette.none },
  ["@lsp.type.parameter"]          = { fg = M.palette.green, bg = M.palette.none },
  ["@lsp.type.property"]           = { fg = M.palette.green, bg = M.palette.none },
  ["@lsp.type.regexp"]             = { fg = M.palette.green, bg = M.palette.none },
  ["@lsp.type.string"]             = { fg = M.palette.green, bg = M.palette.none },
  ["@lsp.type.struct"]             = { fg = M.palette.green, bg = M.palette.none },
  ["@lsp.type.type"]               = { fg = M.palette.green, bg = M.palette.none },
  ["@lsp.type.typeParameter"]      = { fg = M.palette.green, bg = M.palette.none },
  ["@lsp.type.variable"]           = { fg = M.palette.green, bg = M.palette.none },
  ["@lsp.mod.abstract"]            = { fg = M.palette.green, bg = M.palette.none },
  ["@lsp.mod.async"]               = { fg = M.palette.green, bg = M.palette.none },
  ["@lsp.mod.declaration"]         = { fg = M.palette.green, bg = M.palette.none },
  ["@lsp.mod.defaultLibrary"]      = { fg = M.palette.green, bg = M.palette.none },
  ["@lsp.mod.definition"]          = { fg = M.palette.green, bg = M.palette.none },
  ["@lsp.mod.deprecated"]          = { fg = M.palette.green, bg = M.palette.none },
  ["@lsp.mod.documentation"]       = { fg = M.palette.green, bg = M.palette.none },
  ["@lsp.mod.modification"]        = { fg = M.palette.green, bg = M.palette.none },
  ["@lsp.mod.readonly"]            = { fg = M.palette.green, bg = M.palette.none },
  ["@lsp.mod.static"]              = { fg = M.palette.green, bg = M.palette.none },

  ["@variable"]                    = { fg = M.palette.green, bg = M.palette.none, },
  ["@variable.builtin"]            = { fg = M.palette.green, bg = M.palette.none },
  ["@variable.parameter"]          = { fg = M.palette.green, bg = M.palette.none },
  ["@variable.parameter.builtin"]  = { fg = M.palette.green, bg = M.palette.none },
  ["@variable.member"]             = { fg = M.palette.green, bg = M.palette.none },
  ["@constant"]                    = { fg = M.palette.green, bg = M.palette.none },
  ["@constant.builtin"]            = { fg = M.palette.green, bg = M.palette.none },
  ["@constant.macro"]              = { fg = M.palette.green, bg = M.palette.none },
  ["@module"]                      = { fg = M.palette.green, bg = M.palette.none },
  ["@module.builtin"]              = { fg = M.palette.green, bg = M.palette.none },
  ["@label"]                       = { fg = M.palette.green, bg = M.palette.none },
  ["@string"]                      = { fg = M.palette.green_dull, bg = M.palette.none },
  ["@string.documentation"]        = { fg = M.palette.green_dull, bg = M.palette.none },
  ["@string.regexp"]               = { fg = M.palette.green_dull, bg = M.palette.none },
  ["@string.escape"]               = { fg = M.palette.green_dull, bg = M.palette.none },
  ["@string.special"]              = { fg = M.palette.green_dull, bg = M.palette.none },
  ["@string.special.symbol"]       = { fg = M.palette.green_dull, bg = M.palette.none },
  ["@string.special.path"]         = { fg = M.palette.green_dull, bg = M.palette.none },
  ["@string.special.url"]          = { fg = M.palette.green_dull, bg = M.palette.none },
  ["@character"]                   = { fg = M.palette.green, bg = M.palette.none },
  ["@character.special"]           = { fg = M.palette.green, bg = M.palette.none },
  ["@boolean"]                     = { fg = M.palette.green, bg = M.palette.none },
  ["@number"]                      = { fg = M.palette.green, bg = M.palette.none },
  ["@number.float"]                = { fg = M.palette.green, bg = M.palette.none },
  ["@type"]                        = { fg = M.palette.green, bg = M.palette.none },
  ["@type.builtin"]                = { fg = M.palette.green, bg = M.palette.none },
  ["@type.definition"]             = { fg = M.palette.green, bg = M.palette.none },
  ["@attribute"]                   = { fg = M.palette.green, bg = M.palette.none },
  ["@attribute.builtin"]           = { fg = M.palette.green, bg = M.palette.none },
  ["@property"]                    = { fg = M.palette.green, bg = M.palette.none },
  ["@function"]                    = { fg = M.palette.green, bg = M.palette.none },
  ["@function.builtin"]            = { fg = M.palette.green, bg = M.palette.none },
  ["@function.call"]               = { fg = M.palette.green, bg = M.palette.none },
  ["@function.macro"]              = { fg = M.palette.green, bg = M.palette.none },
  ["@function.method"]             = { fg = M.palette.green, bg = M.palette.none },
  ["@function.method.call"]        = { fg = M.palette.green, bg = M.palette.none },
  ["@constructor"]                 = { fg = M.palette.green, bg = M.palette.none },
  ["@operator"]                    = { fg = M.palette.green, bg = M.palette.none },
  ["@keyword"]                     = { fg = M.palette.green, bg = M.palette.none },
  ["@keyword.coroutine"]           = { fg = M.palette.green, bg = M.palette.none },
  ["@keyword.function"]            = { fg = M.palette.green, bg = M.palette.none },
  ["@keyword.operator"]            = { fg = M.palette.green, bg = M.palette.none },
  ["@keyword.import"]              = { fg = M.palette.green, bg = M.palette.none },
  ["@keyword.type"]                = { fg = M.palette.green, bg = M.palette.none },
  ["@keyword.modifier"]            = { fg = M.palette.green, bg = M.palette.none },
  ["@keyword.repeat"]              = { fg = M.palette.green, bg = M.palette.none },
  ["@keyword.return"]              = { fg = M.palette.green, bg = M.palette.none },
  ["@keyword.debug"]               = { fg = M.palette.green, bg = M.palette.none },
  ["@keyword.exception"]           = { fg = M.palette.green, bg = M.palette.none },
  ["@keyword.conditional"]         = { fg = M.palette.green, bg = M.palette.none },
  ["@keyword.conditional.ternary"] = { fg = M.palette.green, bg = M.palette.none },
  ["@keyword.directive"]           = { fg = M.palette.green, bg = M.palette.none },
  ["@keyword.directive.define"]    = { fg = M.palette.green, bg = M.palette.none },
  ["@punctuation.delimiter"]       = { fg = M.palette.green, bg = M.palette.none },
  ["@punctuation.bracket"]         = { fg = M.palette.green, bg = M.palette.none },
  ["@punctuation.special"]         = { fg = M.palette.green, bg = M.palette.none },
  ["@comment"]                     = { fg = M.palette.green_dull, bg = M.palette.none },
  ["@comment.documentation"]       = { fg = M.palette.green, bg = M.palette.none },
  ["@comment.error"]               = { fg = M.palette.red, bg = M.palette.none },
  ["@comment.warning"]             = { fg = M.palette.yellow, bg = M.palette.none },
  ["@comment.todo"]                = { fg = M.palette.green, bg = M.palette.none },
  ["@comment.note"]                = { fg = M.palette.green, bg = M.palette.none },
  ["@markup.strong"]               = { fg = M.palette.green, bg = M.palette.none },
  ["@markup.italic"]               = { fg = M.palette.green, bg = M.palette.none },
  ["@markup.strikethrough"]        = { fg = M.palette.green, bg = M.palette.none },
  ["@markup.underline"]            = { fg = M.palette.green, bg = M.palette.none },
  ["@markup.heading"]              = { fg = M.palette.green, bg = M.palette.none },
  ["@markup.heading.1"]            = { fg = M.palette.green, bg = M.palette.none },
  ["@markup.heading.2"]            = { fg = M.palette.green, bg = M.palette.none },
  ["@markup.heading.3"]            = { fg = M.palette.green, bg = M.palette.none },
  ["@markup.heading.4"]            = { fg = M.palette.green, bg = M.palette.none },
  ["@markup.heading.5"]            = { fg = M.palette.green, bg = M.palette.none },
  ["@markup.heading.6"]            = { fg = M.palette.green, bg = M.palette.none },
  ["@markup.quote"]                = { fg = M.palette.green, bg = M.palette.none },
  ["@markup.math"]                 = { fg = M.palette.green, bg = M.palette.none },
  ["@markup.link"]                 = { fg = M.palette.green, bg = M.palette.none },
  ["@markup.link.label"]           = { fg = M.palette.green, bg = M.palette.none },
  ["@markup.link.url"]             = { fg = M.palette.green, bg = M.palette.none },
  ["@markup.raw"]                  = { fg = M.palette.green, bg = M.palette.none },
  ["@markup.raw.block"]            = { fg = M.palette.green, bg = M.palette.none },
  ["@markup.list"]                 = { fg = M.palette.green, bg = M.palette.none },
  ["@markup.list.checked"]         = { fg = M.palette.green, bg = M.palette.none },
  ["@markup.list.unchecked"]       = { fg = M.palette.green, bg = M.palette.none },
  ["@diff.plus"]                   = { fg = M.palette.green, bg = M.palette.none },
  ["@diff.minus"]                  = { fg = M.palette.green, bg = M.palette.none },
  ["@diff.delta"]                  = { fg = M.palette.green, bg = M.palette.none },
  ["@tag"]                         = { fg = M.palette.green, bg = M.palette.none },
  ["@tag.builtin"]                 = { fg = M.palette.green, bg = M.palette.none },
  ["@tag.attribute"]               = { fg = M.palette.green, bg = M.palette.none },
  ["@tag.delimiter"]               = { fg = M.palette.green, bg = M.palette.none },


}
M.lualine = {
  theme = {
    normal = {
      a = { bg = M.palette.green, fg = M.palette.black, gui = "bold" },
      b = { bg = M.palette.black, fg = M.palette.green },
      c = { bg = M.palette.black, fg = M.palette.green }
    },
    insert = {
      a = { bg = M.palette.green, fg = M.palette.black, gui = "bold" },
      b = { bg = M.palette.black, fg = M.palette.green },
      c = { bg = M.palette.black, fg = M.palette.green }
    },
    visual = {
      a = { bg = M.palette.green, fg = M.palette.black, gui = "bold" },
      b = { bg = M.palette.black, fg = M.palette.green },
      c = { bg = M.palette.black, fg = M.palette.green }
    },
    replace = {
      a = { bg = M.palette.green, fg = M.palette.black, gui = "bold" },
      b = { bg = M.palette.black, fg = M.palette.green },
      c = { bg = M.palette.black, fg = M.palette.green }
    },
    command = {
      a = { bg = M.palette.green, fg = M.palette.black, gui = "bold" },
      b = { bg = M.palette.black, fg = M.palette.green },
      c = { bg = M.palette.black, fg = M.palette.green }
    },
    inactive = {
      a = { bg = M.palette.green, fg = M.palette.black, gui = "bold" },
      b = { bg = M.palette.black, fg = M.palette.green },
      c = { bg = M.palette.black, fg = M.palette.green }
    }
  },
  components = {
    lualine_a = { "mode" },
    lualine_b = {
      { "branch", icon = " " },
      {
        "diff",
        colored = true,
        diff_color = {
          added = { fg = M.palette.green, bg = M.palette.black, },
          modified = { fg = M.palette.green, bg = M.palette.black, },
          deleted = { fg = M.palette.green, bg = M.palette.black, },
        }
      },
      {
        "diagnostics",
        diagnostics_color = {
          error = { fg = M.palette.green, bg = M.palette.black },
          warn = { fg = M.palette.green, bg = M.palette.black },
          info = { fg = M.palette.green, bg = M.palette.black },
          hint = { fg = M.palette.green, bg = M.palette.black },
        },
      },
    },
    lualine_c = { "navic", },
    lualine_x = { "encoding", "fileformat", "filetype" },
    lualine_y = {},
    lualine_z = { "location" }
  },
}

return M
