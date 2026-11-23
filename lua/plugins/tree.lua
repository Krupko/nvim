return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    keys = {
      { "<leader>e", "<cmd>Neotree float toggle<cr>", desc = "Explorer" },
      { "<leader>z", "<cmd>Neotree left toggle<cr>", desc = "Explorer" },
      { "<leader>x", "<cmd>Neotree right toggle<cr>", desc = "Explorer" },
    },

    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons", -- optional, but recommended
      "s1n7ax/nvim-window-picker",
    },
    lazy = false, -- neo-tree will lazily load itself
    opts = {
      filesystem = {
        -- Автообновление дерева при внешних изменениях файловой системы
        -- (например, удаление файла через графический файловый менеджер)
        use_libuv_file_watcher = true,
        -- Команда удаления файлов через корзину (trash-cli)
        commands = {
          delete = function(state)
            local node = state.tree:get_node()
            local path = node:get_id()

            -- Пробуем разные варианты команды trash в порядке приоритета
            if vim.fn.executable("trash-put") == 1 then
              vim.fn.system({ "trash-put", path })
            elseif vim.fn.executable("trash") == 1 then
              vim.fn.system({ "trash", path })
            elseif vim.fn.executable("gio") == 1 then
              vim.fn.system({ "gio", "trash", path })
            else
              -- Fallback: безвозвратное удаление, если ничего не доступно
              vim.fn.delete(path, "rf")
            end

            -- Принудительно обновляем дерево после удаления
            -- Это решает проблему "дублирования" — файл сразу исчезает из Neo-tree
            require("neo-tree.sources.manager").refresh(state.name)
          end,
        },

        -- Настройки отображения скрытых файлов и папок
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
          hide_gitignored = false,
          hide_by_name = {
            ".git",
            ".DS_Store",
          },
          always_show = {
            ".husky",
            ".vscode",
            ".idea",
            ".env",
            ".gitignore",
          },
        },
      },

      -- Маппинги клавиш внутри Neo-tree
      window = {
        mappings = {
          -- Обе клавиши (маленькая и большая D) удаляют файл в корзину
          ["d"] = "delete",
          ["D"] = "delete",
        },
      },
    },
  },
}
