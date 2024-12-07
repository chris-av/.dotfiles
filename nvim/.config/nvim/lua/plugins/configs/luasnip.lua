local status_ok, luasnip = pcall(require, 'luasnip')
local notifications = require('utils.notifications')
if not status_ok then
  notifications.plugin_error('luasnip')
  return
end


require('luasnip.loaders.from_vscode').lazy_load()
require('snippets')

luasnip.config.set_config({
  history = true,
  updateevents = "TextChanged,TextChangedI",
  delete_check_events = "TextChanged",

  ext_base_prio = 300,
  ext_prio_increase = 1,
  enable_autosnippets = true,
  store_selection_keys = "<Tab>",
  ft_func = function()
    return vim.split(vim.bo.filetype, ".", true)
  end

})



