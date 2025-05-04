return {
  'nvim-telescope/telescope.nvim',
  lazy = false,
  keys = {
    { '<leader>f?', '<cmd>Telescope oldfiles<cr>', desc = 'Telescope: Find recently opened files', mode = 'n' },
    { '<leader>fb', '<cmd>Telescope buffers<cr>', desc = 'Telescope: Find existing buffers' },
    { '<leader>ff', '<cmd>Telescope find_files<cr>', desc = 'Telescope: Find git files' },
    { '<leader>fs', '<cmd>Telescope live_grep<cr>', desc = 'Telescope: Search by grep' },
    { '<leader>fd', '<cmd>Telescope diagnostics<cr>', desc = 'Telescope: Search dagnostics' },
    { '<leader>fd', '<cmd>Telescope lsp_document_symbols<cr>', desc = 'Telescope: Search symbols' },
    { '<leader>fgf', '<cmd>Telescope git_files<cr>', desc = 'Telescope: Search all files' },
    { '<leader>fgs', '<cmd>Telescope git_status<cr>', desc = 'Telescope: Find git status' },
    { '<leader>fgc', '<cmd>Telescope git_commits<cr>', desc = 'Telescope: Find git commits' },
    { '<leader>fgb', '<cmd>Telescope git_branches<cr>', desc = 'Telescope: Find git branches' },
    { '<leader>fh', '<cmd>Telescope help_tags<cr>', desc = 'Telescope: Search into nvim help' },
    {
      '<leader>f/',
      function()
        -- You can pass additional configuration to telescope to change theme, layout, etc.
        require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
          winblend = 10,
          previewer = false,
        })
      end,
      desc = 'Telescope: Fuzzily search in current buffer',
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
