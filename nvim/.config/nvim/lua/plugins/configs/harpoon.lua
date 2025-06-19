return {
  "ThePrimeagen/harpoon",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("telescope").load_extension("harpoon")
    local harpoon = require("harpoon")
    local harpoonui = require("harpoon.ui")
    local harpoon_mark = require("harpoon.mark")

    local calculateWindowSize = function()
      local win_width = vim.api.nvim_win_get_width(0)
      local result = math.ceil(.65 * win_width)
      return result
    end

    harpoon.setup({
      -- sets the marks upon calling `toggle` on the ui, instead of require `:w`.
      save_on_toggle = false,

      -- saves the harpoon file upon every change. disabling is unrecommended.
      save_on_change = true,

      -- sets harpoon to run the command immediately as it's passed to the terminal when calling `sendCommand`.
      enter_on_sendcmd = false,

      -- closes any tmux windows harpoon that harpoon creates when you close Neovim.
      tmux_autoclose_windows = false,

      -- filetypes that you want to prevent from adding to the harpoon list menu.
      excluded_filetypes = { "harpoon" },

      -- set marks specific to each git branch inside git repository
      mark_branch = false,

      -- enable tabline with harpoon marks
      tabline = false,
      tabline_prefix = "   ",
      tabline_suffix = "   ",
      menu = {
        width = calculateWindowSize(),
      },
    })

    local harpoon_add = function()
      harpoon_mark.add_file()
      local curr_buff = vim.api.nvim_buf_get_name(0)
      print("added " .. curr_buff .. " to harpoon")
    end


    vim.keymap.set('n', '<S-l>', harpoonui.nav_next, { desc = "next buffer" })
    vim.keymap.set('n', '<S-h>', harpoonui.nav_prev, { desc = "previous buffer" })
    vim.keymap.set('n', '<leader>i', harpoon_add, { desc = "add file to harpoon" })
    vim.keymap.set('n', '<leader>ll', harpoonui.toggle_quick_menu, { desc = "open harpoon window" })

  end
}
