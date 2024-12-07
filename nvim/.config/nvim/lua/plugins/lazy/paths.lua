local datapath = vim.fn.stdpath("data")
return {
  lazydir = datapath .. "/lazy",
  lazypath = datapath .. "/lazy/lazy.nvim",
  devdir = datapath .. "/plugin-dev",
}
