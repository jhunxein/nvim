return {
  'nvim-telescope/telescope.nvim',
  lazy = false,
  keys = {
    { '<leader>?', '<cmd>Telescope oldfiles<cr>', desc = 'Find recently opened files', mode = 'n' },
    { '<leader>fb', '<cmd>Telescope buffers<cr>', desc = 'Find existing buffers' },
    { '<leader>ff', '<cmd>Telescope find_files<cr>', desc = 'Find git files' },
    { '<leader>fs', '<cmd>Telescope live_grep<cr>', desc = 'Search by grep' },
    { '<leader>fd', '<cmd>Telescope diagnostics<cr>', desc = 'Search dagnostics' },

    { '<leader>fgf', '<cmd>Telescope git_files<cr>', desc = 'Search all files' },
    { '<leader>fgs', '<cmd>Telescope git_status<cr>', desc = 'Find git status' },
    { '<leader>fgc', '<cmd>Telescope git_commits<cr>', desc = 'Find git commits' },
    { '<leader>fgb', '<cmd>Telescope git_branches<cr>', desc = 'Find git branches' },

    { '<leader>fh', '<cmd>Telescope help_tags<cr>', desc = 'Search into nvim help' },

    {
      '<leader>/',
      function()
        -- You can pass additional configuration to telescope to change theme, layout, etc.
        require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
          winblend = 10,
          previewer = false,
        })
      end,
      desc = 'Fuzzily search in current buffer',
    },
  },
  config = function()
    -- [[ Configure Telescope ]]
    -- See `:help telescope` and `:help telescope.setup()`
    require('telescope').setup {
      defaults = {
        mappings = {
          i = {
            ['<C-u>'] = false,
            ['<C-d>'] = false,
          },
        },
      },
    }

    -- Enable telescope fzf native, if installed
    pcall(require('telescope').load_extension, 'fzf')
  end,
}
