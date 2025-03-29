return {
  cmd = { 'R', '--slave', '-e', 'languageserver::run()' },
  filetypes = { 'r', 'rmd' },
  log_level = 2,
  root_dir = require("utils.helpers").find_proj_root({ ".Rproj" })
}
