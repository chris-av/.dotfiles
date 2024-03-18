local on_attach = require('lsp.on_attach')
local nvim_lsp = require('lspconfig')
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

nvim_lsp['html'].setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { 'vscode-html-language-server', '--stdio' },
  filetypes = { 'html' }
}
