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


require('lsp.keymapping')
require('lsp.pyright')
require('lsp.ts_ls')
require('lsp.json')
require('lsp.css')
require('lsp.tailwindcss')
require('lsp.html')
require('lsp.lua-lsp')
require('lsp.bashls')
require('lsp.ltex')
require('lsp.r-lsp')
require('lsp.rust')
require('lsp.clangd')
require('lsp.zls')
require('lsp.java')
require('lsp.golang')
-- require('lsp.sql')
