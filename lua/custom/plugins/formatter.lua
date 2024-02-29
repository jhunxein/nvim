return {
  'mhartington/formatter.nvim',
  keys = {
    { '<leader>fp', "<cmd>Format<cr>", desc = 'Format file' },
  },
  opts = function()
    -- Utilities for creating configurations
    -- local util = require 'formatter.util'

    local opts = {
      filetype = {},
      logging = true,
      log_level = vim.log.levels.DEBUG,
    }

    opts.filetype = {
      -- Formatter configurations for filetype "lua" go here
      -- and will be executed in order
      lua = {
        require('formatter.filetypes.lua').stylua,
      },

      sql = {
        require('formatter.filetypes.sql').pgformat,
      },

      vue = {
        require 'formatter.defaults.prettierd',
      },

      css = {
        require 'formatter.defaults.prettierd'
      },

      php = {
        require 'formatter.defaults.phpcbf',
      },

      typescript = {
        require 'formatter.defaults.prettierd',
      },

      javascript = {
        require 'formatter.defaults.prettierd',
      },

      go = {
        require 'formatter.filetypes.go'.gofmt
      }
    }

    return opts
  end,
}
