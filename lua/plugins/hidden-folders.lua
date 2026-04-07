return {
  -- Настройка neo-tree для показа скрытых папок
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
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
    },
  },

  -- Настройка Telescope для поиска в скрытых папках
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        vimgrep_arguments = {
          "rg",
          "--hidden",
          "--glob=!.git",
          "--glob=!node_modules",
        },
        file_ignore_patterns = {
          "node_modules/",
          ".git/",
        },
      },
      pickers = {
        find_files = {
          hidden = true,
        },
      },
    },
  },
}
