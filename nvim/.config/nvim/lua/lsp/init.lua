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
})
