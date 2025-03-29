local on_attach = require("utils.on_attach")
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

vim.lsp.config("*", {
  on_attach = on_attach,
  capabilities = capabilities,
})
