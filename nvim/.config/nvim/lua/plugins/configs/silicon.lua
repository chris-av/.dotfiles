return {
  "narutoxy/silicon.lua",
  -- { "krivahtoo/silicon.nvim", run = "./install.sh build" }
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local silicon = require('silicon')

    -- create folder that will contain the silicon screenshots
    local dir = vim.fn.expand("~/Desktop/silicon/")
    if vim.fn.isdirectory(dir) == 0 then
      vim.notify("did not find " .. dir, vim.log.levels.ERROR)
      vim.notify("creating dir " .. dir, vim.log.levels.INFO)
      vim.fn.mkdir(dir)
    end

    local timefmt = os.date("%Y-%m-%d--%H:%M:%S")
    local filename = "silicon-" .. timefmt .. ".png"
    local outpath = dir .. filename

    silicon.setup({
      theme = "auto",
      output = outpath,
      bgColor = vim.g.terminal_color_5,
      -- bgImage = "",
      roundCorner = true,
      windowControls = true,
      lineNumber = true,
      font = "Source Code Pro",
      lineOffset = 1, -- from where to start line number
      linePad = 2,  -- padding between lines
      padHoriz = 80, -- Horizontal padding
      padVert = 100, -- vertical padding
      shadowBlurRadius = 10,
      shadowColor = "#555555",
      shadowOffsetX = 8,
      shadowOffsetY = 8,
      gobble = false, -- enable lsautogobble like feature
      debug = false, -- enable debug output
    })

    local exec_silicon = function()
      local opts = { to_clip = false, show_buf = true, }
      silicon.visualise_api(opts)
    end

    local exec_silicon_visual = function()
      local opts = { to_clip = false, }
      silicon.visualise_api(opts)
    end

    vim.keymap.set('n', '<leader>s', exec_silicon, { desc = "Silicon - save contents of buffer" })
    vim.keymap.set('v', '<leader>s', exec_silicon_visual, { desc = "Silicon - save visual selected lines" })

  end
}
