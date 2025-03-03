local status_ok, cmp = pcall(require, 'cmp')
local notifications = require('utils.notifications')
if not status_ok then
  notifications.plugin_error('cmp')
  return
end

local status_ok, _ = pcall(require, 'nvim-autopairs')
if not status_ok then
  notifications.plugin_error('nvim-autopairs')
  return
end

local cmp_autopairs = require('nvim-autopairs.completion.cmp')
require('nvim-autopairs').setup({
  enable_check_bracket_line = false
})

cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
