local status_ok, nvim_surround = pcall(require, 'nvim-surround')
local notifications = require('utils.notifications')
if not status_ok then
  notifications.plugin_error('nvim-surround')
  return
end


nvim_surround.setup()

