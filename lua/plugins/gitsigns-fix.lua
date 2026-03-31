return {
  {
    "lewis6991/gitsigns.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      -- Настройки знаков из первого файла
      signs = {
        add = { text = "│" },
        change = { text = "│" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
      },
      -- Функция прикрепления к буферу
      on_attach = function(bufnr)
        local gs = require("gitsigns")

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Навигация по изменениям
        map("n", "]c", function()
          if vim.wo.diff then
            return "]c"
          end
          vim.schedule(gs.next_hunk)
          return "<Ignore>"
        end, { expr = true })

        map("n", "[c", function()
          if vim.wo.diff then
            return "[c"
          end
          vim.schedule(gs.prev_hunk)
          return "<Ignore>"
        end, { expr = true })

        -- Действия с изменениями
        map("n", "<leader>hs", gs.stage_hunk)
        map("n", "<leader>hr", gs.reset_hunk)
        map("n", "<leader>hS", gs.stage_buffer)
        map("n", "<leader>hR", gs.reset_buffer)
        map("n", "<leader>hp", gs.preview_hunk)
        map("n", "<leader>hb", gs.blame_line)
      end,
    },
    config = function(_, opts)
      require("gitsigns").setup(opts)
      vim.notify("gitsigns.nvim configured", vim.log.levels.INFO)
    end,
  },
}
