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
        css = { "prettier" },
        scss = { "prettier" },
        html = { "prettier" },
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