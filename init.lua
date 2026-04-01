-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("config.vscode-css")
require("config.pnpm")

vim.filetype.add({
  extension = {
    jsx = "javascriptreact",
    tsx = "typescriptreact",
  },
})
