return {
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        scss = { "stylelint" },
        css = { "stylelint" },
        sass = { "stylelint" },
        less = { "stylelint" },
      },
      linters = {
        stylelint = {
          cmd = "pnpm",
          args = { "exec", "stylelint", "--stdin", "--stdin-filename", "$FILENAME", "--formatter", "json" },
          stdin = true,
          stream = "stdout",
          ignore_exitcode = true,
          parser = function(output, bufnr)
            local results = vim.fn.json_decode(output)
            if not results or #results == 0 then
              return {}
            end

            local diagnostics = {}
            for _, result in ipairs(results) do
              for _, warning in ipairs(result.warnings or {}) do
                if warning.line then
                  table.insert(diagnostics, {
                    lnum = warning.line - 1,
                    col = warning.column or 1,
                    end_col = warning.endColumn,
                    message = warning.text,
                    severity = vim.diagnostic.severity.ERROR,
                    source = "stylelint",
                  })
                end
              end
            end
            return diagnostics
          end,
        },
      },
    },
    config = function(_, opts)
      local lint = require("lint")
      lint.linters_by_ft = opts.linters_by_ft
      lint.linters = opts.linters

      -- Автоматический запуск при сохранении
      vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
        pattern = { "*.css", "*.scss", "*.sass", "*.less" },
        callback = function()
          lint.try_lint()
        end,
      })

      -- Также запускаем при открытии файла
      vim.api.nvim_create_autocmd("BufEnter", {
        pattern = { "*.css", "*.scss", "*.sass", "*.less" },
        callback = function()
          lint.try_lint()
        end,
      })
    end,
  },
}
