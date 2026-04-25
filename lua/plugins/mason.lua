-- ~/.config/nvim/lua/plugins/mason.lua
return {
  {
    "mason-org/mason.nvim",
    build = ":MasonUpdate",
    opts = {
      ensure_installed = {
        -- LSP серверы
        "typescript-language-server",
        "eslint-lsp",
        "tailwindcss-language-server",
        "emmet-ls",
        "json-lsp",
        "html-lsp",
        "css-lsp",
        "lua-language-server",
        -- Форматтеры
        "prettier",
        "prettierd",
        "eslint_d",
        "prisma",
      },
      ui = {
        border = "rounded",
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    },
  },
}
