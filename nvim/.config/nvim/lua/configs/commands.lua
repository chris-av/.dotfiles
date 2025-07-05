local launch_bashserver = function()
  local config = {
    cmd = { 'bash-language-server', 'start' },
  }
  local client_id = vim.lsp.start_client(config)
  if client_id then
    vim.lsp.buf_attach_client(0, client_id)
  end
end


vim.api.nvim_create_user_command(
  'LaunchBashServer',
  launch_bashserver,
  { desc = "Start bash lsp" }
)

local toggle_virt_diag = function()
  if vim.g.diagnostic_activated == nil then
    vim.g.diagnostic_activated = false
  end
  vim.g.diagnostic_activated = not vim.g.diagnostic_activated
  vim.diagnostic.config({
    virtual_lines = vim.g.diagnostic_activated,
  })
end

vim.api.nvim_create_user_command(
  "ToggleDiagnosticLines",
  toggle_virt_diag,
  { desc = "toggle virtual line diagnostics", }
)

local group = vim.api.nvim_create_augroup('term', { clear = true })
vim.api.nvim_create_autocmd("TermOpen", {
  pattern = {},
  command = "setlocal listchars = nonumber norelativenumber",
  group = group,
})

local lsp_maps = vim.api.nvim_create_augroup("LspKeymaps", { clear = true })
vim.api.nvim_create_autocmd('LspAttach', {
  group = lsp_maps,
  desc = "LSP-specific keymaps",
  callback = function()
    local buf = vim.lsp.buf

    vim.keymap.set('n', 'gD', buf.declaration, { desc = "Buffer declarations" })
    vim.keymap.set('n', 'gd', buf.definition, { desc = "Go to definition" })
    vim.keymap.set('n', 'K', function()
      local hover = buf.hover
      local winid = require('ufo').peekFoldedLinesUnderCursor()
      if not winid then
        hover()
      end
    end, { desc = "View definition" })
    vim.keymap.set('n', 'gi', buf.implementation, { desc = "Get implementation" })
    vim.keymap.set('n', 'SH', buf.signature_help, { desc = "Signature help" })
    vim.keymap.set('n', '<space>wa', buf.add_workspace_folder, { desc = "Add workspace to folder" })
    vim.keymap.set('n', '<space>wr', buf.remove_workspace_folder, { desc = "remove workspace from folder" })
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(buf.list_workspace_folders()))
    end, { desc = "List workspace folders" })
    vim.keymap.set('n', '<space>D', buf.type_definition, { desc = "Type definition" })
    vim.keymap.set('n', '<space>rn', buf.rename, { desc = "Rename" })
    vim.keymap.set('n', '<space>ca', buf.code_action, { desc = "Code action" })
    vim.keymap.set('n', 'gr', buf.references, { desc = "Get references" })

    vim.keymap.set('n', '<space>e', function()
      vim.diagnostic.open_float({ bufnr = 0, border = "single" })
    end, { desc = "Open diagnostic on current line" })
    vim.keymap.set('n', '[d', function()
      vim.diagnostic.jump({ count = 1, float = { border = "single" } })
    end, { desc = "Jump to next diagnostic" })
    vim.keymap.set('n', ']d', function()
      vim.diagnostic.jump({ count = -1, float = { border = "single" } })
    end, { desc = "Jump to previous diagnostic" })
    vim.keymap.set('n', '<space>q', function()
      vim.diagnostic.setloclist({ open = false }) -- don't open and focus
      local window = vim.api.nvim_get_current_win()
      vim.cmd.lwindow()                           -- open+focus loclist if has entries, else close -- this is the magic toggle command
      vim.api.nvim_set_current_win(window)        -- restore focus to window you were editing (delete this if you want to stay in loclist)
    end, { desc = "Set diagnostic list" })
    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format({ async = true, })
    end, { desc = "Format file" })
  end,
})

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
