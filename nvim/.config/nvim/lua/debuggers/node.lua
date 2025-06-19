local home = os.getenv("HOME")
local nodeAdapterPath = vim.fs.joinpath(home, "/.local/share/nvim/mason/packages/node-debug2-adapter/out/src/nodeDebug.js")

return {
  adapter = {
    type = "executable",
    command = "node",
    args = {
      nodeAdapterPath,
    },
  },
  configurations = {
    {
      name = "Launch",
      type = "node",
      request = "launch",
      program = "${file}",
      cwd = vim.fn.getcwd(),
      sourceMaps = true,
      protocol = "inspector",
      console = "integratedTerminal"
    },
    {
      -- For this to work you need to make sure the node process is started with the `--inspect` flag.
      name = "Attach to process",
      type = "node",
      request = "attach",
      processId = require "dap.utils".pick_process,
    },
  },
  runners = {
    attachGeneric = function()
      local dap = require("dap")
      vim.notify("attaching to node adapter", vim.log.levels.INFO, {
        title = "dap"
      })
      dap.run({
        type = "node",
        request = "attach",
        cwd = vim.fn.getcwd(),
        sourceMaps = true,
        protocol = "inspector",
        processId = require("dap.utils").pick_process(),
        skipFiles = { "<node_internals>/**/*.js", },
      })
    end,
    attachToRemote = function()
      local dap = require("dap")
      vim.notify("attaching to remote adapter", vim.log.levels.INFO, {
        title = "dap"
      })
      dap.run({
        type = 'node',
        request = "attach",
        address = "127.0.0.1",
        port = 9229,
        localRoot = vim.fn.getcwd(),
        remoteRoot = "/home/vcap/app",
        sourceMaps = true,
        protocol = "inspector",
        skipFiles = { "<node_internals>/**/*.js", },
      })
    end
  },
}
