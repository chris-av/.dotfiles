local on_attach = require 'lsp.on_attach'
local nvim_lsp = require 'lspconfig'
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

nvim_lsp['bashls'].setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { 'bash-language-server', 'start' },
  filetypes = { 'sh' },
  cmd_env = {
      GLOB_PATTERN = "*@(.sh|.inc|.bash|.command)"
  }
}
