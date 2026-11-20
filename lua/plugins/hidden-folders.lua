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
    opts = function(_, opts)
      opts.defaults = opts.defaults or {}
      opts.defaults.vimgrep_arguments = opts.defaults.vimgrep_arguments
        or { "rg", "--color=never", "--no-heading", "--with-filename", "--line-number", "--column", "--smart-case" }

      -- Дополняем, а не заменяем стандартные аргументы
      table.insert(opts.defaults.vimgrep_arguments, "--hidden")
      table.insert(opts.defaults.vimgrep_arguments, "--glob=!.git")
      table.insert(opts.defaults.vimgrep_arguments, "--glob=!node_modules")

      opts.defaults.file_ignore_patterns = opts.defaults.file_ignore_patterns or {}
      table.insert(opts.defaults.file_ignore_patterns, "node_modules/")
      table.insert(opts.defaults.file_ignore_patterns, ".git/")

      opts.pickers = opts.pickers or {}
      opts.pickers.find_files = vim.tbl_deep_extend("force", opts.pickers.find_files or {}, {
        hidden = true,
      })
    end,
  },
}
