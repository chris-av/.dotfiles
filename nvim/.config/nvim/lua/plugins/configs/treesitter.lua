return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    "nvim-treesitter/playground",
  },
  config = function()
    local ensure_installed = {
      -- other programming languages
      "c", "make",
      "cpp",
      "c_sharp",
      "java",
      "go",
      "lua", "luadoc",
      "llvm",
      "python",
      "r",
      "rust",


      -- system
      "bash", "awk",
      "perl",
      "regex",
      "git_config", "git_rebase", "gitattributes", "gitcommit", "gitignore",
      "ssh_config",

      -- vim / nvim
      "vim", "vimdoc",

      -- web dev
      "html", "css", "htmldjango", "http", "scss",
      "javascript", "jq",
      "tsx", "typescript",


      -- config files
      "dockerfile",
      "json", "jsdoc", "json5", "jsonc",
      "toml", "yaml",

      -- query lang
      "query", "sql", "graphql",

      -- markup
      "markdown", "markdown_inline",
      "xml",
      "latex", "bibtex",
      "ledger",
    }

    require('nvim-treesitter.configs').setup({
      auto_install = true,
      ignore_install = {},
      ensure_installed = ensure_installed,
      sync_install = false,
      highlight = {
        enable = true,
        disable = "",

        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = true,
      },
      indent = {
        enable = true,
        disable = { 'yaml', 'javascript' }
      },
    })
  end
}
