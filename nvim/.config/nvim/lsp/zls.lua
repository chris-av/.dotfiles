-- automatic code formatting, 0 for false, 1 for true
vim.g.zig_fmt_autosave = 0

return {
  cmd = { 'zls' },
  filetypes = { 'zig', 'zir' },
  root = require("utils.helpers").find_proj_root({ 'zls.json', '.git', })
}
