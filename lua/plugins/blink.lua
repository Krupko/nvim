return {
  {
    "saghen/blink.cmp",
    opts = {
        keymap = {
         preset = "super-tab", -- <-- Меняем пресет на "супер-таб"

        -- Навигация по списку
        ["<C-j>"] = { "select_next", "fallback" },      -- Ctrl+j → вниз
        ["<C-k>"] = { "select_prev", "fallback" },      -- Ctrl+k → вверх

        -- Дополнительно
        ["<C-w>"] = { "show", "fallback" },         -- Показать автодополнение
        ["<C-e>"] = { "hide", "fallback" },             -- Скрыть автодополнение
      },
    },
  },
}
