require('telescope').load_extension('dap')
require('debugger.python')
require('debugger.node')
require('debugger.dapui')


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






local dap_install = require("dap-install")

dap_install.setup({
	installation_path = vim.fn.stdpath("data") .. "/dapinstall/",
})







