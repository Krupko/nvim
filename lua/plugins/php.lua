-- ~/.config/nvim/lua/plugins/php.lua
return {
  -- Настройка PHP LSP
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        intelephense = {
          cmd = { "intelephense", "--stdio" },
          filetypes = { "php", "phtml" },
          root_dir = function(fname)
            local root_markers = {
              "composer.json",
              ".git",
              "phpunit.xml",
              "phpunit.xml.dist",
            }
            return require("lspconfig").util.root_pattern(unpack(root_markers))(fname)
          end,
          settings = {
            intelephense = {
              files = {
                maxSize = 5000000,
                associations = { "*.php", "*.phtml" },
              },
              stubs = {
                "apache",
                "bcmath",
                "bz2",
                "calendar",
                "com_dotnet",
                "Core",
                "ctype",
                "curl",
                "date",
                "dba",
                "dom",
                "enchant",
                "exif",
                "FFI",
                "fileinfo",
                "filter",
                "fpm",
                "ftp",
                "gd",
                "gettext",
                "gmp",
                "hash",
                "iconv",
                "imap",
                "intl",
                "json",
                "ldap",
                "libxml",
                "mbstring",
                "meta",
                "mysqli",
                "oci8",
                "odbc",
                "openssl",
                "pcntl",
                "pcre",
                "PDO",
                "pdo_ibm",
                "pdo_mysql",
                "pdo_pgsql",
                "pdo_sqlite",
                "pgsql",
                "phar",
                "posix",
                "pspell",
                "readline",
                "session",
                "simplexml",
                "snmp",
                "soap",
                "sockets",
                "sodium",
                "SPL",
                "sqlite3",
                "standard",
                "superglobals",
                "sysvmsg",
                "sysvsem",
                "sysvshm",
                "tidy",
                "tokenizer",
                "xml",
                "xmlreader",
                "xmlrpc",
                "xmlwriter",
                "xsl",
                "Zend OPcache",
                "zip",
                "zlib",
                -- Фреймворки
                "wordpress",
                "laravel",
                "symfony",
                "yii",
                "codeigniter",
              },
            },
          },
          on_attach = function(client, bufnr)
            local opts = { buffer = bufnr, noremap = true, silent = true }
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
            vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
            vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
          end,
        },
      },
    },
  },

  -- Форматирование для PHP
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        php = { "php_cs_fixer", "phpcbf" },
      },
      formatters = {
        php_cs_fixer = {
          command = "php-cs-fixer",
          args = { "fix", "--rules=@PSR12,@PhpCsFixer", "$FILENAME" },
          stdin = false,
        },
        phpcbf = {
          command = "phpcbf",
          args = { "--standard=PSR12", "$FILENAME" },
          stdin = false,
        },
      },
    },
  },

  -- Линтинг для PHP
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        php = { "phpstan", "psalm" },
      },
      linters = {
        phpstan = {
          cmd = "phpstan",
          args = { "analyse", "--error-format=raw", "$FILENAME" },
          stdin = false,
        },
        psalm = {
          cmd = "psalm",
          args = { "--output-format=json", "$FILENAME" },
          stdin = false,
          parser = function(output)
            local results = vim.fn.json_decode(output)
            if not results then
              return {}
            end
            local diagnostics = {}
            for _, error in ipairs(results) do
              table.insert(diagnostics, {
                lnum = error.line_from - 1,
                col = error.column_from or 1,
                end_col = error.column_to,
                message = error.message,
                severity = vim.diagnostic.severity.ERROR,
                source = "psalm",
              })
            end
            return diagnostics
          end,
        },
      },
    },
  },
}
