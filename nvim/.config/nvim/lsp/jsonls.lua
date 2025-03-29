return {
  cmd = { "vscode-json-language-server", "--stdio" },
  filetypes = { 'json', 'jsonc' },
  root_dir = require("utils.helpers").find_git_ancestor()
}
