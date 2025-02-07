local navic = require('nvim-navic')
local helpers = require("utils.helpers")
local buf = vim.lsp.buf

local opts = { noremap = true, silent = true, }
local extend = function(tbl, desc)
  return vim.tbl_extend("error", tbl, desc)
end

-- reserve on attach key remaps for nvim-lsp specific commands
return function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_set_option_value('omnifunc', 'v:lua.vim.lsp.omnifunc', { buf = bufnr })

  -- handlers
  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "single", color = "red" })
  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "single" })

  -- aerial
  vim.keymap.set('n', '<leader>a', "<cmd>AerialToggle!<CR>", extend(opts, { desc = "Open Aerial" }))

  -- Mappings.
  vim.keymap.set('n', 'gD', buf.declaration, extend(opts, { desc = "Buffer declarations" }))
  vim.keymap.set('n', 'gd', buf.definition, extend(opts, { desc = "Go to definition" }))
  vim.keymap.set('n', 'K', helpers.custom_hover, extend(opts, { desc = "View definition" }))
  vim.keymap.set('n', 'gi', buf.implementation, extend(opts, { desc = "Get implementation" }))
  vim.keymap.set('n', 'SH', buf.signature_help, extend(opts, { desc = "Signature help" }))
  vim.keymap.set('n', '<space>wa', buf.add_workspace_folder, extend(opts, { desc = "Add workspace to folder" }))
  vim.keymap.set('n', '<space>wr', buf.remove_workspace_folder, extend(opts, { desc = "remove workspace from folder" }))
  vim.keymap.set('n', '<space>wl', helpers.ls_ws_folders, extend(opts, { desc = "List workspace folders" }))
  vim.keymap.set('n', '<space>D', buf.type_definition, extend(opts, { desc = "Type definition" }))
  vim.keymap.set('n', '<space>rn', buf.rename, extend(opts, { desc = "Rename" }))
  vim.keymap.set('n', '<space>ca', buf.code_action, extend(opts, { desc = "Code action" }))
  vim.keymap.set('n', 'gr', buf.references, extend(opts, { desc = "Get references" }))
  vim.keymap.set('n', '<space>e', helpers.open_diagnostic, extend(opts, { desc = "Open diagnostic on current line" }))
  vim.keymap.set('n', '[d', helpers.next_diagnostic, extend(opts, { desc = "Jump to next diagnostic" }))
  vim.keymap.set('n', ']d', helpers.prev_diagnostic, extend(opts, { desc = "Jump to previous diagnostic" }))
  vim.keymap.set('n', '<space>q', helpers.manage_loclist, extend(opts, { desc = "Set diagnostic list" }))
  vim.keymap.set('n', '<space>f', helpers.format_file, extend(opts, { desc = "Format file" }))

  -- nvim navic for lualine
  if client.server_capabilities.documentSymbolProvider then
    navic.attach(client, bufnr)
  end
end
