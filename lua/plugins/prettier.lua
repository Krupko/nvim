return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
      },
      formatters = {
        prettier = {
          prepend_args = {
            "--jsx-bracket-same-line", "false",
            "--jsx-single-quote", "true",
          },
        },
      },
      format_on_save = true,
    },
  },
}