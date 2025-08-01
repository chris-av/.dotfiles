local notify = require("utils.notifications")
local datapath = vim.fn.stdpath("data")

local lazydir = vim.fs.joinpath(datapath, "lazy")
local lazypath = vim.fs.joinpath(datapath, "lazy", "lazy.nvim")
local devdir = vim.fs.joinpath(datapath, "plugin-dev")

-- create the directory if it doesnt exist ...
for _, dir in ipairs({ lazydir, devdir }) do
  if vim.fn.isdirectory(dir) == 0 then
    vim.fn.mkdir(dir, 'p')
  end
end

if not vim.loop.fs_stat(lazypath) then
  notify.notify_warn("Lazy", "did not find lazy in runtimepath, cloing it to : " .. lazypath)
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)


require("lazy").setup({
  spec = {
    -- lsp
    "mfussenegger/nvim-jdtls",
    "ziglang/zig.vim",
    -- interface
    "stevearc/dressing.nvim",
    "tpope/vim-fugitive",
    "tiagovla/scope.nvim",
    -- tmux
    {
      "christoomey/vim-tmux-navigator",
      event = "BufReadPre", -- necessary for the plugin to work
    },
    -- markdown preview
    {
      "iamcco/markdown-preview.nvim",
      cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
      ft = { "markdown" },
      build = function() vim.fn["mkdp#util#install"]() end,
    },
    -- colorschemes
    {
      "local/embark.vim",
      dev = true,
    },
    -- "B4mbus/oxocarbon-lua.nvim"
    "nyoom-engineering/oxocarbon.nvim",
    { "morhetz/gruvbox",          name = "gruvbox" },
    -- jsx
    "maxmellon/vim-jsx-pretty",

    -- all other specs
    { import = "plugins.configs", },
  },
  root = lazydir,   -- directory where plugins will be installed
  defaults = {
    lazy = false,   -- should plugins be lazy-loaded?
  },
  -- leave nil when passing the spec as the first argument to setup()
  lockfile = vim.fn.stdpath("config") .. "/lazy-lock.json",   -- lockfile generated after running update.
  git = {
    -- defaults for the `Lazy log` command
    -- log = { "-10" }, -- show the last 10 commits
    log = { "-8" },   -- show commits from the last 3 days
    timeout = 120,    -- kill processes that take more than 2 minutes
    url_format = "https://github.com/%s.git",
    -- lazy.nvim requires git >=2.19.0. If you really want to use lazy with an older version,
    -- then set the below to false. This should work, but is NOT supported and will
    -- increase downloads a lot.
    filter = true,
  },
  dev = {
    -- directory where you store your local plugin projects
    path = devdir,
    ---@type string[] plugins that match these patterns will use your local versions instead of being fetched from GitHub
    patterns = { "local" },   -- For example {"folke"}
    fallback = false,         -- Fallback to git when local plugin doesn't exist
  },
  install = {
    -- install missing plugins on startup. This doesn't increase startup time.
    missing = true,
    -- try to load one of these colorschemes when starting an installation during startup
    colorscheme = { "habamax" },
  },
  ui = {
    -- a number <1 is a percentage., >1 is a fixed size
    size = { width = 0.8, height = 0.8 },
    wrap = true,   -- wrap the lines in the ui
    -- The border to use for the UI window. Accepts same border values as |nvim_open_win()|.
    border = "none",
    title = nil, ---@type string only works when border is not "none"
    title_pos = "center", ---@type "center" | "left" | "right"
    -- Show pills on top of the Lazy window
    pills = true, ---@type boolean
    icons = {
      cmd = " ",
      config = "",
      event = "",
      ft = " ",
      init = " ",
      import = " ",
      keys = " ",
      lazy = "󰒲 ",
      loaded = "●",
      not_loaded = "○",
      plugin = " ",
      runtime = " ",
      source = " ",
      start = "",
      task = "✔ ",
      list = {
        "●",
        "➜",
        "★",
        "‒",
      },
    },
  },
  diff = {
    -- diff command <d> can be one of:
    -- * browser: opens the github compare view. Note that this is always mapped to <K> as well,
    --   so you can have a different command for diff <d>
    -- * git: will run git diff and open a buffer with filetype git
    -- * terminal_git: will open a pseudo terminal with git diff
    -- * diffview.nvim: will open Diffview to show the diff
    cmd = "git",
  },
  checker = {
    -- automatically check for plugin updates
    enabled = false,
    concurrency = nil, ---@type number? set to 1 to check for updates very slowly
    notify = true,      -- get a notification when new updates are found
    frequency = 3600,   -- check for updates every hour
  },
  change_detection = {
    -- automatically check for config file changes and reload the ui
    enabled = false,
    notify = false,   -- get a notification when changes are found
  },
  performance = {
    cache = {
      enabled = true,
    },
    reset_packpath = true,   -- reset the package path to improve startup time
  },
  -- lazy can generate helptags from the headings in markdown readme files,
  -- so :help works even for plugins that don't have vim docs.
  -- when the readme opens with :help it will be correctly displayed as markdown
  readme = {
    enabled = true,
    root = vim.fn.stdpath("state") .. "/lazy/readme",
    files = { "README.md", "lua/**/README.md" },
    -- only generate markdown helptags for plugins that dont have docs
    skip_if_doc_exists = true,
  },
  state = vim.fn.stdpath("state") .. "/lazy/state.json",   -- state info for checker and other things
  build = {
    -- Plugins can provide a `build.lua` file that will be executed when the plugin is installed
    -- or updated. When the plugin spec also has a `build` command, the plugin's `build.lua` not be
    -- executed. In this case, a warning message will be shown.
    warn_on_override = true,
  },
})
