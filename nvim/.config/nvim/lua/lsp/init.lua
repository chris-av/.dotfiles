require('mason').setup()
require('mason-lspconfig').setup({
  automatic_installation = true,
  ensure_installed = {
    "bashls",
    "clangd",
    "cssls",
    "gopls",
    "html",
    "jdtls",
    "jsonls",
    "ltex",
    "lua_ls",
    "pyright",
    "r_language_server",
    "rust_analyzer",
    "tailwindcss",
    "ts_ls",
    "zls",
  },
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

vim.lsp.config("*", {
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    local buf = vim.lsp.buf

    -- keymaps
    vim.keymap.set('n', 'gD', buf.declaration, { desc = "Buffer declarations" })
    vim.keymap.set('n', 'gd', buf.definition, { desc = "Go to definition" })
    vim.keymap.set('n', 'K', function()
      local hover = buf.hover
      local winid = require('ufo').peekFoldedLinesUnderCursor()
      if not winid then
        hover()
      end
    end, { desc = "View definition" })
    vim.keymap.set('n', 'gi', buf.implementation, { desc = "Get implementation" })
    vim.keymap.set('n', 'SH', buf.signature_help, { desc = "Signature help" })
    vim.keymap.set('n', '<space>wa', buf.add_workspace_folder, { desc = "Add workspace to folder" })
    vim.keymap.set('n', '<space>wr', buf.remove_workspace_folder, { desc = "remove workspace from folder" })
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(buf.list_workspace_folders()))
    end, { desc = "List workspace folders" })
    vim.keymap.set('n', '<space>D', buf.type_definition, { desc = "Type definition" })
    vim.keymap.set('n', '<space>rn', buf.rename, { desc = "Rename" })
    vim.keymap.set('n', '<space>ca', buf.code_action, { desc = "Code action" })
    vim.keymap.set('n', 'gr', buf.references, { desc = "Get references" })
    vim.keymap.set('n', '<space>e', function()
      vim.diagnostic.open_float({ bufnr = 0, border = "single" })
    end, { desc = "Open diagnostic on current line" })
    vim.keymap.set('n', '[d', function()
      vim.diagnostic.jump({ count = 1, float = { border = "single" } })
    end, { desc = "Jump to next diagnostic" })
    vim.keymap.set('n', ']d', function()
      vim.diagnostic.jump({ count = -1, float = { border = "single" } })
    end, { desc = "Jump to previous diagnostic" })
    vim.keymap.set('n', '<space>q', function()
      vim.diagnostic.setloclist({ open = false })
      local window = vim.api.nvim_get_current_win()
      vim.cmd.lwindow()
      vim.api.nvim_set_current_win(window)
    end, { desc = "Set diagnostic list" })
    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format({ async = true, })
    end, { desc = "Format file" })

    -- nvim navic
    if not client then
      return
    end
    local navic = require("nvim-navic")
    if client.server_capabilities.documentSymbolProvider then
      navic.attach(client, bufnr)
    end
  end,
})
