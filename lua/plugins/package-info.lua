return {
  {
    "vuki656/package-info.nvim",
    ft = { "json" }, -- загружать только для package.json
    config = function()
      require("package-info").setup({
        autostart = true,
        icons = {
          up_to_date = "✓",
          outdated = "⟳",
          updating = "…",
          error = "✗",
        },
      })
    end,
  },
}
