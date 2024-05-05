local buf = vim.lsp.buf

local M = {}

M.ls_ws_folders = function()
  print(vim.inspect(buf.list_workspace_folders()))
end

M.custom_hover = function()
  local hover = buf.hover
  local winid = require('ufo').peekFoldedLinesUnderCursor()
  if not winid then
    hover()
  end
end

M.open_diagnostic = function()
  vim.diagnostic.open_float(0, { border = "single" })
end

M.prev_diagnostic = function()
  vim.diagnostic.goto_prev({ float = { border = "single" } })
end

M.next_diagnostic = function()
  vim.diagnostic.goto_next({ float = { border = "single" } })
end

M.format_file = function()
  vim.lsp.buf.format({ async = true, })
end

M.manage_loclist = function()
  vim.diagnostic.setloclist({ open = false }) -- don't open and focus
  local window = vim.api.nvim_get_current_win()
  vim.cmd.lwindow()                           -- open+focus loclist if has entries, else close -- this is the magic toggle command
  vim.api.nvim_set_current_win(window)        -- restore focus to window you were editing (delete this if you want to stay in loclist)
end

return M
