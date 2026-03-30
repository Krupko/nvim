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
  },
}
