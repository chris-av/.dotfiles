local navic = require('nvim-navic')



-- reserve on attach key remaps for nvim-lsp specific commands
return function(client, bufnr)
  -- local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>',
  { noremap = true, silent = true, desc = "Buffer declarations" })
  vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>',
  { noremap = true, silent = true, desc = "Go to definition" })
  vim.keymap.set('n', 'K', function()
    local winid = require('ufo').peekFoldedLinesUnderCursor()
    if not winid then
      vim.lsp.buf.hover()
    end
  end, { noremap = true, silent = true, desc = "View definition" })
  vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>',
  { noremap = true, silent = true, desc = "Get implementation" })
  vim.keymap.set('n', 'SH', '<cmd>lua vim.lsp.buf.signature_help()<CR>',
  { noremap = true, silent = true, desc = "Signature help" })
  vim.keymap.set('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>',
  { noremap = true, silent = true, desc = "Add workspace to folder" })
  vim.keymap.set('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>',
  { noremap = true, silent = true, desc = "remove workspace from folder" })
  vim.keymap.set('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>',
  { noremap = true, silent = true, desc = "List workspace folders" })
  vim.keymap.set('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>',
  { noremap = true, silent = true, desc = "Type definition" })
  vim.keymap.set('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>',
  { noremap = true, silent = true, desc = "Rename" })
  vim.keymap.set('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>',
  { noremap = true, silent = true, desc = "Code action" })
  vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>',
  { noremap = true, silent = true, desc = "Get references" })
  vim.keymap.set('n', '<space>e', '<cmd>lua vim.diagnostic.open_float(0, { border = "single" })<CR>',
  { noremap = true, silent = true, desc = "Open diagnostic on current line" })
  vim.keymap.set('n', '[d', '<cmd>lua vim.diagnostic.goto_prev({ float = { border = "single" }})<CR>',
  { noremap = true, silent = true, desc = "Jump to next diagnostic" })
  vim.keymap.set('n', ']d', '<cmd>lua vim.diagnostic.goto_next({ float = { border = "single" }})<CR>',
  { noremap = true, silent = true, desc = "Jump to previous diagnostic" })
  vim.keymap.set('n', '<space>q', '<cmd>lua vim.diagnostic.set_loclist()<CR>',
  { noremap = true, silent = true, desc = "Set diagnostic list" })
  vim.keymap.set('n', '<space>f', '<cmd>lua vim.lsp.buf.format({ async = true })<CR>',
  { noremap = true, silent = true, desc = "Format file" })

  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "single", color = "red" })
  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "single" })

  -- nvim navic for lualine
  if client.server_capabilities.documentSymbolProvider then
    navic.attach(client, bufnr)
  end
end
