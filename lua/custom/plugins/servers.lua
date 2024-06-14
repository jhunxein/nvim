return {
  {
    'neovim/nvim-lspconfig',
    opts = {
      servers = {
        tsserver = {
          -- disable = true,
          format = {
            enable = false,
          },
        },
        volar = {
          format = {
            enable = true,
          },
        },
        -- eslint = {
        --   enable = false,
        --   format = {
        --     enable = false
        --   }
        -- },
        -- phpactor = {},
        intelephense = {
          diagnostics = {
            enable = true,
          },
          format = {
            enable = true,
          },
        },
        tailwindcss = {},
        lua_ls = {
          Lua = {
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
          },
        },
        gopls = {},
      },
    },
    settings = {
      gopls = {
        analyses = {
          unusedparams = true,
        },
        staticcheck = true,
        gofumpt = true,
      },
    },
  },

  {
    'williamboman/mason.nvim',
    cmd = 'Mason',
    build = ':MasonUpdate',
    opts = {
      ensure_installed = {
        'stylua',
        'shfmt',
        'typescript-language-server',
        'vue-language-server',
        'prettierd',
        'tailwindcss-language-server',
        'phpactor',
        'intelephense',
        'php-cs-fixer',
        'lua-language-server',
        'eslint_d',
        'gopls',
        'dockerfile-language-server',
      },
    },
  },
}
