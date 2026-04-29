return {
  "folke/tokyonight.nvim",
  priority = 1000,
  config = function()
    require("tokyonight").setup({
      style = "storm",
      transparent = true, -- прозрачный фон
      terminal_colors = true,
    })
    -- vim.cmd.colorscheme("tokyonight")
  end,
}
