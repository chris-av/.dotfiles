local navic = require('nvim-navic')
local buf = vim.lsp.buf

local declaration = buf.declaration
local definition = buf.definition
local hover = buf.hover
local implementation = buf.implementation
local signature_help = buf.signature_help
local add_workspace_folder = buf.add_workspace_folder
local remove_workspace_folder = buf.remove_workspace_folder
local list_workspace_folders = buf.list_workspace_folders
local type_definition = buf.type_definition
local rename = buf.rename
local code_action = buf.code_action
local references = buf.references


local opts = { noremap = true, silent = true, }
local extend = function(tbl, desc)
  return vim.tbl_extend("error", tbl, desc)
end


-- custom functions
local ls_ws_folders = function()
  print(vim.inspect(list_workspace_folders()))
end

local custom_hover = function()
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
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- handlers
  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "single", color = "red" })
  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "single" })


  -- Mappings.
  vim.keymap.set('n', 'gD', declaration, extend(opts, { desc = "Buffer declarations" }))
  vim.keymap.set('n', 'gd', definition, extend(opts, { desc = "Go to definition" }))
  vim.keymap.set('n', 'K', custom_hover, extend(opts, { desc = "View definition" }))
  vim.keymap.set('n', 'gi', implementation, extend(opts, { desc = "Get implementation" }))
  vim.keymap.set('n', 'SH', signature_help, extend(opts, { desc = "Signature help" }))
  vim.keymap.set('n', '<space>wa', add_workspace_folder, extend(opts, { desc = "Add workspace to folder" }))
  vim.keymap.set('n', '<space>wr', remove_workspace_folder, extend(opts, { desc = "remove workspace from folder" }))
  vim.keymap.set('n', '<space>wl', ls_ws_folders, extend(opts, { desc = "List workspace folders" }))
  vim.keymap.set('n', '<space>D', type_definition, extend(opts, { desc = "Type definition" }))
  vim.keymap.set('n', '<space>rn', rename, extend(opts, { desc = "Rename" }))
  vim.keymap.set('n', '<space>ca', code_action, extend(opts, { desc = "Code action" }))
  vim.keymap.set('n', 'gr', references, extend(opts, { desc = "Get references" }))
  vim.keymap.set('n', '<space>e', open_diagnostic, extend(opts, { desc = "Open diagnostic on current line" }))
  vim.keymap.set('n', '[d', next_diagnostic, extend(opts, { desc = "Jump to next diagnostic" }))
  vim.keymap.set('n', ']d', prev_diagnostic, extend(opts, { desc = "Jump to previous diagnostic" }))
  vim.keymap.set('n', '<space>q', manage_loclist, extend(opts, { desc = "Set diagnostic list" }))
  vim.keymap.set('n', '<space>f', format_file, extend(opts, { desc = "Format file" }))

  -- nvim navic for lualine
  if client.server_capabilities.documentSymbolProvider then
    navic.attach(client, bufnr)
  end
end
