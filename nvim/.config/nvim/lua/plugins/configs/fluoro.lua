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
          NeoTreeFloatBorder = { bg = "#100519", fg = "#8C57C7", },
          NeoTreeTitleBar = { bg = "#8C57C7", fg = "#000000", },
        }
      end
    })
  end
}
