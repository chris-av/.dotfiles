local lazydir = vim.fn.stdpath("data") .. '/site/lazy'
local lazypath = vim.fn.stdpath("data") .. '/site/lazy/lazy.nvim'
local devpath = vim.fn.stdpath("data") .. '/plugin-dev'


if not vim.loop.fs_stat(lazypath) then
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




local plugins = {
  {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },

  -- lsp
  'neovim/nvim-lspconfig',
  'nvim-treesitter/nvim-treesitter',
  'nvim-treesitter/playground',
  'mfussenegger/nvim-jdtls',
  'ziglang/zig.vim',
  {
    'laytan/tailwind-sorter.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-lua/plenary.nvim' },
    build = 'cd formatter && npm i && npm run build',
    config = true,
  },

  -- interface
  'nvim-tree/nvim-web-devicons',
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons', }
  },
  {
    'SmiteshP/nvim-navic',
    dependencies = {
      'neovim/nvim-lspconfig',
    },
  },
  'tpope/vim-fugitive',
  'lewis6991/gitsigns.nvim',
  {
    'akinsho/bufferline.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
      'moll/vim-bbye'
    },
  },
  'tiagovla/scope.nvim',
  'voldikss/vim-floaterm',
  'rcarriga/nvim-notify',
  {
    'kevinhwang91/nvim-ufo',
    dependencies = {
      'kevinhwang91/promise-async'
    }
  },
  'christoomey/vim-tmux-navigator',

  -- completion
  'hrsh7th/nvim-cmp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-nvim-lua',
  'hrsh7th/cmp-nvim-lsp',
  'saadparwaiz1/cmp_luasnip',
  'windwp/nvim-autopairs',
  'windwp/nvim-ts-autotag',
  'L3MON4D3/LuaSnip',
  'rafamadriz/friendly-snippets',
  'numToStr/Comment.nvim',
  'kylechui/nvim-surround',

  -- colorschemes
  'marko-cerovac/material.nvim',
  'projekt0n/github-nvim-theme',
  {
    "catppuccin/nvim",
  },
  {
    "embark-theme/vim",
  },
  -- 'B4mbus/oxocarbon-lua.nvim'
  'nyoom-engineering/oxocarbon.nvim',
  'sam4llis/nvim-tundra',


  -- debugger
  'mfussenegger/nvim-dap',
  'nvim-telescope/telescope-dap.nvim',
  'theHamsta/nvim-dap-virtual-text',
  'mfussenegger/nvim-dap-python',
  {
    'rcarriga/nvim-dap-ui',
    dependencies = {
      'mfussenegger/nvim-dap'
    }
  },


  -- telescope
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'BurntSushi/ripgrep',
      'sharkdp/fd',
    }
  },

  -- nvim tree
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
      'nvim-tree/nvim-web-devicons'
    },
  },

  -- miscellaneous
  -- { 'krivahtoo/silicon.nvim', run = './install.sh build' }

  -- non neovim plugins
  'maxmellon/vim-jsx-pretty'
  -- 'ryanoasis/vim-devicons'
}



local opts = {
  root = lazydir, -- directory where plugins will be installed
  defaults = {
    lazy = false, -- should plugins be lazy-loaded?
  },
  -- leave nil when passing the spec as the first argument to setup()
  lockfile = vim.fn.stdpath("config") .. "/lazy-lock.json", -- lockfile generated after running update.
  git = {
    -- defaults for the `Lazy log` command
    -- log = { "-10" }, -- show the last 10 commits
    log = { "-8" }, -- show commits from the last 3 days
    timeout = 120,  -- kill processes that take more than 2 minutes
    url_format = "https://github.com/%s.git",
    -- lazy.nvim requires git >=2.19.0. If you really want to use lazy with an older version,
    -- then set the below to false. This should work, but is NOT supported and will
    -- increase downloads a lot.
    filter = true,
  },
  dev = {
    -- directory where you store your local plugin projects
    path = devpath,
    ---@type string[] plugins that match these patterns will use your local versions instead of being fetched from GitHub
    patterns = {},    -- For example {"folke"}
    fallback = false, -- Fallback to git when local plugin doesn't exist
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
    wrap = true, -- wrap the lines in the ui
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
    notify = true,    -- get a notification when new updates are found
    frequency = 3600, -- check for updates every hour
  },
  change_detection = {
    -- automatically check for config file changes and reload the ui
    enabled = true,
    notify = true, -- get a notification when changes are found
  },
  performance = {
    cache = {
      enabled = true,
    },
    reset_packpath = true, -- reset the package path to improve startup time
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
  state = vim.fn.stdpath("state") .. "/lazy/state.json", -- state info for checker and other things
  build = {
    -- Plugins can provide a `build.lua` file that will be executed when the plugin is installed
    -- or updated. When the plugin spec also has a `build` command, the plugin's `build.lua` not be
    -- executed. In this case, a warning message will be shown.
    warn_on_override = true,
  },
}





require("lazy").setup(plugins, opts)
