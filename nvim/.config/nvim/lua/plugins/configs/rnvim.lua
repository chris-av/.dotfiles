require("r").setup({
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
  auto_start = vim.env.R_AUTOSTART and "on startup" or "no", -- no
  objbr_auto_start = true,
  objbr_place = "BOTTOM",
  pipe_keymap = "<M-P>",
  pipe_version = "magrittr",
  assignment_keymap = "<M-=>",
  view_df = {
    open_app = "tmux new-window vd",
    how = "tabnew",
  },
})
