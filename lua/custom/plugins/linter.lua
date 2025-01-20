return {
  'mfussenegger/nvim-lint',
  event = { 'BufEnter' },
  lazy = false,
  keys = {
    { '<leader>fl', "<cmd>lua require('lint').try_lint()<cr>", desc = 'Lint file' },
  },
  config = function()
    local opts = {
      linters_by_ft = {
        vue = { 'eslint_d' },
        typescript = { 'eslint_d' },
        php = { 'phpcs' },
      },
    }
    require('lint').linters_by_ft = opts.linters_by_ft
  end,
}
