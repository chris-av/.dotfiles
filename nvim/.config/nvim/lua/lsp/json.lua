local on_attach = require('lsp.on_attach')
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

vim.lsp.config.jsonls = {
  on_attach = on_attach,
  cmd = { "vscode-json-language-server", "--stdio" },
  filetypes = { 'json', 'jsonc' },
  capabilities = capabilities,
  root_dir = require("utils.helpers").find_git_ancestor()
}
