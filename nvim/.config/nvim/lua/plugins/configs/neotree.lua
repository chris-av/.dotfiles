return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },
  config = function()
    vim.keymap.set('n', '<C-n>', '<cmd>Neotree toggle reveal=true<CR>', { desc = "toggle nvim tree" })

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
          ["q"] = "cancel",
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

          -- remove keymappings
          ["/"] = "",
          ["f"] = "",

          ["c"] = "next_git_modified",
          ["C"] = "prev_git_modified",
        },
      },
      event_handlers = {
        {
          event = "neo_tree_popup_input_ready",
          ---@param args { bufnr: integer, winid: integer }
          handler = function(args)
            -- map <esc> to enter normal mode (by default closes prompt)
            -- don't forget `opts.buffer` to specify the buffer of the popup.
            vim.keymap.set("i", "<esc>", vim.cmd.stopinsert, { noremap = true, buffer = args.bufnr })
          end,
        },
      },
    })
  end,
}
