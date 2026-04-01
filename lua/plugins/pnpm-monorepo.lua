-- ~/.config/nvim/lua/plugins/pnpm-monorepo.lua
-- LSP для монорепы

return {
  -- LSP для монорепы
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        tsserver = {
          cmd = { "typescript-language-server", "--stdio" },
          filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "typescript.tsx" },
          root_dir = function(fname)
            local root_markers = { "pnpm-workspace.yaml", "package.json", ".git" }
            return require("lspconfig").util.root_pattern(unpack(root_markers))(fname)
          end,
          settings = {
            typescript = {
              inlayHints = {
                includeInlayParameterNameHints = "all",
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = true,
              },
            },
            javascript = {
              inlayHints = {
                includeInlayParameterNameHints = "all",
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = true,
              },
            },
          },
          -- on_attach для keymaps
          on_attach = function(client, bufnr)
            local opts = { buffer = bufnr, noremap = true, silent = true }

            -- TypeScript специфичные keymaps
            vim.keymap.set(
              "n",
              "<leader>co",
              "<cmd>TypescriptOrganizeImports<CR>",
              { buffer = bufnr, desc = "Organize Imports" }
            )
            vim.keymap.set("n", "<leader>cR", "<cmd>TypescriptRenameFile<CR>", { buffer = bufnr, desc = "Rename File" })
            vim.keymap.set(
              "n",
              "<leader>cu",
              "<cmd>TypescriptRemoveUnused<CR>",
              { buffer = bufnr, desc = "Remove Unused" }
            )
          end,
        },

        eslint = {
          cmd = { "eslint_d", "--stdio" },
          filetypes = {
            "javascript",
            "javascriptreact",
            "typescript",
            "typescriptreact",
            "typescript.tsx",
          },
          root_dir = function(fname)
            local root_markers = { "pnpm-workspace.yaml", "package.json", ".eslintrc*", "eslint.config.*", ".git" }
            return require("lspconfig").util.root_pattern(unpack(root_markers))(fname)
          end,
          settings = {
            validate = "on",
            format = true,
            run = "onSave",
            workingDirectory = {
              mode = "auto",
            },
          },
          on_attach = function(client, _bufnr)
            client.server_capabilities.diagnosticProvider = false
          end,
        },

        tailwindcss = {
          filetypes = {
            "html",
            "javascript",
            "javascriptreact",
            "typescript",
            "typescriptreact",
            "css",
            "scss",
          },
          root_dir = function(fname)
            local root_markers = { "tailwind.config.js", "tailwind.config.ts", "package.json", ".git" }
            return require("lspconfig").util.root_pattern(unpack(root_markers))(fname)
          end,
        },

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
    },
  },

  -- Telescope для монорепы
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        vimgrep_arguments = {
          "rg",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
          "--hidden",
          "--glob=!**/.git/*",
          "--glob=!**/node_modules/*",
          "--glob=!**/dist/*",
          "--glob=!**/build/*",
          "--glob=!**/.next/*",
        },
        file_ignore_patterns = {
          "node_modules/",
          ".git/",
          "dist/",
          "build/",
          ".next/",
          "coverage/",
          "pnpm-lock.yaml",
        },
      },
    },
  },
}

