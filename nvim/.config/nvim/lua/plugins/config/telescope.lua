local status_ok, telescope = pcall(require, 'telescope')
local notifications = require('utils.notifications') 
if not status_ok then
  notifications.plugin_error('telescope')
  return
end


local actions = require('telescope.actions')


telescope.setup({
  defaults = {
    mappings = {
      i = {
        ["<Esc>"] = actions.close,
      },
    }
  }
})

