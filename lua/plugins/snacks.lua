---- ~/.config/nvim/lua/plugins/snacks.lua
return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      dashboard = { enabled = false },
      explorer = { enabled = false },
      input = { enabled = false },
      picker = { enabled = true },
      -- ✅ ВКЛЮЧАЕМ: красивые уведомления
      notifier = {
        enabled = true,
        history = 50,
      },
      quickfile = { enabled = false },
      scope = { enabled = false },
      -- ✅ ВКЛЮЧАЕМ: плавная прокрутка
      scroll = { enabled = true },
      statuscolumn = { enabled = true },
      words = { enabled = false },
    },
  },
}
