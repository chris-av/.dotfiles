local M = {}


M.plugin_error = function(plugin_name) 
  vim.notify('could not load ' .. plugin_name, 'error', {
    title = 'Plugin Error'
  })
end

M.log = function(title, message) 
  -- can be debug, error, info, trace, or warn
  -- trace does not show dialog popup
  vim.notify(message, 'info', {
    title = title
  })
end



return M

