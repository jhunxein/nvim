return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  config = function()
    local harpoon = require 'harpoon'

    -- REQUIRED
    harpoon:setup()
    -- REQUIRED

    vim.keymap.set('n', '<leader>nm', function()
      harpoon:list():add()
    end, { desc = 'Add to harpoon' })
    vim.keymap.set('n', '<leader>nu', function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = 'Open harpoon menu' })

    -- vim.keymap.set('n', '<C-h>', function()
    --   harpoon:list():select(1)
    -- end)
    -- vim.keymap.set('n', '<C-t>', function()
    --   harpoon:list():select(2)
    -- end)
    -- vim.keymap.set('n', '<C-n>', function()
    --   harpoon:list():select(3)
    -- end)
    -- vim.keymap.set('n', '<C-s>', function()
    --   harpoon:list():select(4)
    -- end)

    -- Toggle previous & next buffers stored within Harpoon list
    vim.keymap.set('n', '<C-p>', function()
      harpoon:list():prev()
    end)
    vim.keymap.set('n', '<C-n>', function()
      harpoon:list():next()
    end)
    --
    -- vim.keymap.set('n', '<leader>nm', require('harpoon.mark').add_file, { desc = 'Mark file to harpoon' })
    -- vim.keymap.set('n', '<leader>nu', require('harpoon.ui').toggle_quick_menu, { desc = 'Open harpoon ui' })
    -- vim.keymap.set('n', '<M-h>', require('harpoon.ui').nav_next, { desc = 'Next mark' })
    -- vim.keymap.set('n', '<M-l>', require('harpoon.ui').nav_prev, { desc = 'Previous mark' })
  end,
}
