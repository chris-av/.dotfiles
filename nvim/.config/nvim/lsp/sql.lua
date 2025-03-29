local home = os.getenv('HOME')

return {
  cmd = { home .. "/.local/share/nvim/mason/bin/sqls" },
  filetypes = { "sql" },
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
