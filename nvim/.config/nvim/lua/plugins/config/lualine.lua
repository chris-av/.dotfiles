local status_ok, navic = pcall(require, 'nvim-navic')
local notifications = require('utils.notifications')
local colorutils = require('utils.colorutils')
if not status_ok then
  notifications.plugin_error('nvim-navic')
  return
end

local status_ok, lualine = pcall(require, 'lualine')
if not status_ok then
  notifications.plugin_error('lualine')
  return
end

local theme_path = colorutils.get_lualine_theme_path()
local lualine_theme, lualine_components
if theme_path == "auto" then
  lualine_theme = "auto"
  lualine_components = require("utils.lualine-themes.auto").components
else
  if string.find(theme_path, "lualine-themes") then
    -- using custom theme, I have a theme key
    lualine_theme = require(theme_path).theme
  else
    -- using out of the box theme from lualine
    lualine_theme = require(theme_path)
  end
  lualine_components = require(theme_path).components
end


navic.setup({
  icons = {
    File          = "󰈙 ",
    Module        = " ",
    Namespace     = "󰌗 ",
    Package       = " ",
    Class         = "󰌗 ",
    Method        = "󰆧 ",
    Property      = " ",
    Field         = " ",
    Constructor   = " ",
    Enum          = "󰕘",
    Interface     = "󰕘",
    Function      = "󰊕 ",
    Variable      = "󰆧 ",
    Constant      = "󰏿 ",
    String        = "󰀬 ",
    Number        = "󰎠 ",
    Boolean       = "◩ ",
    Array         = "󰅪 ",
    Object        = "󰅩 ",
    Key           = "󰌋 ",
    Null          = "󰟢 ",
    EnumMember    = " ",
    Struct        = "󰌗 ",
    Event         = " ",
    Operator      = "󰆕 ",
    TypeParameter = "󰊄 ",
  }
})



-- now call lualine, and extend it with gps
lualine.setup({
  options = {
    theme = lualine_theme,
  },
  sections = lualine_components,
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { 'filename' },
    lualine_x = { 'location' },
    lualine_y = {},
    lualine_z = {}
  },
  -- winbar = {
  --   lualine_z = { { 'filename', path = 1 } }
  -- },
  -- inactive_winbar = {
  --   lualine_z = { { 'filename', path = 1 } }
  -- },
  tabline = {},
  extensions = {}
})
