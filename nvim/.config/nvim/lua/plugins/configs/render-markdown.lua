return {
  "MeanderingProgrammer/render-markdown.nvim",
  dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-mini/nvim-web-devicons", },
  opts = {},
  config = function()
    local markdown = require("render-markdown")
    markdown.setup({
      enabled = false,
      render_modes = { "n", "c", "t", "v", "V" },
      anti_conceal = { enabled = false, },
    })
    vim.keymap.set('n', '<leader>me', markdown.toggle, { desc = "list keymappings" })
  end
}
