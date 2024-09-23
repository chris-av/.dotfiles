local opts = {
  R_args = { "--quiet", "--no-save" },
  hook = {
    after_config = function()
      -- This function will be called at the FileType event
      -- of files supported by R.nvim. This is an
      -- opportunity to create mappings local to buffers.
      if vim.o.syntax ~= "rbrowser" then
        vim.keymap.set("n", "<Enter>", "<Plug>RDSendLine", { desc = "R - Send current line to console" })
        vim.keymap.set("v", "<Enter>", "<Plug>RSendSelection", { desc = "R - Send current selection to console" })
        vim.keymap.set("n", "<leader>p", "<Plug>RViewDF", { desc = "R - open dataframe under cursor with dv" })
      end
    end
  },
  -- min_editor_width = 72,
  rconsole_width = 120,
  disable_cmds = {
    "RClearConsole",
    "RCustomStart",
    "RSPlot",
    "RSaveClose",
  },
  -- auto_start = "on startup", -- no
  auto_start = "no", -- no
  objbr_auto_start = true,
  objbr_place = "BOTTOM",
  csv_app = "terminal:vd",
  pipe_keymap = "<M-P>",
  pipe_version = "magrittr",
  assignment_keymap = "<M-=>",
}

-- Check if the environment variable "R_AUTO_START" exists.
-- If using fish shell, you could put in your config.fish:
-- alias r "R_AUTO_START=true nvim"
if vim.env.R_AUTO_START == "true" then
  opts.auto_start = 1
  opts.objbr_auto_start = true
end

require("r").setup(opts)
