-- since this is just an example spec, don't actually load anything here and return an empty spec
-- stylua: ignore
if true then return {} end

-- every spec file under the "plugins" directory will be loaded automatically by lazy.nvim
--
-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins
return {
  -- add gruvbox
  { "ellisonleao/gruvbox.nvim" },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  },

  -- change trouble config
  {
    "folke/trouble.nvim",
    -- opts will be merged with the parent spec
    opts = { use_diagnostic_signs = true },
  },

  -- disable trouble
  { "folke/trouble.nvim", enabled = false },

  -- override nvim-cmp and add cmp-emoji
  {
    "hrsh7th/nvim-cmp",
    dependencies = { "hrsh7th/cmp-emoji" },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      table.insert(opts.sources, { name = "emoji" })
    end,
  },

  -- change some telescope options and a keymap to browse plugin files
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      -- add a keymap to browse plugin files
      -- stylua: ignore
      {
        "<leader>fp",
        function() require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root }) end,
        desc = "Find Plugin File",
      },
    },
    -- change some options
    opts = {
      defaults = {
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        winblend = 0,
      },
    },
  },

  -- ======================
  -- 2. REACT СПЕЦИФИЧНОЕ
  -- ======================
  {
    "windwp/nvim-ts-autotag",
    ft = { "html", "javascript", "javascriptreact", "typescript", "typescriptreact" },
    opts = {},
  },

  -- ======================
  -- 3. LSP КОНФИГУРАЦИЯ (ОБЪЕДИНЯЕМ ВСЕ В ОДНОМ МЕСТЕ)
  -- ======================
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "jose-elias-alvarez/typescript.nvim",
      init = function()
        require("lazyvim.util").lsp.on_attach(function(_, buffer)
          vim.keymap.set("n", "<leader>co", "TypescriptOrganizeImports", { buffer = buffer, desc = "Organize Imports" })
          vim.keymap.set("n", "<leader>cR", "TypescriptRenameFile", { desc = "Rename File", buffer = buffer })
        end)
      end,
    },
    ---@class PluginLspOpts
    opts = {
      servers = {
        -- TypeScript/JavaScript (расширенные настройки)
        tsserver = {
          settings = {
            typescript = {
              inlayHints = {
                includeInlayParameterNameHints = "all",
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = true,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
              },
              format = {
                indentSize = 2,
                convertTabsToSpaces = true,
              },
            },
            javascript = {
              inlayHints = {
                includeInlayParameterNameHints = "all",
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = true,
              },
              format = {
                indentSize = 2,
                convertTabsToSpaces = true,
              },
            },
            completions = {
              completeFunctionCalls = true,
            },
          },
        },

        -- Tailwind CSS (уже было, оставляем)
        tailwindcss = {
          filetypes = {
            "html",
            "javascript",
            "javascriptreact",
            "typescript",
            "typescriptreact",
          },
        },

        -- Emmet для JSX (уже было, оставляем)
        emmet_ls = {
          filetypes = {
            "html",
            "javascriptreact",
            "typescriptreact",
            "jsx",
            "tsx",
            "css",
            "scss",
            "less",
          },
        },
      },
      setup = {
        -- Настройка typescript.nvim
        tsserver = function(_, opts)
          require("typescript").setup({ server = opts })
          return true
        end,
      },
    },
  },

  -- for typescript, LazyVim also includes extra specs to properly setup lspconfig,
  -- treesitter, mason and typescript.nvim. So instead of the above, you can use:
  { import = "lazyvim.plugins.extras.lang.typescript" },

  -- add more treesitter parsers
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- Объединяем с существующими настройками
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, {
        "javascript",
        "typescript",
        "tsx",
        "jsx",
        "html",
        "css",
        "scss",
        "json",
        "yaml",
        "lua",
        "vim",
        "vimdoc",
        "bash",
        "markdown",
        "markdown_inline",
      })

      -- Автозакрывание тегов
      opts.autotag = {
        enable = true,
        filetypes = {
          "html",
          "javascript",
          "javascriptreact",
          "typescript",
          "typescriptreact",
          "jsx",
          "tsx",
        },
      }

      return opts
    end,
  },

  -- the opts function can also be used to change the default opts:
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function(_, opts)
      table.insert(opts.sections.lualine_x, {
        function()
          local ft = vim.bo.filetype
          if ft == "javascriptreact" then
            return "⚛ JSX"
          elseif ft == "typescriptreact" then
            return "⚛ TSX"
          end
          return ""
        end,
      })
      return opts
    end,
  },

  -- use mini.starter instead of alpha
  { import = "lazyvim.plugins.extras.ui.mini-starter" },

  -- add jsonls and schemastore packages, and setup treesitter for json, json5 and jsonc
  { import = "lazyvim.plugins.extras.lang.json" },

  -- ======================
  -- 4. MASON (УСТАНОВКА ИНСТРУМЕНТОВ) - ИСПРАВЛЯЕМ НАЗВАНИЕ ПЛАГИНА
  -- ======================
  {
    "williamboman/mason.nvim", -- Исправлено: mson-org → williamboman
    opts = {
      ensure_installed = {
        -- Node.js/JavaScript инструменты
        "typescript-language-server",
        "eslint-lsp",
        "prettier",
        "prettierd",
        "eslint_d",
        "emmet-ls",
        "tailwindcss-language-server",
        "json-lsp",
      },
    },
  },

  -- ======================
  -- 5. CONFORM (ФОРМАТИРОВАНИЕ) - ДОБАВЛЯЕМ
  -- ======================
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        javascript = { "prettier" },
        javascriptreact = { "prettier" },
        typescript = { "prettier" },
        typescriptreact = { "prettier" },
        json = { "prettier" },
        css = { "prettier" },
        scss = { "prettier" },
        html = { "prettier" },
      },
      formatters = {
        prettier = {
          prepend_args = {
            "--print-width",
            "100",
            "--tab-width",
            "2",
            "--single-quote",
            "true",
            "--jsx-single-quote",
            "true",
            "--trailing-comma",
            "es5",
          },
        },
      },
      format_on_save = {
        timeout_ms = 500,
        lsp_format = "fallback",
      },
    },
  },
}
