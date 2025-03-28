local on_attach = require('lsp.on_attach')
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

vim.lsp.config.bashls = {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { 'bash-language-server', 'start' },
  filetypes = { 'sh', 'conf' },
  cmd_env = {
    GLOB_PATTERN = "*@(.sh|.inc|.bash|.command)"
  }
}
