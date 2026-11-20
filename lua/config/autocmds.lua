---- ~/.config/nvim/lua/config/autocmds.lua
-- Автокоманды для React/Node.js разработки

-- Автоформатирование при сохранении отключено намеренно:
-- им управляет format_on_save в lua/plugins/prettier.lua

-- Автоустановка filetype для JSX/TSX
vim.api.nvim_create_autocmd("BufReadPost", {
  pattern = { "*.jsx", "*.tsx" },
  callback = function()
    if vim.bo.filetype == "javascript" then
      vim.bo.filetype = "javascriptreact"
    elseif vim.bo.filetype == "typescript" then
      vim.bo.filetype = "typescriptreact"
    end
  end,
  group = vim.api.nvim_create_augroup("ReactFiletype", { clear = true }),
})

-- Восстановление позиции курсора
vim.api.nvim_create_autocmd("BufReadPost", {
  pattern = "*",
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})
