return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },
  config = function()
    vim.keymap.set('n', '<C-n>', '<cmd>Neotree toggle<CR>', { desc = "toggle nvim tree" })

    require("neo-tree").setup({
      close_if_last_window = true,
      filesystem = {
        filtered_items = {
          hide_dotfiles = false,
          hide_gitignored = false,
          hide_by_pattern = {
            ".git",
          },
        }
      },
      default_component_configs = {
        git_status = {
          symbols = {
            -- Change type
            added = " ", -- or "✚", but this is redundant info if you use git_status_colors on the name
            modified = " ", -- or "", but this is redundant info if you use git_status_colors on the name
            deleted = " ", -- this can only be used in the git_status source
            renamed = "󰁕", -- this can only be used in the git_status source
            -- Status type
            untracked = "✗",
            ignored = "◌",
            unstaged = "",
            staged = "",
            conflict = "",
          },
        },
        modified = {
          symbol = "[+] ",
          highlight = "NeoTreeModified",
        }
      },
      window = {
        position = "left",
        width = "fit_content",
        mappings = {
          ["<cr>"] = "open",
          ["<esc>"] = "cancel",
          -- opening files
          ["<C-x>"] = "open_split",
          ["<C-v>"] = "open_vsplit",
          -- file system management
          ["a"] = "add",               -- add file
          ["x"] = "delete",            -- delete file
          ["R"] = "rename",            -- rename file
          ["r"] = "refresh",           -- refresh
          ["F"] = "",                  -- neotree filter
          -- misc
          ["?"] = "show_help",         -- neotree filter
          ["."] = "show_file_details", -- neotree filter
          ["P"] = "toggle_preview",
          ["l"] = "focus_preview",

          -- remove keymappints
          ["/"] = "",
          ["f"] = "",
        },
      },
    })
  end,
}
