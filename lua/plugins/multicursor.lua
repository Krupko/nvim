return {
  {
    "mg979/vim-visual-multi",
    lazy = false,
    init = function()
      -- Настройки vim-visual-multi
      vim.g.VM_maps = {
        -- <C-d> больше не используется: он конфликтует с прокруткой в LazyVim.
        -- Вместо него триггер вынесен на <leader>mc (см. ниже).
        ["Find Under"] = "<leader>mc",
        ["Find Subword Under"] = "<leader>mc",
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
      -- Дополнительные маппинги
      vim.keymap.set("n", "<leader>mm", "<Plug>(VM-Select-All)", { desc = "Select all matches" })
      vim.keymap.set("n", "<leader>mn", "<Plug>(VM-Find-Under)", { desc = "Add cursor next" })
    end,
  },
}
