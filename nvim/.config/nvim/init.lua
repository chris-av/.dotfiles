require('configs')
require('plugins')
require('lsp')

vim.lsp.enable({
  "bashls", "clangd", "cssls", "gopls", "html",
  "jdtls", "jsonls", "ltex", "lua_ls", "pyright",
  "r_language_server", "rust_analyzer", "tailwindcss",
  "ts_ls", "zls",
})

-- set colorscheme
local colorutils = require('utils/colorutils')
colorutils.set_colorscheme()
