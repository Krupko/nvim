return {
  {
    "lewis6991/gitsigns.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("gitsigns").setup({
        signs = {
          add = { text = "│" },
          change = { text = "│" },
          delete = { text = "_" },
          topdelete = { text = "‾" },
          changedelete = { text = "~" },
        },
      })
      vim.notify("gitsigns.nvim configured", vim.log.levels.INFO)
    end,
  },
}