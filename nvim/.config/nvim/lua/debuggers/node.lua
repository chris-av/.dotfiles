-- :DIInstall jsnode
local dap = require('dap')
local dapui = require('dapui')


local home = os.getenv('HOME')
local my_os = vim.loop.os_uname().sysname

local macos_loc = home .. '/.local/share/nvim/dapinstall/jsnode/vscode-node-debug2/out/src/nodeDebug.js'
local linux_loc = home .. '/.local/share/nvim/mason/packages/node-debug2-adapter/out/src/nodeDebug.js'
local use_loc = macos_loc

if my_os == "Linux" then
  use_loc = linux_loc
end


dap.adapters.node2 = {
  type = 'executable',
  command = 'node',
  args = {
    use_loc
  }
}

dap.configurations.javascript = {
  {
    name = 'Launch',
    type = 'node2',
    request = 'launch',
    program = '${file}',
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    protocol = 'inspector',
    console = 'integratedTerminal'
  },
  {
    -- For this to work you need to make sure the node process is started with the `--inspect` flag.
    name = 'Attach to process',
    type = 'node2',
    request = 'attach',
    processId = require 'dap.utils'.pick_process,
  },
}


local function dapAttach()
  print('attaching node adapter')
  dap.run({
    type = 'node2',
    request = 'attach',
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    protocol = 'inspector',
    processId = require('dap.utils').pick_process(),
    skipFiles = { '<node_internals>/**/*.js' }
  })
end

local function dapAttachToRemote()
  print("attaching node remote adapter")
  dap.run({
    type = 'node2',
    request = 'attach',
    address = "127.0.0.1",
    port = 9229,
    localRoot = vim.fn.getcwd(),
    remoteRoot = "/home/vcap/app",
    sourceMaps = true,
    protocol = 'inspector',
    skipFiles = { '<node_internals>/**/*.js' }
  })
end


return {
  attach = dapAttach,
  attachToRemote = dapAttachToRemote,
}
