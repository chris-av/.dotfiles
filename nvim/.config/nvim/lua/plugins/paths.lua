local datapath = vim.fn.stdpath("data")
return {
  lazydir = datapath .. "/site/lazy",
  lazypath = datapath .. "/site/lazy/lazy.nvim",
  devdir = datapath .. "/plugin-dev",
}
