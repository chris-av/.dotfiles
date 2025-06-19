return {
  "rcarriga/nvim-notify",
  dependencies = {},
  config = function()
    local notify = require("notify")
    notify.setup({
      stages = 'fade_in_slide_out',
      on_open = nil,
      on_close = nil,
      render = 'default',
      timeout = 180,
      background_colour = '#000000',
      minimum_width = 10
    })
    vim.notify = notify
  end
}
