local status_ok, devicons = pcall(require, 'nvim-web-devicons')
local notifications = require('utils.notifications')
if not status_ok then
  notifications.plugin_error('nvim-web-devicons')
  return
end

devicons.setup({
  -- globally enable different highlight colors per icon (default to true)
  -- if set to false all icons will have the default icon's color
  color_icons = true,
  -- globally enable default icons (default to false)
  -- will get overriden by `get_icons` option
  default = true,
  -- globally enable "strict" selection of icons - icon will be looked up in
  -- different tables, first by filename, and if not found by extension; this
  -- prevents cases when file doesn't have any extension but still gets some icon
  -- because its name happened to match some extension (default to false)
  strict = true,
})

devicons.set_icon({
  ["tsx"] = {
    icon = devicons.get_icon('index.jsx', 'jsx', { default = true }),
    name = "Tsx",
    color = '#20c2e3',
    cterm_color = "45",
  },
  [".eslintrc"] = {
    icon = "",
    name = "Eslintrc",
    color = 'grey',
    cterm_color = "56",
  },
  ["snippets"] = {
    icon = " ",
    name = "Snippet",
    color =  "Cyan",
  },
})
