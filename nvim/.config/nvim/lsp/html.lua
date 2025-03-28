local on_attach = require('utils.on_attach')
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

return {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { 'vscode-html-language-server', '--stdio' },
  filetypes = { 'html' }
}
