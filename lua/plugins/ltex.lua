-- ~/.config/nvim/lua/plugins/ltex.lua
return {
  -- Плагин для улучшенной интеграции ltex_extra (добавление слов в словарь)
  { "barreiroleo/ltex-extra.nvim" },

  -- Настраиваем lspconfig для ltex
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ltex = {
          -- Файлы, где будет работать проверка
          filetypes = { "markdown", "tex", "text", "gitcommit", "rst", "pandoc", "norg" },
          settings = {
            ltex = {
              -- Указываем языки для проверки: основной английский, дополнительный русский
              language = "en-US",
              additionalRules = {
                enablePickyRules = true,
                motherTongue = "ru",
              },
              -- Отключаем правила, которые могут мешать (опционально)
              disabledRules = {
                ["en-US"] = { "EN_QUOTES", "WHITESPACE_RULE" },
                ["ru"] = { "RUSSIAN_QUOTES", "RUSSIAN_WHITESPACE" },
              },
            },
          },
        },
      },
      -- Настройка ltex_extra для возможности добавлять слова в словарь
      setup = {
        ltex = function(_, opts)
          vim.api.nvim_create_autocmd("LspAttach", {
            callback = function(args)
              local client = vim.lsp.get_client_by_id(args.data.client_id)
              if client and client.name == "ltex" then
                require("ltex_extra").setup({
                  load_langs = { "en-US", "ru" }, -- Языки для загрузки словарей
                  init_check = true,
                  path = vim.fn.stdpath("config") .. "/spell", -- Путь для хранения словарей
                  log_level = "none",
                })
              end
            end,
          })
        end,
      },
    },
  },
}
