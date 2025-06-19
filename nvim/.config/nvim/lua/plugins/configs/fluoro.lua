return {
  "maxmx03/fluoromachine.nvim",
  dependencies = {},
  config = function()
    local fm = require("fluoromachine")
    fm.setup({
      glow = false,
      theme = 'fluoromachine',
      transparent = true,
      overrides = function()
        return {
          CursorLine = { bg = 'none' },
        }
      end
    })
  end
}
