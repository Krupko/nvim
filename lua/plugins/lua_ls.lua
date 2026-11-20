return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        lua_ls = {
          settings = {
            Lua = {
              workspace = {
                -- Увеличиваем лимит памяти для быстрой индексации
                maxPreload = 100000,
                preloadFileSize = 10000,
                -- Исключаем тяжёлые директории из индексации
                ignoreDir = {
                  ".git",
                  ".hg",
                  ".svn",
                  "node_modules",
                  ".cache",
                  ".local/share/nvim/lazy",
                  ".local/share/nvim/mason",
                },
                -- Отключаем сборку библиотеки при каждом запуске
                checkThirdParty = false,
              },
              telemetry = { enable = false },
              -- Ограничиваем диагностику
              diagnostics = {
                globals = { "vim" },
                disable = { "lowercase-global" },
              },
              -- Отключаем тяжёлые проверки
              hint = {
                enable = false,
              },
            },
          },
        },
      },
    },
  },
}
