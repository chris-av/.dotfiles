require('configs')
require('plugins')
require('lsp')
require('debuggers')

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

vim.lsp.enable({
  "bashls", "clangd", "cssls", "gopls", "html",
  "jdtls", "jsonls", "ltex", "lua_ls", "pyright",
  "r_language_server", "rust_analyzer", "tailwindcss",
  "ts_ls", "zls",
})

require("utils.keymapping")

-- set colorscheme
local colorutils = require('utils/colorutils')
colorutils.set_colorscheme()
