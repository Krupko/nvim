return {
  {
    "LazyVim/LazyVim",
    opts = function(_, opts)
      -- Сохраняем стандартный ключ для вставки, но используем "чёрную дыру" ("_)
      -- для того, чтобы вставка не перезаписывала системный буфер обмена
      -- vim.keymap.set({ "n", "v" }, "p", '"_p', { desc = "Paste without overwriting clipboard" })
      -- vim.keymap.set({ "n", "v" }, "P", '"_P', { desc = "Paste before without overwriting clipboard" })
    end,
  },
}