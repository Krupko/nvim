return {
  {
    "saghen/blink.cmp",
    opts = {
      keymap = {
        -- Используем "default", чтобы не смешивать со встроенной логикой "super-tab"
        preset = "default",

        -- Подтверждение выбора с явным fallback
        ["<CR>"] = { "fallback" }, -- Enter всегда = новая строка
        ["<Tab>"] = { "accept", "select_next", "snippet_forward", "fallback" },
        ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },

        -- Навигация по списку
        ["<C-j>"] = { "select_next", "fallback" },
        ["<C-k>"] = { "select_prev", "fallback" },

        -- Управление окном автодополнения
        ["<C-w>"] = { "show", "fallback" },
        ["<C-e>"] = { "hide", "fallback" },
      },
      completion = {
        menu = {
          auto_show = true,
        },
      },
    },

    config = function(_, opts)
      require("blink.cmp").setup(opts)

      -- ============================================================
      -- ФИКС: Сброс "залипшего" состояния после закрытия picker'а
      -- ============================================================
      vim.api.nvim_create_autocmd({ "BufEnter", "WinEnter" }, {
        callback = function()
          local ft = vim.bo.filetype
          local buftype = vim.bo.buftype

          -- Пропускаем окна самого picker'а
          if buftype ~= "" then
            return
          end
          if ft == "TelescopePrompt" or ft == "TelescopeResults" then
            return
          end
          if ft:match("^snacks_picker") then
            return
          end

          -- Очищаем очередь клавиш (удаляем "залипший" Enter от picker'а)
          -- и сбрасываем состояние blink.cmp
          vim.defer_fn(function()
            -- Очищаем очередь клавиш
            vim.api.nvim_feedkeys("", "n", true)

            -- Сбрасываем состояние blink.cmp
            local blink = require("blink.cmp")
            pcall(blink.hide)
            pcall(blink.cancel)
          end, 50)
        end,
      })
    end,
  },
}
