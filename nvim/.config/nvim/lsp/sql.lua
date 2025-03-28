local on_attach = require('utils.on_attach')
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
local home = os.getenv('HOME')

return {
  on_attach = on_attach,
  cmd = { home .. "/.local/share/nvim/mason/bin/sqls" },
  filetypes = { "sql" },
  capabilities = capabilities,
  root_dir = require("utils.helpers").find_git_ancestor(),

  settings = {
    sqls = {
      connections = {
        {
          driver = 'postgresql',
          dataSourceName = 'host=127.0.0.1 user=chrisv',
        },
      },
    },
  },
}
