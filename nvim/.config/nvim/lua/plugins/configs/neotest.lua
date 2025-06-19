return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",

    -- adapters
    "nvim-neotest/neotest-jest",
    "nvim-neotest/neotest-python",
    "lawrence-laz/neotest-zig",
  },

  config = function()
    require('neotest').setup({
      adapters = {
        require('neotest-jest')({
          jest_test_discovery = false,
          -- jestCommand = require('neotest-jest.jest-util').getJestCommand(vim.fn.expand '%:p:h') .. ' --watch',
          jestCommand = 'jest --watch',
        }),
        require("neotest-python"),
        require("neotest-zig"),
      },
    })
  end
}
