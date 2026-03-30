return {
  -- 1. Фикс Treesitter runtimepath
  {
    "nvim-treesitter/nvim-treesitter",
    config = function(_, opts)
      -- Добавляем директорию с парсерами в runtimepath
      local parser_dir = vim.fn.stdpath("data") .. "/site"
      if not vim.tbl_contains(vim.opt.rtp:get(), parser_dir) then
        vim.opt.rtp:prepend(parser_dir)
      end

      require("nvim-treesitter.configs").setup(opts)
    end,
  },

  -- 2. Настройка snacks (отключаем проблемные модули)
  {
    "folke/snacks.nvim",
    opts = {
      image = {
        enabled = false, -- Отключаем если не в Kitty
        -- Или если хотите оставить:
        -- enabled = true,
        latex = false,
        mermaid = false,
      },
      notifier = {
        enabled = false, -- Отключаем проблемный модуль
      },
      picker = {
        enabled = true, -- Оставляем
      },
      dashboard = {
        enabled = false, -- Если не используете
      },
    },
  },

  -- 3. Настройка LSP для монорепы
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        tsserver = {
          root_dir = function(fname)
            return require("lspconfig").util.root_pattern("pnpm-workspace.yaml", ".git", "package.json")(fname)
          end,
        },
        eslint = {
          root_dir = function(fname)
            return require("lspconfig").util.root_pattern("pnpm-workspace.yaml", ".git", "eslint.config.js")(fname)
          end,
          settings = {
            run = "onSave",
            workingDirectory = { mode = "location" },
          },
        },
      },
    },
  },
}
