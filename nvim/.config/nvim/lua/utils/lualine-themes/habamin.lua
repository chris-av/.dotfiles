local colors = {
  -- Base colors / background shades
  black       = "#000000",  -- absolute black
  bg0         = "#1c1c1c",  -- darkest gray (background base)
  bg1         = "#262626",  -- background step 1
  bg2         = "#303030",  -- background step 2
  bg3         = "#3a3a3a",  -- background step 3
  gray        = "#585858",  -- neutral gray
  gray_light  = "#767676",  -- softer gray
  gray_soft   = "#9e9e9e",  -- light midtone gray
  gray_bright = "#bcbcbc",  -- near white gray
  white       = "#dadada",  -- bright foreground
  none        = "NONE",     -- for transparency

  -- Accent colors (cool)
  teal        = "#5f8787",  -- muted teal (types, attributes)
  blue        = "#5f87af",  -- dusty blue
  cyan        = "#5fafd7",  -- soft cyan
  aqua        = "#87afaf",  -- pale aqua

  -- Accent colors (warm)
  red         = "#af5f5f",  -- soft red
  red_bright  = "#d75f5f",  -- bright red
  pink        = "#ff00af",  -- neon magenta/pink
  pink_soft   = "#d75f87",  -- faded pink
  orange      = "#af875f",  -- warm orange
  orange_soft = "#d7af87",  -- peachy orange
  yellow      = "#ffaf5f",  -- orange-yellow
  green       = "#5faf5f",  -- forest green
  green_bright= "#5fff00",  -- lime green
  green_soft  = "#5fd75f",  -- bright mint
  green_light = "#87d787",  -- light green

  -- Muted blends
  brown_gray  = "#658383",  -- earthy desaturated tone
  purple      = "#af87af",  -- soft purple
}

local lualine_theme = {
  normal = {
    a = { bg = colors.gray_light, fg = colors.black, gui = "bold" },
    b = { bg = colors.bg0, fg = colors.white },
    c = { bg = colors.bg0, fg = colors.white },
  },
  insert = {
    a = { bg = colors.blue, fg = colors.black, gui = "bold" },
    b = { bg = colors.bg0, fg = colors.white },
    c = { bg = colors.bg0, fg = colors.white },
  },
  visual = {
    a = { bg = colors.yellow, fg = colors.black, gui = "bold" },
    b = { bg = colors.bg0, fg = colors.white },
    c = { bg = colors.bg0, fg = colors.white },
  },
  replace = {
    a = { bg = colors.red, fg = colors.black, gui = "bold" },
    b = { bg = colors.bg0, fg = colors.white },
    c = { bg = colors.bg0, fg = colors.white },
  },
  command = {
    a = { bg = colors.green, fg = colors.black, gui = "bold" },
    b = { bg = colors.bg0, fg = colors.white },
    c = { bg = colors.bg0, fg = colors.white },
  },
  inactive = {
    a = { bg = colors.bg2, fg = colors.gray, gui = "bold" },
    b = { bg = colors.bg2, fg = colors.gray },
    c = { bg = colors.bg0, fg = colors.gray },
  },
}


local lualine_components = {
  lualine_a = { "mode" },
  lualine_b = {
    { "branch", icon = " " },
    "diff",
  },
  lualine_c = {
  {
      "diagnostics",
      diagnostics_color = {
        error = { fg = colors.cyan, bg = colors.dark_red },
        warn = { fg = colors.space0, bg = colors.dark_yellow },
        info = { fg = colors.cyan, bg = colors.dark_green },
        hint = { fg = colors.cyan, bg = colors.dark_blue },
      },
    },
    "navic",
  },
  lualine_x = { "encoding", "fileformat", "filetype" },
  lualine_y = {},
  lualine_z = { "location" }
}

return {
  theme = lualine_theme,
  components = lualine_components,
}
