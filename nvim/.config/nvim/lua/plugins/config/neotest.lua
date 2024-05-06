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
