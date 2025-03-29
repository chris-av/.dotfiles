return {
  filetypes = { "python" },
  cmd = { "pyright-langserver", "--stdio" },
  root_dir = require("utils.helpers").find_proj_root({ ".git", "requirements.txt" }),
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        diagnosticMode = "openFilesOnly",
        useLibraryCodeForTypes = true
      }
    }
  }
}
