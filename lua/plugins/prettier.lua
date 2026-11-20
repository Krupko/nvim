return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        javascript = { "prettier" },
        javascriptreact = { "prettier" },
        typescript = { "prettier" },
        typescriptreact = { "prettier" },
        json = { "prettier" },
        jsonc = { "prettier" },
        css = { "prettier" },
        scss = { "prettier" },
        html = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        -- prisma намеренно не указан: conform не поддерживает prisma-fmt.
        -- Форматирование Prisma выполняется через LSP prismals.
        -- PHP намеренно не указан здесь: им управляет lua/plugins/php.lua
      },
      formatters = {
        prettier = {
          prepend_args = {
            "--print-width",
            "100",
            "--tab-width",
            "2",
            "--single-quote",
            "true",
            "--jsx-single-quote",
            "true",
            "--jsx-bracket-same-line",
            "false",
            "--trailing-comma",
            "es5",
          },
        },
      },
      format_on_save = {
        timeout_ms = 500,
        lsp_format = "fallback",
      },
    },
  },
}
