local on_attach = require 'lsp.on_attach'
local nvim_lsp = require 'lspconfig'
local fn = vim.fn
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local system_name
if vim.fn.has("mac") == 1 then
  system_name = "macOS"
elseif vim.fn.has("unix") == 1 then
  system_name = "Linux"
elseif vim.fn.has('win32') == 1 then
  system_name = "Windows"
else
  print("Unsupported system for sumneko")
end


-- install lua language server if not already installed
local install_path = fn.stdpath('cache')..'/lua-lang-server'
if fn.empty(fn.glob(install_path)) > 0 then
  print('you do not have the language server for lua installed ... ')
  print('check out these instructions here : https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#sumneko_lua')
  print('and this one as well: https://github.com/sumneko/lua-language-server/wiki/Build-and-Run-(Standalone)')
  print("install path " .. install_path)
  return
end



-- -- set the path to the sumneko installation; if you previously installed via the now deprecated :LspInstall, use
local sumneko_root_path = vim.fn.stdpath('cache')..'/lua-lang-server'
local sumneko_binary = sumneko_root_path.."/bin/"..system_name.."/lua-language-server"

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")


-- print("rooth path : "..sumneko_root_path)
-- print("binary : "..sumneko_binary)
-- print("main : ".. sumneko_root_path.."/main.lua")
-- print("runtime path : ")


nvim_lsp['sumneko_lua'].setup {
  cmd = { sumneko_binary, "-E", sumneko_root_path .. "/main.lua" },
  filetypes = { 'lua' },
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = runtime_path,
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}
