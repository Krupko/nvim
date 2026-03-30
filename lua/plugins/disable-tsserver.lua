-- ~/.config/nvim/lua/plugins/disable-tsserver.lua
return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        tsserver = { enabled = false },
      },
    },
  },
}
