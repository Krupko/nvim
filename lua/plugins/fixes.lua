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
}
