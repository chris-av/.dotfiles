return {
  adapter = {},
  configurations = {
    {
      type = "python",
      request = "launch",
      name = "Run python file",
      program = "${file}",
      cwd = "${workspaceFolder}",
    },
  },
  runners = {},
}
