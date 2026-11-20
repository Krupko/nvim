return {
  {
    "mfussenegger/nvim-lint",
    opts = function(_, opts)
      opts.linters_by_ft = vim.tbl_deep_extend("force", opts.linters_by_ft or {}, {
        scss = { "stylelint" },
        css = { "stylelint" },
        sass = { "stylelint" },
        less = { "stylelint" },
      })

      opts.linters = vim.tbl_deep_extend("force", opts.linters or {}, {
        stylelint = {
          cmd = "pnpm",
          args = { "exec", "stylelint", "--stdin", "--stdin-filename", "$FILENAME", "--formatter", "json" },
          stdin = true,
          stream = "stdout",
          ignore_exitcode = true,
          parser = function(output)
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
      })
    end,
    config = function()
      local lint = require("lint")

      -- Автоматический запуск при сохранении и выходе из insert
      vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
        pattern = { "*.css", "*.scss", "*.sass", "*.less" },
        callback = function()
          lint.try_lint()
        end,
      })

      -- Запуск при открытии файла
      vim.api.nvim_create_autocmd("BufEnter", {
        pattern = { "*.css", "*.scss", "*.sass", "*.less" },
        callback = function()
          lint.try_lint()
        end,
      })
    end,
  },
}
