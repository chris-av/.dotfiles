return {
  cmd = { 'bash-language-server', 'start' },
  filetypes = { 'sh', 'conf' },
  cmd_env = {
    GLOB_PATTERN = "*@(.sh|.inc|.bash|.command)"
  },
}
