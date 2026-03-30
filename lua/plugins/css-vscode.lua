-- =============================================
-- ПОЛНАЯ ПОДСВЕТКА CSS/SCSS КАК В VS CODE
-- =============================================

return {
  -- =============================================
  -- 1. ОСНОВНАЯ ПОДСВЕТКА ЦВЕТОВ
  -- =============================================
  {
    "brenoprata10/nvim-highlight-colors",
    lazy = false,
    priority = 1000,
    version = "*",

    opts = {
      enable_hex = true,
      enable_short_hex = true,
      enable_rgb = true,
      enable_hsl = true,
      enable_var_usage = true,
      enable_named_colors = true,
      enable_tailwind = false,

      render_style = {
        "background",
        "foreground",
      },

      virtualtext = {
        hex = true,
        rgb = false,
        hsl = false,
      },

      background_lightness = 0.85,
      foreground_lightness = 0.15,

      exclude_filetypes = {
        "lua",
        "vim",
        "json",
        "yaml",
        "markdown",
        "text",
      },
      exclude_buftypes = { "terminal", "nofile", "prompt" },
    },

    config = function(_, opts)
      vim.g.highlight_colors_enabled = true
      require("nvim-highlight-colors").setup(opts)
    end,
  },

  -- =============================================
  -- 4. ИКОНКИ
  -- =============================================
  {
    "nvim-tree/nvim-web-devicons",
    lazy = true,
    opts = {
      override = {
        css = { icon = "", color = "#42a5f5", name = "Css" },
        scss = { icon = "", color = "#f06292", name = "Scss" },
        sass = { icon = "", color = "#f06292", name = "Sass" },
        html = { icon = "", color = "#e44d26", name = "Html" },
      },
    },
  },
}
