local status_ok, coal = pcall(require, 'coal')
local notifications = require('utils.notifications')
if not status_ok then
  notifications.plugin_error('coal')
  return
end



coal.setup()

