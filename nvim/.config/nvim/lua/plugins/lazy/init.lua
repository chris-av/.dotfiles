local paths = require("plugins.lazy.paths")
local lazydir = paths.lazydir
local lazypath = paths.lazypath
local devdir = paths.devdir

-- create the directory if it doesnt exist ... 
for _, dir in ipairs({ lazydir, devdir }) do
  if vim.fn.isdirectory(dir) == 0 then
    vim.fn.mkdir(dir, 'p')
  end
end

if not vim.loop.fs_stat(lazypath) then
  print("did not find lazy in runtimepath (rtp), cloning it to : " .. lazypath)
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


local plugins = require("plugins.lazy.list")
local lay_opts = require("plugins.lazy.opts")
require("lazy").setup(plugins, lay_opts)
