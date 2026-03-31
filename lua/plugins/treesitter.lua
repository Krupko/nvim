return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" }, -- Загружается при открытии файла
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
    },
    config = function()
      -- Важно: проверяем, что плагин загружен
      local ok, treesitter = pcall(require, "nvim-treesitter.configs")
      if not ok then
        -- vim.notify("Treesitter not ready yet", vim.log.levels.WARN)
        return
      end
      
      treesitter.setup({
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
        sync_install = true,
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

      vim.notify("Treesitter configured successfully", vim.log.levels.INFO)
    end,
  },
}
