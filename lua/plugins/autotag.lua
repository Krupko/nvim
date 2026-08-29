-- ~/.config/nvim/lua/plugins/autotag.lua
return {
  {
    "windwp/nvim-ts-autotag",
    ft = { "html", "javascript", "javascriptreact", "typescript", "typescriptreact", "astro", "vue", "svelte" },
    opts = {
      enable_close = true,
      enable_rename = true,
      enable_close_on_slash = true,
    },
    config = true,
  },
}
