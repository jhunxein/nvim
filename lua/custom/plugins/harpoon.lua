return {
  'ThePrimeagen/harpoon',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  config = function()
    vim.keymap.set('n', '<leader>nm', require('harpoon.mark').add_file, { desc = 'Mark file to harpoon' })
    vim.keymap.set('n', '<leader>nu', require('harpoon.ui').toggle_quick_menu, { desc = 'Open harpoon ui' })
    vim.keymap.set('n', '<M-h>', require('harpoon.ui').nav_next, { desc = 'Next mark' })
    vim.keymap.set('n', '<M-l>', require('harpoon.ui').nav_prev, { desc = 'Previous mark' })
  end,
}
