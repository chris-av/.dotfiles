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

local use_theme = colorutils.get_lualine_theme()
local import_path = 'lualine.themes.' .. use_theme
local lualine_theme = require('lualine.themes.' .. use_theme)


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
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch', 'diff', 'diagnostics' },
    lualine_c = {
      "navic",
    },
    lualine_x = { 'encoding', 'fileformat', 'filetype' },
    lualine_y = {},
    lualine_z = { 'location' }
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { 'filename' },
    lualine_x = { 'location' },
    lualine_y = {},
    lualine_z = {}
  },
  winbar = {
    lualine_z = { { 'filename', path = 1 } }
  },
  inactive_winbar = {
    lualine_z = { { 'filename', path = 1 } }
  },
  tabline = {},
  extensions = {}
})
