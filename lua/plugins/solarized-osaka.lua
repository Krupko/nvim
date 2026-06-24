return {
  {
    "craftzdog/solarized-osaka.nvim",
    lazy = false, -- Тема должна загружаться сразу
    priority = 1000, -- Высокий приоритет для корректной загрузки интерфейса
    opts = {
      transparent = true, -- Твой любимый прозрачный фон
      terminal_colors = true, -- Поддержка цветов терминала[cite: 42]
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
    config = function(_, opts)
      require("solarized-osaka").setup(opts)
      vim.cmd.colorscheme("solarized-osaka") -- Установка активной темы
    end,
  },
}
