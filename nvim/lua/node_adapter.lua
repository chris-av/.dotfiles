local dap = require('dap')
local dapui = require('dapui')

local function dapAttach()
  print('attaching node adapter')
  dapui.open()
  dap.run({
    type = 'node2',
    request = 'attach',
    cwd = vim.fn.getcwd(),
    sourceMaps=  true,
    protocol = 'inspector',
    skipFiles = { '<node_internals>/**/*.js' }
  })
end

local function dapAttachToRemote()
  print("attaching node remote adapter")
  dapui.open()
  dap.run({
    type = 'node2',
    request = 'attach',
    address = "127.0.0.1",
    port = 9229,
    localRoot = vim.fn.getcwd(),
    remoteRoot = "/home/vcap/app",
    sourceMaps = true,
    protocol = 'inspector',
    skipFiles = {'<node_internals>/**/*.js'}
  })
end


local function dapAttachClose()
  print('closing node adapter')
  dap.close()
  dapui.close()
end


local function dapAttachToRemoteClose()
  print('closing node adapter')
  dap.close()
  dapui.close()
end


return {

  attach = dapAttach,
  attachToRemote = dapAttachToRemote,

  attachClose = dapAttachClose,
  attachToRemoteClose = dapAttachToRemoteClose,

}
