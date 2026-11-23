return {
  {
    "saghen/blink.cmp",
    opts = {
      keymap = {
        -- Используем "default", чтобы не смешивать со встроенной логикой "super-tab"
        preset = "enter",

        -- Подтверждение выбора
        ["<CR>"] = { "accept", "fallback" },
        ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
        ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },

        -- Навигация по списку
        ["<C-j>"] = { "select_next", "fallback" },
        ["<C-k>"] = { "select_prev", "fallback" },

        -- Управление окном автодополнения
        ["<C-w>"] = { "show", "fallback" },
        ["<C-e>"] = { "hide", "fallback" },
      },
    },
  },
}
