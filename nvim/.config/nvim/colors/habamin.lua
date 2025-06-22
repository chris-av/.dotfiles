-- personal port of habamax theme
vim.cmd("hi clear")
vim.g.colors_name = "habamin"

local palette = {
  -- Base colors / background shades
  black        = "#000000", -- absolute black
  bg0          = "#1c1c1c", -- darkest gray (background base)
  bg1          = "#262626", -- background step 1
  bg2          = "#303030", -- background step 2
  bg3          = "#3a3a3a", -- background step 3
  gray         = "#585858", -- neutral gray
  gray_light   = "#767676", -- softer gray
  gray_soft    = "#9e9e9e", -- light midtone gray
  gray_bright  = "#bcbcbc", -- near white gray
  white        = "#dadada", -- bright foreground
  none         = "NONE",   -- for transparency

  -- Accent colors (cool)
  teal         = "#5f8787", -- muted teal (types, attributes)
  blue         = "#5f87af", -- dusty blue
  cyan         = "#5fafd7", -- soft cyan
  aqua         = "#87afaf", -- pale aqua

  -- Accent colors (warm)
  red          = "#af5f5f", -- soft red
  red_bright   = "#d75f5f", -- bright red
  pink         = "#ff00af", -- neon magenta/pink
  pink_soft    = "#d75f87", -- faded pink
  orange       = "#af875f", -- warm orange
  orange_soft  = "#d7af87", -- peachy orange
  yellow       = "#ffaf5f", -- orange-yellow
  green        = "#5faf5f", -- forest green
  green_bright = "#5fff00", -- lime green
  green_soft   = "#5fd75f", -- bright mint
  green_light  = "#87d787", -- light green

  -- Muted blends
  brown_gray   = "#658383", -- earthy desaturated tone
  purple       = "#af87af", -- soft purple
}

local theme = {
  -- UI Core
  primary_bg     = palette.bg0,         -- main background
  secondary_bg   = palette.bg2,         -- subtle alt background
  border         = palette.gray_light,  -- used for splits, borders
  float_bg       = palette.bg0,         -- floating windows
  panel_bg       = palette.bg3,         -- popup menus, panels

  -- Foreground / Text
  primary_fg     = palette.gray_bright,  -- main foreground
  muted_fg       = palette.gray_light,   -- comments, nontext
  subtle_fg      = palette.gray,         -- subtle/less visible

  -- Accent Roles
  accent         = palette.teal,         -- keywords, UI accents
  highlight      = palette.yellow,       -- search highlights
  info           = palette.cyan,         -- info messages
  hint           = palette.aqua,         -- hint messages
  warning        = palette.orange_soft,  -- warnings
  error          = palette.red,          -- error messages
  success        = palette.green_soft,   -- success, additions

  -- Diffs
  diff_add       = palette.green,  -- added lines
  diff_change    = palette.blue,   -- changed lines
  diff_delete    = palette.red,    -- deleted lines

  -- UI Components
  cursor_fg      = palette.black,       -- cursor text color
  cursor_bg      = palette.white,       -- cursor background
  selection_bg   = palette.brown_gray,  -- visual selection
  line_nr        = palette.gray,        -- line numbers
  line_nr_cursor = palette.white,       -- current line nr
  match_paren    = palette.pink,        -- matching parentheses
  search_bg      = palette.yellow,      -- search background
  search_fg      = palette.bg0,         -- search foreground
  incsearch_bg   = palette.orange,      -- incremental search
  folded_bg      = palette.bg1,         -- folded code bg
  folded_fg      = palette.gray_soft,   -- folded code fg

  -- Menu / Tabline
  menu_fg        = palette.gray_light,
  menu_bg        = palette.bg3,
  menu_sel_bg    = palette.gray,
  tabline_bg     = palette.gray_light,
  tabline_fg     = palette.bg0,
  tabline_sel_bg = palette.gray_soft,
  tabline_sel_fg = palette.bg0,
}

local highlight_groups = {
  Added = { fg = palette.green_soft, bg = palette.none, },
  Changed = { fg = palette.yellow, bg = palette.none, },
  Character = { fg = palette.green_light, bg = palette.none, },
  ColorColumn = { fg = palette.none, bg = palette.bg3, },
  Comment = { fg = palette.gray_light, bg = palette.none, },
  Conceal = { fg = palette.gray, bg = palette.none, },
  Constant = { fg = palette.pink_soft, bg = palette.none, },
  CurSearch = { fg = palette.yellow, bg = palette.bg0, reverse = true, },
  Cursor = { fg = palette.black, bg = palette.white, },
  CursorColumn = { fg = palette.none, bg = palette.bg2, },
  CursorLine = {},
  CursorLineNr = { fg = palette.white, bg = palette.none, bold = true, },
  Debug = { fg = palette.teal, bg = palette.none, },
  DiffAdd = { fg = palette.green, bg = palette.none, reverse = true, },
  DiffChange = { fg = palette.blue, bg = palette.none, reverse = true, },
  DiffDelete = { fg = palette.red, bg = palette.none, reverse = true, },
  DiffText = { fg = palette.purple, bg = palette.none, reverse = true, },
  Directory = { fg = palette.aqua, bg = palette.none, bold = true, },
  EndOfBuffer = { fg = palette.gray, bg = palette.none, },
  Error = { fg = palette.red, bg = palette.bg0, reverse = true, },
  ErrorMsg = { fg = palette.red, bg = palette.bg0, reverse = true, },
  FoldColumn = { fg = palette.gray, bg = palette.none, },
  Folded = { fg = palette.gray_soft, bg = "#262626", },
  Identifier = { fg = palette.aqua, bg = palette.none, },
  Ignore = { fg = palette.none, bg = palette.none, },
  IncSearch = { fg = palette.yellow, bg = palette.bg0, reverse = true, },
  LineNr = { fg = palette.gray, bg = palette.none, },
  LineNrAbove = { fg = palette.gray, bg = palette.none, },
  LineNrBelow = { fg = palette.gray, bg = palette.none, },
  MatchParen = { fg = palette.pink, bg = palette.none, bold = true, },
  ModeMsg = { fg = palette.none, bg = palette.none, bold = true, ctermbg = palette.none, },
  MoreMsg = { fg = palette.green, bg = palette.none, },
  NonText = { fg = palette.gray, bg = palette.none, },
  Normal = { fg = palette.gray_bright, bg = palette.bg0, },
  NormalFloat = { bg = palette.bg0, },
  Pmenu = { fg = palette.none, bg = palette.bg3, },
  PmenuExtra = { fg = palette.gray_light, bg = palette.bg3, },
  PmenuExtraSel = { fg = palette.gray_soft, bg = palette.gray, },
  PmenuKind = { fg = palette.teal, bg = palette.bg3, },
  PmenuKindSel = { fg = palette.teal, bg = palette.gray, },
  PmenuMatch = { fg = palette.yellow, bg = palette.bg3, },
  PmenuMatchSel = { fg = palette.yellow, bg = palette.gray, },
  PmenuSbar = { fg = palette.none, bg = palette.none, },
  PmenuSel = { fg = palette.none, bg = palette.gray, },
  PmenuThumb = { fg = palette.none, bg = palette.gray_light, },
  PreProc = { fg = palette.orange, bg = palette.none, ctermfg = 137, ctermbg = "", },
  Question = { fg = palette.orange, bg = palette.none, },
  QuickFixLine = { fg = palette.bg0, bg = palette.blue, },
  Removed = { fg = palette.red_bright, bg = palette.none, },
  Search = { fg = palette.cyan, bg = palette.bg0, reverse = true, },
  SignColumn = { fg = palette.none, bg = palette.none, },
  Special = { fg = palette.teal, bg = palette.none, },
  SpecialKey = { fg = palette.gray, bg = palette.none, },
  SpellBad = { fg = palette.none, bg = palette.none, sp = palette.red_bright, ctermbg = palette.none, },
  SpellCap = { fg = palette.none, bg = palette.none, sp = palette.yellow, ctermbg = palette.none, },
  SpellLocal = { fg = palette.none, bg = palette.none, sp = palette.green_soft, ctermbg = palette.none, },
  SpellRare = { fg = palette.none, bg = palette.none, sp = palette.pink_soft, ctermbg = palette.none, },
  Statement = { fg = palette.purple, bg = palette.none, },
  Statusline = { fg = palette.bg0, bg = palette.gray_soft, },
  StatuslineNC = { fg = palette.bg0, bg = palette.gray_light, },
  String = { fg = palette.green, bg = palette.none, },
  TabLine = { fg = palette.bg0, bg = palette.gray_light, },
  TabLineFill = { fg = palette.bg0, bg = palette.gray_light, },
  TabLineSel = { fg = palette.bg0, bg = palette.gray_soft, bold = true, },
  Title = { fg = palette.none, bg = palette.none, bold = true, ctermbg = palette.none, },
  Todo = { fg = palette.white, bg = palette.none, bold = true, },
  ToolbarButton = { fg = palette.gray_light, bg = palette.bg0, bold = true, reverse = true, },
  ToolbarLine = { fg = palette.none, bg = palette.none, },
  Type = { fg = palette.blue, bg = palette.none, },
  Underlined = { fg = palette.none, bg = palette.none, },
  VertSplit = { fg = palette.gray_light, bg = palette.gray_light, },
  Visual = { fg = palette.brown_gray, bg = palette.bg0, reverse = true, bold = true, },
  VisualNOS = { fg = palette.bg0, bg = palette.teal, },
  WarningMsg = { fg = palette.pink_soft, bg = palette.none, },
  WildMenu = { fg = palette.bg0, bg = palette.orange, bold = true, },
  debugBreakpoint = { fg = palette.bg0, bg = palette.pink_soft, },
  debugPC = { fg = palette.bg0, bg = palette.blue, },
  lCursor = { fg = palette.bg0, bg = palette.green_bright, },

  WinBar = { fg = palette.gray_bright, bg = palette.bg0, bold = true, },
  WinBarNC = { fg = palette.gray_bright, bg = palette.bg0, bold = true, },

  TelescopeSelection = { fg = palette.none, bg = palette.none, },

}


local function set_hl(hl_group, highlights)
  vim.api.nvim_set_hl(0, hl_group, highlights)
end

for group, val in pairs(highlight_groups) do
  set_hl(group, val)
end
