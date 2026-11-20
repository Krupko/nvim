return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
    },
    init = function()
      -- Загружаем расширение fzf-native после старта, не вмешиваясь в setup LazyVim
      vim.api.nvim_create_autocmd("User", {
        pattern = "VeryLazy",
        callback = function()
          pcall(require("telescope").load_extension, "fzf")
        end,
      })
    end,
    opts = {
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
        },
      },
    },
  },
}
