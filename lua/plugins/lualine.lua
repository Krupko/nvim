return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
      -- Добавляем React индикатор
      table.insert(opts.sections.lualine_x, {
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
