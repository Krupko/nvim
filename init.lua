-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.api.nvim_create_autocmd("User", {
  pattern = "VeryLazy",
  callback = function()
    require("config.pnpm")
  end,
})

vim.filetype.add({
  extension = {
    jsx = "javascriptreact",
    tsx = "typescriptreact",
  },
})
