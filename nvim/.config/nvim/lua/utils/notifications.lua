local M = {}
local level = vim.log.levels


M.plugin_error = function(plugin_name)
  vim.notify('could not load ' .. plugin_name, level.ERROR, {
    title = 'Plugin Error'
  })
end

M.log = function(title, message)
  -- can be debug, error, info, trace, or warn
  -- trace does not show dialog popup
  vim.notify(message, level.INFO, {
    title = title
  })
end



return M

