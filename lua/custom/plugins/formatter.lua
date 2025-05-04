return {
  'mhartington/formatter.nvim',
  keys = {
    { '<leader>fp', '<cmd>Format<cr>', desc = 'Formatter: Format file' },
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

      python = {
        require('formatter.filetypes.python').ruff,
      },

      sh = {
        require('formatter.filetypes.sh').shfmt,
      },

      c = {
        require('formatter.filetypes.c').clangformat,
      },

      dockerfile = {
        require 'formatter.defaults.prettierd',
      },

      sql = {
        require('formatter.filetypes.sql').pgformat,
      },

      vue = {
        require 'formatter.defaults.prettierd',
      },

      css = {
        require 'formatter.defaults.prettierd',
      },

      html = {
        require 'formatter.defaults.prettierd',
      },

      svelte = {
        require 'formatter.defaults.prettierd',
      },

      php = {
        require 'formatter.defaults.phpcbf',
      },

      typescript = {
        require 'formatter.defaults.prettierd',
      },

      typescriptreact = {
        require 'formatter.defaults.prettierd',
      },

      javascript = {
        require 'formatter.defaults.prettierd',
      },

      json = {
        require 'formatter.defaults.prettierd',
      },

      go = {
        require('formatter.filetypes.go').gofmt,
      },

      markdown = {
        require 'formatter.defaults.prettierd',
      },
    }

    return opts
  end,
}
