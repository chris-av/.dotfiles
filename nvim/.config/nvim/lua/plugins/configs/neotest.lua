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
    local neotest = require("neotest")
    neotest.setup({
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

    local currfile = vim.fn.expand("%")
    vim.keymap.set("n", "<leader>tt", function() neotest.run.run(currfile) end, { desc = "Neotest - run current file" })
    vim.keymap.set("n", "<leader>tl", neotest.summary.toggle, { desc = "Neotest - run current file" })
    vim.keymap.set("n", "<leader>to", neotest.output_panel.toggle, { desc = "Neotest - show output panel" })
    vim.keymap.set("n", "<leader>ta", neotest.run.attach, { desc = "Neotest - attach" })
    vim.keymap.set("n", "<leader>tw", function() neotest.watch.toggle(currfile) end, { desc = "Neotest - attach" })

  end
}
