return {
  "akinsho/toggleterm.nvim",
  version = "*",
  keys = {
    { "<leader>tt", "<cmd>ToggleTerm direction=float<cr>", desc = "Terminal (Float)" },
    { "<leader>hh", "<cmd>ToggleTerm direction=horizontal<cr>", desc = "Terminal (Horizontal)" },
  },
  opts = {
    size = 10,
    open_mapping = [[<c-\>]],
    shading_factor = 2,
    direction = "float",
    float_opts = {
      border = "curved",
      highlights = { border = "Normal", background = "Normal" },
    },
  },
}
