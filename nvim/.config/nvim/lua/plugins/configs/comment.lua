local status_ok, comment = pcall(require, 'Comment')
local notifications = require('utils.notifications')
if not status_ok then
  notifications.plugin_error('comment.nvim')
  return
end


comment.setup()

