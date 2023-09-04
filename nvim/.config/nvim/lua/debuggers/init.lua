require('telescope').load_extension('dap')
require('debuggers.python')
require('debuggers.node')
require('debuggers.dapui')


require('dap').set_log_level('DEBUG')



local signs = {
  DapBreakpoint = "",
  DapBreakpointCondition = "",
  DapBreakpointRejected = "",
  DapLogPoint = "",
  DapStopped = "◌"
}

for type, icon in pairs(signs) do
  vim.fn.sign_define(type, { text = icon, texthl = type, numhl = "" })
end







