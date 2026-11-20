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
          -- on_attach намеренно не задан: LazyVim уже настраивает gd, K, <leader>rn, <leader>ca.
        },
      },
    },
  },

  -- Форматирование для PHP
  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      opts.formatters_by_ft = opts.formatters_by_ft or {}
      -- phpcbf не установлен в системе, поэтому оставлен только php_cs_fixer.
      opts.formatters_by_ft.php = { "php_cs_fixer" }

      opts.formatters = opts.formatters or {}
      opts.formatters.php_cs_fixer = {
        command = "php-cs-fixer",
        args = { "fix", "--rules=@PSR12,@PhpCsFixer", "$FILENAME" },
        stdin = false,
      }
    end,
  },

  -- Линтинг для PHP
  {
    "mfussenegger/nvim-lint",
    opts = function(_, opts)
      opts.linters_by_ft = vim.tbl_deep_extend("force", opts.linters_by_ft or {}, {
        php = { "phpstan", "psalm" },
      })

      opts.linters = vim.tbl_deep_extend("force", opts.linters or {}, {
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
      })
    end,
  },
}
