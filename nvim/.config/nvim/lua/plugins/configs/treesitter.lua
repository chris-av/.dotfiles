return {
  "nvim-treesitter/nvim-treesitter",
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
      "json", "jsdoc", "json5",
      "toml", "yaml",

      -- query lang
      "query", "sql", "graphql",

      -- markup
      "markdown", "markdown_inline",
      "xml",
      "latex", "bibtex",
      "ledger",
    }

    local ts = require("nvim-treesitter")
    ts.setup({
      install_dir = vim.fn.stdpath("data") .. '/site',
    })
    ts.install(ensure_installed)
  end
}
