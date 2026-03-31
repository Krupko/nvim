return {
  -- =============================================
  -- LSP С VS CODE ПОДСКАЗКАМИ
  -- =============================================
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        cssls = {
          settings = {
            css = {
              validate = true,
              lint = {
                unknownAtRules = "ignore",
              },
              hover = {
                documentation = true,
              },
              completion = {
                triggerPropertyValueCompletion = true,
                completePropertyWithSemicolon = true,
              },
            },
            scss = {
              validate = true,
              lint = {
                unknownAtRules = "ignore",
              },
            },
          },
        },
      },
    },
  },

  -- =============================================
  -- ПОДСКАЗКИ КАК В VS CODE
  -- =============================================
  -- {
  --   "hrsh7th/nvim-cmp",
  --   opts = function(_, opts)
  --     local cmp = require("cmp")

  --     opts.formatting = {
  --       format = require("lspkind").cmp_format({
  --         mode = "symbol_text",
  --         maxwidth = 50,
  --         ellipsis_char = "...",
  --         symbol_map = {
  --           Color = "🎨",
  --           Property = "⚙️",
  --           Value = "📏",
  --           Unit = "📐",
  --           Keyword = "🔑",
  --           Variable = "📦",
  --           Function = "ƒ",
  --           Reference = "🔗",
  --         },
  --       }),
  --     }

  --     return opts
  --   end,
  -- },

  -- =============================================
  -- VS CODE СТИЛЬ ДЛЯ TELESCOPE
  -- =============================================
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        layout_config = {
          prompt_position = "top",
        },
        sorting_strategy = "ascending",
        mappings = {
          i = {
            ["<C-j>"] = "move_selection_next",
            ["<C-k>"] = "move_selection_previous",
          },
        },
      },
      pickers = {
        find_files = {
          theme = "dropdown",
          previewer = false,
        },
        live_grep = {
          theme = "dropdown",
        },
      },
    },
  },
}
