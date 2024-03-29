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
    build = 'cd formatter && npm ci && npm run build',
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
  {
    'christoomey/vim-tmux-navigator',
    event = "BufReadPre", -- necessary for the plugin to work
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
  },
  "folke/twilight.nvim",
  "folke/zen-mode.nvim",
  {
    "ThePrimeagen/harpoon",
    dependencies = { "nvim-lua/plenary.nvim" }
  },
  {
    'stevearc/aerial.nvim',
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons"
    },
  },

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
    name = "embark",
  },
  -- 'B4mbus/oxocarbon-lua.nvim'
  'nyoom-engineering/oxocarbon.nvim',
  'sam4llis/nvim-tundra',
  { "rose-pine/neovim", name = "rose-pine" },
  { "morhetz/gruvbox",  name = "gruvbox" },


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
  {
    "narutoxy/silicon.lua",
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  -- non neovim plugins
  'maxmellon/vim-jsx-pretty'
  -- 'ryanoasis/vim-devicons'
}

return plugins
