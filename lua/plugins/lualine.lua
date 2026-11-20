return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
      opts.sections = opts.sections or {}
      opts.sections.lualine_x = opts.sections.lualine_x or {}

      -- Вставляем React-индикатор в начало секции, сохраняя порядок стандартных элементов
      table.insert(opts.sections.lualine_x, 1, {
        function()
          local ft = vim.bo.filetype
          if ft == "javascriptreact" then
            return "⚛ JSX"
          elseif ft == "typescriptreact" then
            return "⚛ TSX"
          elseif ft == "typescript" then
            return "TS"
          elseif ft == "javascript" then
            return "JS"
          end
          return ""
        end,
        color = { fg = "#61dafb" },
      })

      return opts
    end,
  },
}
