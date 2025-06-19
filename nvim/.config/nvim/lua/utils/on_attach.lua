local buf = vim.lsp.buf

local ls_ws_folders = function()
  print(vim.inspect(buf.list_workspace_folders()))
end

local custom_hover = function()
  local hover = buf.hover
  local winid = require('ufo').peekFoldedLinesUnderCursor()
  if not winid then
    hover()
  end
end

local open_diagnostic = function()
  vim.diagnostic.open_float(0, { border = "single" })
end

local prev_diagnostic = function()
  vim.diagnostic.goto_prev({ float = { border = "single" } })
end

local next_diagnostic = function()
  vim.diagnostic.goto_next({ float = { border = "single" } })
end

local format_file = function()
  vim.lsp.buf.format({ async = true, })
end

local manage_loclist = function()
  vim.diagnostic.setloclist({ open = false }) -- don't open and focus
  local window = vim.api.nvim_get_current_win()
  vim.cmd.lwindow()                           -- open+focus loclist if has entries, else close -- this is the magic toggle command
  vim.api.nvim_set_current_win(window)        -- restore focus to window you were editing (delete this if you want to stay in loclist)
end


-- reserve on attach key remaps for nvim-lsp specific commands
return function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_set_option_value('omnifunc', 'v:lua.vim.lsp.omnifunc', { buf = bufnr })

  -- Mappings.
  vim.keymap.set('n', 'gD', buf.declaration, { desc = "Buffer declarations" })
  vim.keymap.set('n', 'gd', buf.definition, { desc = "Go to definition" })
  vim.keymap.set('n', 'K', custom_hover, { desc = "View definition" })
  vim.keymap.set('n', 'gi', buf.implementation, { desc = "Get implementation" })
  vim.keymap.set('n', 'SH', buf.signature_help, { desc = "Signature help" })
  vim.keymap.set('n', '<space>wa', buf.add_workspace_folder, { desc = "Add workspace to folder" })
  vim.keymap.set('n', '<space>wr', buf.remove_workspace_folder, { desc = "remove workspace from folder" })
  vim.keymap.set('n', '<space>wl', ls_ws_folders, { desc = "List workspace folders" })
  vim.keymap.set('n', '<space>D', buf.type_definition, { desc = "Type definition" })
  vim.keymap.set('n', '<space>rn', buf.rename, { desc = "Rename" })
  vim.keymap.set('n', '<space>ca', buf.code_action, { desc = "Code action" })
  vim.keymap.set('n', 'gr', buf.references, { desc = "Get references" })

  vim.keymap.set('n', '<space>e', open_diagnostic, { desc = "Open diagnostic on current line" })
  vim.keymap.set('n', '[d', next_diagnostic, { desc = "Jump to next diagnostic" })
  vim.keymap.set('n', ']d', prev_diagnostic, { desc = "Jump to previous diagnostic" })
  vim.keymap.set('n', '<space>q', manage_loclist, { desc = "Set diagnostic list" })
  vim.keymap.set('n', '<space>f', format_file, { desc = "Format file" })

  -- -- nvim navic for lualine
  -- if client.server_capabilities.documentSymbolProvider then
  --   require("nvim-navic").attach(client, bufnr)
  -- end
end
