-- =============================================
-- VS CODE CSS ХАЙЛАЙТЫ
-- =============================================

local M = {}

-- Применяем VS Code стиль для CSS
M.setup = function()
  -- Подсветка CSS переменных
  vim.api.nvim_set_hl(0, "cssVariable", { fg = "#9cdcfe", bold = true })
  vim.api.nvim_set_hl(0, "cssVariableValue", { fg = "#ce9178" })

  -- Подсветка свойств
  vim.api.nvim_set_hl(0, "cssProperty", { fg = "#9cdcfe" })
  vim.api.nvim_set_hl(0, "cssPropertyId", { fg = "#9cdcfe", italic = true })

  -- Подсветка значений
  vim.api.nvim_set_hl(0, "cssValue", { fg = "#ce9178" })
  vim.api.nvim_set_hl(0, "cssValueNumber", { fg = "#b5cea8" })
  vim.api.nvim_set_hl(0, "cssValueLength", { fg = "#b5cea8" })
  vim.api.nvim_set_hl(0, "cssValueAngle", { fg = "#b5cea8" })
  vim.api.nvim_set_hl(0, "cssValueTime", { fg = "#b5cea8" })
  vim.api.nvim_set_hl(0, "cssValueFrequency", { fg = "#b5cea8" })

  -- Подсветка функций
  vim.api.nvim_set_hl(0, "cssFunction", { fg = "#dcdcaa" })
  vim.api.nvim_set_hl(0, "cssFunctionName", { fg = "#dcdcaa" })

  -- Подсветка ключевых слов
  vim.api.nvim_set_hl(0, "cssImportant", { fg = "#f44747", bold = true })
  vim.api.nvim_set_hl(0, "cssTagName", { fg = "#569cd6" })
  vim.api.nvim_set_hl(0, "cssClassName", { fg = "#d7ba7d" })
  vim.api.nvim_set_hl(0, "cssClassNameDot", { fg = "#d4d4d4" })
  vim.api.nvim_set_hl(0, "cssPseudoClass", { fg = "#569cd6" })
  vim.api.nvim_set_hl(0, "cssPseudoClassId", { fg = "#569cd6" })
  vim.api.nvim_set_hl(0, "cssPseudoElement", { fg = "#569cd6" })
  vim.api.nvim_set_hl(0, "cssId", { fg = "#d7ba7d" })
  vim.api.nvim_set_hl(0, "cssIdSelector", { fg = "#d7ba7d" })
  vim.api.nvim_set_hl(0, "cssSelectorOp", { fg = "#d4d4d4" })

  -- Подсветка комментариев
  vim.api.nvim_set_hl(0, "cssComment", { fg = "#6a9955", italic = true })

  -- Подсветка медиа-запросов
  vim.api.nvim_set_hl(0, "cssMediaKeyword", { fg = "#569cd6" })
  vim.api.nvim_set_hl(0, "cssMediaType", { fg = "#9cdcfe" })
  vim.api.nvim_set_hl(0, "cssMediaFeature", { fg = "#9cdcfe" })

  -- Подсветка ключевых кадров
  vim.api.nvim_set_hl(0, "cssKeyFrame", { fg = "#569cd6" })
  vim.api.nvim_set_hl(0, "cssKeyFrameSelector", { fg = "#b5cea8" })
end

-- Применяем для CSS/SCSS файлов
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "css", "scss", "sass", "less" },
  callback = function()
    M.setup()
  end,
})

return M
