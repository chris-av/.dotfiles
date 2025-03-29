return {
  cmd = {
    "clangd",
    "--background-index",
    "--clang-tidy",
    "--log=verbose"
  },
  filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
  single_file_support = true,
}
