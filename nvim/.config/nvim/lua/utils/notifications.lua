local M = {}

M.plugin_error = function(plugin_name)
  vim.notify('could not load ' .. plugin_name, vim.log.level.ERROR, {
    title = 'Plugin Error'
  })
end

---wrapper to emit an info notification
---@param title? string
---@param msg? string
M.notify_info = function(title, msg)
  -- can be debug, error, info, trace, or warn
  -- trace does not show dialog popup
  vim.notify(msg or "", vim.log.levels.INFO, {
    title = title or ""
  })
end

---wrapper to emit an err notification
---@param title? string
---@param msg? string
M.notify_err = function(title, msg)
  -- can be debug, error, info, trace, or warn
  -- trace does not show dialog popup
  vim.notify(msg or "", vim.log.levels.ERROR, {
    title = title or ""
  })
end

---wrapper to emit a warning notification
---@param title? string
---@param msg? string
M.notify_warn = function(title, msg)
  -- can be debug, error, info, trace, or warn
  -- trace does not show dialog popup
  vim.notify(msg, vim.log.levels.WARN, {
    title = title
  })
end

---wrapper to easily emit notifications
---@alias NotifyLevel '"trace"'|'"debug"'|'"info"'|'"warn"'|'"error"'
---@class NotifyOpts
---@field msg   string
---@field level NotifyLevel|integer?
---@field title? string
---@field timeout? number
---@field on_open? fun(win: number)
---@field on_close? fun()
---@field keep? boolean
---@param opts NotifyOpts
M.notify = function(opts)
  local msg       = opts.msg or ""
  local level     = opts.level or "info"
  local vim_level = type(level) == "string" and vim.log.levels[level:upper()] or level
  vim.notify(msg, vim_level, {
    title    = opts.title,
  })
end

return M
