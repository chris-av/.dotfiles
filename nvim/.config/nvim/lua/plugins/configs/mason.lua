return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    require('mason').setup()
    require('mason-lspconfig').setup({
      automatic_installation = true,
      ensure_installed = {
        "bashls",
        "clangd",
        "cssls",
        "gopls",
        "html",
        "jdtls",
        "jsonls",
        "ltex",
        "lua_ls",
        "pyright",
        "r_language_server",
        "rust_analyzer",
        "tailwindcss",
        "ts_ls",
        "zls",
      },
    })
  end
}
