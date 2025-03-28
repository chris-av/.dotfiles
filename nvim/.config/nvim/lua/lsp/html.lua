local on_attach = require('lsp.on_attach')
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

vim.lsp.config.html = {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { 'vscode-html-language-server', '--stdio' },
  filetypes = { 'html' }
}
