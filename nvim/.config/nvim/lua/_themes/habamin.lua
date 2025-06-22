local M = {}

M.palette = {
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
  none         = "NONE",    -- for transparency

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

M.theme = {
  -- UI Core
  primary_bg     = M.palette.bg0,        -- main background
  secondary_bg   = M.palette.bg2,        -- subtle alt background
  border         = M.palette.gray_light, -- used for splits, borders
  float_bg       = M.palette.bg0,        -- floating windows
  panel_bg       = M.palette.bg3,        -- popup menus, panels

  -- Foreground / Text
  primary_fg     = M.palette.gray_bright, -- main foreground
  muted_fg       = M.palette.gray_light,  -- comments, nontext
  subtle_fg      = M.palette.gray,        -- subtle/less visible

  -- Accent Roles
  accent         = M.palette.teal,        -- keywords, UI accents
  highlight      = M.palette.yellow,      -- search highlights
  info           = M.palette.cyan,        -- info messages
  hint           = M.palette.aqua,        -- hint messages
  warning        = M.palette.orange_soft, -- warnings
  error          = M.palette.red,         -- error messages
  success        = M.palette.green_soft,  -- success, additions

  -- Diffs
  diff_add       = M.palette.green, -- added lines
  diff_change    = M.palette.blue,  -- changed lines
  diff_delete    = M.palette.red,   -- deleted lines

  -- UI Components
  cursor_fg      = M.palette.black,      -- cursor text color
  cursor_bg      = M.palette.white,      -- cursor background
  selection_bg   = M.palette.brown_gray, -- visual selection
  line_nr        = M.palette.gray,       -- line numbers
  line_nr_cursor = M.palette.white,      -- current line nr
  match_paren    = M.palette.pink,       -- matching parentheses
  search_bg      = M.palette.yellow,     -- search background
  search_fg      = M.palette.bg0,        -- search foreground
  incsearch_bg   = M.palette.orange,     -- incremental search
  folded_bg      = M.palette.bg1,        -- folded code bg
  folded_fg      = M.palette.gray_soft,  -- folded code fg

  -- Menu / Tabline
  menu_fg        = M.palette.gray_light,
  menu_bg        = M.palette.bg3,
  menu_sel_bg    = M.palette.gray,
  tabline_bg     = M.palette.gray_light,
  tabline_fg     = M.palette.bg0,
  tabline_sel_bg = M.palette.gray_soft,
  tabline_sel_fg = M.palette.bg0,
}

M.highlight_groups = {
  Added = { fg = M.palette.green_soft, bg = M.palette.none, },
  Changed = { fg = M.palette.yellow, bg = M.palette.none, },
  Character = { fg = M.palette.green_light, bg = M.palette.none, },
  ColorColumn = { fg = M.palette.none, bg = M.palette.bg3, },
  Comment = { fg = M.palette.gray_light, bg = M.palette.none, },
  Conceal = { fg = M.palette.gray, bg = M.palette.none, },
  Constant = { fg = M.palette.pink_soft, bg = M.palette.none, },
  CurSearch = { fg = M.palette.yellow, bg = M.palette.bg0, reverse = true, },
  Cursor = { fg = M.palette.black, bg = M.palette.white, },
  CursorColumn = { fg = M.palette.none, bg = M.palette.bg2, },
  CursorLine = {},
  CursorLineNr = { fg = M.palette.white, bg = M.palette.none, bold = true, },
  Debug = { fg = M.palette.teal, bg = M.palette.none, },
  DiffAdd = { fg = M.palette.green, bg = M.palette.none, reverse = true, },
  DiffChange = { fg = M.palette.blue, bg = M.palette.none, reverse = true, },
  DiffDelete = { fg = M.palette.red, bg = M.palette.none, reverse = true, },
  DiffText = { fg = M.palette.purple, bg = M.palette.none, reverse = true, },
  Directory = { fg = M.palette.aqua, bg = M.palette.none, bold = true, },
  EndOfBuffer = { fg = M.palette.gray, bg = M.palette.none, },
  Error = { fg = M.palette.red, bg = M.palette.bg0, reverse = true, },
  ErrorMsg = { fg = M.palette.red, bg = M.palette.bg0, reverse = true, },
  FoldColumn = { fg = M.palette.gray, bg = M.palette.none, },
  Folded = { fg = M.palette.gray_soft, bg = "#262626", },
  Identifier = { fg = M.palette.aqua, bg = M.palette.none, },
  Ignore = { fg = M.palette.none, bg = M.palette.none, },
  IncSearch = { fg = M.palette.yellow, bg = M.palette.bg0, reverse = true, },
  LineNr = { fg = M.palette.gray, bg = M.palette.none, },
  LineNrAbove = { fg = M.palette.gray, bg = M.palette.none, },
  LineNrBelow = { fg = M.palette.gray, bg = M.palette.none, },
  MatchParen = { fg = M.palette.pink, bg = M.palette.none, bold = true, },
  ModeMsg = { fg = M.palette.none, bg = M.palette.none, bold = true, ctermbg = M.palette.none, },
  MoreMsg = { fg = M.palette.green, bg = M.palette.none, },
  NonText = { fg = M.palette.gray, bg = M.palette.none, },
  Normal = { fg = M.palette.gray_bright, bg = M.palette.bg0, },
  NormalFloat = { bg = M.palette.bg0, },
  Pmenu = { fg = M.palette.none, bg = M.palette.bg3, },
  PmenuExtra = { fg = M.palette.gray_light, bg = M.palette.bg3, },
  PmenuExtraSel = { fg = M.palette.gray_soft, bg = M.palette.gray, },
  PmenuKind = { fg = M.palette.teal, bg = M.palette.bg3, },
  PmenuKindSel = { fg = M.palette.teal, bg = M.palette.gray, },
  PmenuMatch = { fg = M.palette.yellow, bg = M.palette.bg3, },
  PmenuMatchSel = { fg = M.palette.yellow, bg = M.palette.gray, },
  PmenuSbar = { fg = M.palette.none, bg = M.palette.none, },
  PmenuSel = { fg = M.palette.none, bg = M.palette.gray, },
  PmenuThumb = { fg = M.palette.none, bg = M.palette.gray_light, },
  PreProc = { fg = M.palette.orange, bg = M.palette.none, ctermfg = 137, ctermbg = "", },
  Question = { fg = M.palette.orange, bg = M.palette.none, },
  QuickFixLine = { fg = M.palette.bg0, bg = M.palette.blue, },
  Removed = { fg = M.palette.red_bright, bg = M.palette.none, },
  Search = { fg = M.palette.cyan, bg = M.palette.bg0, reverse = true, },
  SignColumn = { fg = M.palette.none, bg = M.palette.none, },
  Special = { fg = M.palette.teal, bg = M.palette.none, },
  SpecialKey = { fg = M.palette.gray, bg = M.palette.none, },
  SpellBad = { fg = M.palette.none, bg = M.palette.none, sp = M.palette.red_bright, ctermbg = M.palette.none, },
  SpellCap = { fg = M.palette.none, bg = M.palette.none, sp = M.palette.yellow, ctermbg = M.palette.none, },
  SpellLocal = { fg = M.palette.none, bg = M.palette.none, sp = M.palette.green_soft, ctermbg = M.palette.none, },
  SpellRare = { fg = M.palette.none, bg = M.palette.none, sp = M.palette.pink_soft, ctermbg = M.palette.none, },
  Statement = { fg = M.palette.purple, bg = M.palette.none, },
  Statusline = { fg = M.palette.bg0, bg = M.palette.gray_soft, },
  StatuslineNC = { fg = M.palette.bg0, bg = M.palette.gray_light, },
  String = { fg = M.palette.green, bg = M.palette.none, },
  TabLine = { fg = M.palette.bg0, bg = M.palette.gray_light, },
  TabLineFill = { fg = M.palette.bg0, bg = M.palette.gray_light, },
  TabLineSel = { fg = M.palette.bg0, bg = M.palette.gray_soft, bold = true, },
  Title = { fg = M.palette.none, bg = M.palette.none, bold = true, ctermbg = M.palette.none, },
  Todo = { fg = M.palette.white, bg = M.palette.none, bold = true, },
  ToolbarButton = { fg = M.palette.gray_light, bg = M.palette.bg0, bold = true, reverse = true, },
  ToolbarLine = { fg = M.palette.none, bg = M.palette.none, },
  Type = { fg = M.palette.blue, bg = M.palette.none, },
  Underlined = { fg = M.palette.none, bg = M.palette.none, },
  VertSplit = { fg = M.palette.gray_light, bg = M.palette.gray_light, },
  Visual = { fg = M.palette.brown_gray, bg = M.palette.bg0, reverse = true, bold = true, },
  VisualNOS = { fg = M.palette.bg0, bg = M.palette.teal, },
  WarningMsg = { fg = M.palette.pink_soft, bg = M.palette.none, },
  WildMenu = { fg = M.palette.bg0, bg = M.palette.orange, bold = true, },
  debugBreakpoint = { fg = M.palette.bg0, bg = M.palette.pink_soft, },
  debugPC = { fg = M.palette.bg0, bg = M.palette.blue, },
  lCursor = { fg = M.palette.bg0, bg = M.palette.green_bright, },

  WinBar = { fg = M.palette.gray_bright, bg = M.palette.bg0, bold = true, },
  WinBarNC = { fg = M.palette.gray_bright, bg = M.palette.bg0, bold = true, },

  TelescopeSelection = { fg = M.palette.none, bg = M.palette.none, },

}

M.lualine = {
  theme = {
    normal = {
      a = { bg = M.palette.gray_light, fg = M.palette.black, gui = "bold" },
      b = { bg = M.palette.bg0, fg = M.palette.white },
      c = { bg = M.palette.bg0, fg = M.palette.white },
    },
    insert = {
      a = { bg = M.palette.blue, fg = M.palette.black, gui = "bold" },
      b = { bg = M.palette.bg0, fg = M.palette.white },
      c = { bg = M.palette.bg0, fg = M.palette.white },
    },
    visual = {
      a = { bg = M.palette.yellow, fg = M.palette.black, gui = "bold" },
      b = { bg = M.palette.bg0, fg = M.palette.white },
      c = { bg = M.palette.bg0, fg = M.palette.white },
    },
    replace = {
      a = { bg = M.palette.red, fg = M.palette.black, gui = "bold" },
      b = { bg = M.palette.bg0, fg = M.palette.white },
      c = { bg = M.palette.bg0, fg = M.palette.white },
    },
    command = {
      a = { bg = M.palette.green, fg = M.palette.black, gui = "bold" },
      b = { bg = M.palette.bg0, fg = M.palette.white },
      c = { bg = M.palette.bg0, fg = M.palette.white },
    },
    inactive = {
      a = { bg = M.palette.darkgray, fg = M.palette.gray, gui = "bold" },
      b = { bg = M.palette.bg0, fg = M.palette.gray },
      c = { bg = M.palette.bg0, fg = M.palette.gray },
    },
  },
  components = {
    lualine_a = { "mode" },
    lualine_b = {
      { "branch", icon = " " },
      "diff",
    },
    lualine_c = {
      {
        "diagnostics",
        diagnostics_color = {
          error = { fg = M.palette.cyan, bg = M.palette.dark_red },
          warn = { fg = M.palette.space0, bg = M.palette.dark_yellow },
          info = { fg = M.palette.cyan, bg = M.palette.dark_green },
          hint = { fg = M.palette.cyan, bg = M.palette.dark_blue },
        },
      },
      "navic",
    },
    lualine_x = { "encoding", "fileformat", "filetype" },
    lualine_y = {},
    lualine_z = { "location" }
  },
}

return M
