local on_attach = require('lsp.on_attach')
local nvim_lsp = require('lspconfig')
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

local home = os.getenv('HOME')

nvim_lsp['sqlls'].setup {
  on_attach = on_attach,
  cmd = { home .. "/.local/share/nvim/mason/bin/sqls" },
  filetypes = { "sql" },
  capabilities = capabilities,
  root_dir = nvim_lsp.util.find_git_ancestor,

  --
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
