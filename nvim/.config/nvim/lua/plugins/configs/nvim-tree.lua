return {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons"
  },
  config = function()
    local nvim_tree = require("nvim-tree")
    local vim = vim

    -- a list of groups can be found at `:help nvim_tree_highlight`
    vim.cmd([[ highlight NvimTreeFolderIcon ctermfg=blue guifg=blue ]])
    vim.cmd([[ highlight NvimTreeGitNew ctermfg=red guifg=red ]])
    vim.cmd([[ highlight NvimTreeGitDirty ctermfg=DarkGreen guifg=LightGreen ]])
    vim.cmd([[ highlight NvimTreeGitStaged ctermfg=DarkGreen guifg=LightGreen ]])

    local function on_attach(bufnr)
      local api = require('nvim-tree.api')
      local Event = api.events.Event

      local function opts(desc)
        return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
      end


      -- Default mappings. Feel free to modify or remove as you wish.
      --
      -- BEGIN_DEFAULT_ON_ATTACH
      vim.keymap.set('n', '<C-k>', api.node.show_info_popup, opts('Info'))
      vim.keymap.set('n', '<C-r>', api.fs.rename_sub, opts('Rename: Omit Filename'))
      vim.keymap.set('n', '<C-t>', api.node.open.tab, opts('Open: New Tab'))
      vim.keymap.set('n', '<C-v>', api.node.open.vertical, opts('Open: Vertical Split'))
      vim.keymap.set('n', '<C-x>', api.node.open.horizontal, opts('Open: Horizontal Split'))
      vim.keymap.set('n', '<BS>', api.node.navigate.parent_close, opts('Close Directory'))
      vim.keymap.set('n', '<CR>', api.node.open.edit, opts('Open'))
      vim.keymap.set('n', '<Tab>', api.node.open.preview, opts('Open Preview'))
      vim.keymap.set('n', '.', api.node.run.cmd, opts('Run Command'))
      vim.keymap.set('n', 'a', api.fs.create, opts('Create'))
      vim.keymap.set('n', 'B', api.tree.toggle_no_buffer_filter, opts('Toggle No Buffer'))
      vim.keymap.set('n', 'c', api.fs.copy.node, opts('Copy'))
      vim.keymap.set('n', 'C', api.node.navigate.git.prev_recursive, opts('Prev Git'))
      vim.keymap.set('n', 'c', api.node.navigate.git.next_recursive, opts('Next Git'))
      vim.keymap.set('n', 'd', api.fs.remove, opts('Delete'))
      vim.keymap.set('n', 'E', api.tree.expand_all, opts('Expand All'))
      vim.keymap.set('n', 'W', api.tree.collapse_all, opts('Collapse'))
      vim.keymap.set('n', 'e', api.fs.rename_basename, opts('Rename: Basename'))
      vim.keymap.set('n', ']e', api.node.navigate.diagnostics.next, opts('Next Diagnostic'))
      vim.keymap.set('n', '[e', api.node.navigate.diagnostics.prev, opts('Prev Diagnostic'))
      vim.keymap.set('n', 'g?', api.tree.toggle_help, opts('Help'))
      vim.keymap.set('n', 'gy', api.fs.copy.absolute_path, opts('Copy Absolute Path'))
      vim.keymap.set('n', 'H', api.tree.toggle_hidden_filter, opts('Toggle Dotfiles'))
      vim.keymap.set('n', 'I', api.tree.toggle_gitignore_filter, opts('Toggle Git Ignore'))
      vim.keymap.set('n', '>', api.node.navigate.sibling.next, opts('Next Sibling'))
      vim.keymap.set('n', '<', api.node.navigate.sibling.prev, opts('Previous Sibling'))
      vim.keymap.set('n', 'J', api.node.navigate.sibling.last, opts('Last Sibling'))
      vim.keymap.set('n', 'K', api.node.navigate.sibling.first, opts('First Sibling'))
      vim.keymap.set('n', 'o', api.node.open.edit, opts('Open'))
      vim.keymap.set('n', 'O', api.node.open.no_window_picker, opts('Open: No Window Picker'))
      vim.keymap.set('n', 'P', api.node.navigate.parent, opts('Parent Directory'))
      vim.keymap.set('n', 'q', api.tree.close, opts('Close'))
      vim.keymap.set('n', 'r', api.fs.rename, opts('Rename'))
      vim.keymap.set('n', 'R', api.tree.reload, opts('Refresh'))
      vim.keymap.set('n', 'U', api.tree.toggle_custom_filter, opts('Toggle Hidden'))
      vim.keymap.set('n', 'y', api.fs.copy.filename, opts('Copy Name'))
      vim.keymap.set('n', 'Y', api.fs.copy.relative_path, opts('Copy Relative Path'))
      -- END_DEFAULT_ON_ATTACH


      -- Mappings migrated from view.mappings.list
      --
      -- You will need to insert "your code goes here" for any mappings with a custom action_cb
      vim.keymap.set('n', '<CR>', api.node.open.edit, opts('Open'))
      vim.keymap.set('n', 'o', api.node.open.edit, opts('Open'))
      vim.keymap.set('n', '<2-LeftMouse>', api.node.open.edit, opts('Open'))
      vim.keymap.set('n', 's', api.node.open.vertical, opts('Open: Vertical Split'))
      vim.keymap.set('n', 'i', api.node.open.horizontal, opts('Open: Horizontal Split'))
      vim.keymap.set('n', '<', api.node.navigate.sibling.prev, opts('Previous Sibling'))
      vim.keymap.set('n', '>', api.node.navigate.sibling.next, opts('Next Sibling'))
      vim.keymap.set('n', 'P', api.node.navigate.parent, opts('Parent Directory'))
      vim.keymap.set('n', '<BS>', api.node.navigate.parent_close, opts('Close Directory'))
      vim.keymap.set('n', '<S-CR>', api.node.navigate.parent_close, opts('Close Directory'))
      vim.keymap.set('n', '<Tab>', api.node.open.preview, opts('Open Preview'))
      vim.keymap.set('n', 'K', api.node.navigate.sibling.first, opts('First Sibling'))
      vim.keymap.set('n', 'J', api.node.navigate.sibling.last, opts('Last Sibling'))
      vim.keymap.set('n', 'r', api.tree.reload, opts('Refresh'))
      vim.keymap.set('n', 'R', api.fs.rename, opts('Rename'))
      vim.keymap.set('n', 'a', api.fs.create, opts('Create'))
      vim.keymap.set('n', 'd', api.fs.remove, opts('Delete'))
      vim.keymap.set('n', '<C-r>', api.fs.rename_sub, opts('Rename: Omit Filename'))
      vim.keymap.set('n', 'y', api.fs.copy.filename, opts('Copy Name'))
      vim.keymap.set('n', 'Y', api.fs.copy.relative_path, opts('Copy Relative Path'))
      vim.keymap.set('n', 'gy', api.fs.copy.absolute_path, opts('Copy Absolute Path'))
      vim.keymap.set('n', 'q', api.tree.close, opts('Close'))

      api.events.subscribe(Event.TreeClose, function()
        if require("dap").session() then
          require("dapui").open({ reset = true, })
        end
      end)
    end




    nvim_tree.setup({
      on_attach           = on_attach,
      disable_netrw       = true,
      hijack_netrw        = true,
      open_on_tab         = true,
      hijack_cursor       = false,
      update_cwd          = false,
      diagnostics         = {
        enable = false,
        icons = {
          hint = "",
          info = "",
          warning = "",
          error = "",
        }
      },
      update_focused_file = {
        enable      = false,
        update_cwd  = false,
        ignore_list = {}
      },
      system_open         = {
        cmd  = nil,
        args = {}
      },
      filters             = {
        dotfiles = false,
        custom = {
          "^\\.git$"
        },
      },
      git                 = {
        enable = true,
        ignore = false,
        timeout = 500,
      },
      view                = {
        width = '25%',
        side = 'left',
        number = false,
        relativenumber = false,
        signcolumn = "yes"
      },
      renderer            = {
        icons = {
          web_devicons = {
            file = {
              enable = true,
              color = true,
            },
            folder = {
              enable = false,
              color = true,
            },
          },
          glyphs = {
            default = '',
            symlink = '',
            git = {
              -- untracked = "",
              -- unstaged = "✗",
              -- staged = "✓",

              untracked = "✗",
              unstaged = "",
              staged = "",

              unmerged = "",
              renamed = "➜",
              deleted = "",
              ignored = "◌"
            },
            folder = {
              -- arrow_open = "",
              -- arrow_closed = "",
              arrow_open = "",
              arrow_closed = "",
              default = "",
              open = "",
              empty = "",
              empty_open = "",
              symlink = "",
              symlink_open = "",
            }
          },
        },
        special_files = { "README.md", "Makefile", "MAKEFILE" }
      },
      actions             = {
        open_file = {
          quit_on_open = false,
          resize_window = true,
          window_picker = {
            enable = true,
            chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
            exclude = {
              filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
              buftype = { "nofile", "terminal", "help" },
            },
          },
        },
      },
      trash               = {
        cmd = "trash",
        require_confirm = true
      }
    })

    -- to ensure easy navigation
    vim.keymap.set('n', '<C-r>', ':mod<CR>', {})
    vim.keymap.set('n', '<C-n>', '<cmd>NvimTreeToggle<CR>', { desc = "toggle nvim tree" })
    vim.keymap.set('n', '<leader>r', '<cmd>NvimTreeRefresh<CR>', { desc = "refresh nvim tree" })
    vim.keymap.set('n', '<leader>n', '<cmd>NvimTreeFindFile<CR>', { desc = "find file within nvim tree" })

    -- auto close
    -- courtesy of @ppwwyyxx <3
    vim.api.nvim_create_autocmd("QuitPre", {
      callback = function()
        local invalid_win = {}
        local wins = vim.api.nvim_list_wins()
        for _, w in ipairs(wins) do
          local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(w))
          if bufname:match("NvimTree_") ~= nil then
            table.insert(invalid_win, w)
          end
        end
        if #invalid_win == #wins - 1 then
          -- Should quit, so we close all invalid windows.
          for _, w in ipairs(invalid_win) do vim.api.nvim_win_close(w, true) end
        end
      end
    })
  end
}
