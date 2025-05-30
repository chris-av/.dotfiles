local status_ok, github_theme = pcall(require, 'github-theme')
local notifications = require('utils.notifications')
if not status_ok then
  notifications.plugin_error('github-theme')
  return
end


-- Example config in Lua
require("github-theme").setup({
  theme_style = "dark",
  function_style = "italic",
  sidebars = { "qf", "vista_kind", "terminal", "packer" },

  -- Change the "hint" color to the "orange" color, and make the "error" color bright red
  colors = { hint = "orange", error = "#ff0000" },

  -- Overwrite the highlight groups
  overrides = function(c)
    return {
      htmlTag = { fg = c.red, bg = "#282c34", sp = c.hint, style = "underline" },
      DiagnosticHint = { link = "LspDiagnosticsDefaultHint" },
      -- this will remove the highlight groups
      TSField = {},
    }
  end
})
