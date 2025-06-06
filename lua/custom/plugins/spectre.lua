return {
  'nvim-pack/nvim-spectre',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  opts = {
    { open_cmd = 'noswapfile vnew' },
  },
  keys = {
    { '<leader>sr', '<cmd>lua require("spectre").open()<CR>', desc = 'Replace: string in text files' },
  },
}
