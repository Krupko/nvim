return {
  {
    "mg979/vim-visual-multi",
    lazy = false,
    init = function()
      -- Настройки vim-visual-multi
      -- vim.g.VM_theme = "gruvbox"
      vim.g.VM_maps = {
        ["Find Under"] = "<C-d>",
        ["Find Subword Under"] = "<C-d>",
        ["Add Cursor Down"] = "<C-S-down>",
        ["Add Cursor Up"] = "<C-S-up>",
        ["Select All"] = "<C-b>",
        ["Start Regex Search"] = "//",
        ["Visual All"] = "<C-m>",
        ["Visual Add"] = "<C-d>",
        ["Visual Find"] = "<C-f>",
        ["Visual Cursors"] = "<C-n>",
      }
      vim.g.VM_highlight_matches = "vim"
      vim.g.VM_case_setting = "smartcase"
      vim.g.VM_leader = "\\"
    end,
    config = function()
      -- Отключаем стандартное поведение Ctrl-A в LazyVim
      -- vim.keymap.del("n", "<C-a>")

      -- Добавляем свои маппинги
      vim.keymap.set("n", "<leader>mm", "<Plug>(VM-Select-All)", { desc = "Select all matches" })
      vim.keymap.set("n", "<leader>mn", "<Plug>(VM-Find-Under)", { desc = "Add cursor next" })
    end,
  },
}
