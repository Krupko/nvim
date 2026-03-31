return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
  config = function()
    require("nvim-treesitter.configs").setup({
      -- Убедитесь, что парсеры установлены синхронно перед LSP
      ensure_installed = {
        "lua",
        "typescript",
        "javascript",
        "json",
        "html",
        "css",
        "markdown",
        "yaml",
      },
      sync_install = true, -- Важно для LSP
      auto_install = true,

      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },

      indent = {
        enable = true,
      },

      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",
          },
        },
      },
    })

    -- Логирование успешной загрузки
    vim.notify("Treesitter configured successfully", vim.log.levels.INFO)
  end,
}
