vim.api.nvim_create_user_command(
  "ToggleDiagnosticLines",
  function()
    if vim.g.diagnostic_activated == nil then
      vim.g.diagnostic_activated = false
    end
    vim.g.diagnostic_activated = not vim.g.diagnostic_activated
    vim.diagnostic.config({
      virtual_lines = vim.g.diagnostic_activated,
    })
  end,
  { desc = "toggle virtual line diagnostics", }
)

local group = vim.api.nvim_create_augroup('term', { clear = true })
vim.api.nvim_create_autocmd("TermOpen", {
  pattern = {},
  command = "setlocal listchars = nonumber norelativenumber",
  group = group,
})

vim.api.nvim_create_user_command(
  "LspInfo",
  function()
    vim.cmd("checkhealth vim.lsp")
  end,
  { desc = "Show lsp information in the current buffer" }
)

vim.api.nvim_create_user_command(
  "LspRestart",
  function()
    local current_clients = vim.lsp.get_clients()
    for _, client in ipairs(current_clients) do
      vim.notify("restarting client " .. client.name, vim.log.levels.INFO, {
        title = "LSP",
      })
      vim.lsp.enable(client.name, false)
      vim.lsp.enable(client.name, true)
    end
  end,
  { desc = "Restart all currently active LSP clients", }
)

vim.api.nvim_create_user_command(
  "ExportThemes",
  function()
    local palettes = {}
    local uv = vim.uv
    local themes = require("_themes")

    for theme_name, theme in pairs(themes) do
      if theme_name == "_defaults" then
        goto skipping
      end

      palettes[theme_name] = {}
      palettes[theme_name]["kitty"] = theme.kitty
      palettes[theme_name]["theme"] = theme.theme

      ::skipping::
    end

    local json_str = vim.fn.json_encode(palettes)
    local home = os.getenv("HOME")
    local filename = "nvim-themes.json"
    local export_path = vim.fs.joinpath(home, ".cache", filename)
    local fd = uv.fs_open(export_path, "w+", tonumber('660', 8))
    if fd == nil then
      print("fd is nil, exiting now")
      return
    end
    uv.fs_write(fd, json_str, 0, function()
      print("exported theme file to : " .. export_path)
    end)
  end,
  { desc = "Export theme assets into a JSON file", }
)
