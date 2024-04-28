local opts = {
  R_args = { "--quiet", "--no-save" },
  hook = {
    after_config = function()
      -- This function will be called at the FileType event
      -- of files supported by R.nvim. This is an
      -- opportunity to create mappings local to buffers.
      if vim.o.syntax ~= "rbrowser" then
        vim.api.nvim_buf_set_keymap(0, "n", "<Enter>", "<Plug>RDSendLine", {})
        vim.api.nvim_buf_set_keymap(0, "v", "<Enter>", "<Plug>RSendSelection", {})
      end
    end
  },
  min_editor_width = 72,
  rconsole_width = 90,
  disable_cmds = {
    "RClearConsole",
    "RCustomStart",
    "RSPlot",
    "RSaveClose",
  },
  auto_start = "on startup",
  objbr_auto_start = true,
  objbr_place = "BOTTOM",
  rconsole_with = 40,
}

-- Check if the environment variable "R_AUTO_START" exists.
-- If using fish shell, you could put in your config.fish:
-- alias r "R_AUTO_START=true nvim"
if vim.env.R_AUTO_START == "true" then
  opts.auto_start = 1
  opts.objbr_auto_start = true
end

require("r").setup(opts)

