return {
  -- Adds git related signs to the gutter, as well as utilities for managing changes
  'lewis6991/gitsigns.nvim',
  opts = {
    -- See `:help gitsigns.txt`
    signs = {
      add = { text = '+' },
      untracked = { text = '┆' },
      change = { text = '~' },
      delete = { text = '_' },
      topdelete = { text = '‾' },
      changedelete = { text = '~' },
    },
    auto_attach = true,
    on_attach = function(bufnr)
      -- don't override the built-in and fugitive keymaps
      local gs = package.loaded.gitsigns

      vim.keymap.set('n', '<leader>hp', require('gitsigns').preview_hunk, { buffer = bufnr, desc = 'Preview git hunk' })
      vim.keymap.set('n', '<leader>hs', gs.stage_hunk, { desc = 'Git stage' })
      vim.keymap.set('n', '<leader>hS', gs.stage_buffer, { desc = 'Git stage buffer ' })
      vim.keymap.set('v', '<leader>hs', function()
        gs.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
      end, { desc = 'Git stage' })

      vim.keymap.set('n', '<leader>hr', gs.reset_hunk, { desc = 'Git reset' })
      vim.keymap.set('v', '<leader>hr', function()
        gs.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
      end, { desc = 'Git reset' })
      vim.keymap.set('n', '<leader>hR', gs.reset_buffer, { desc = 'Git reset buffer' })

      vim.keymap.set('n', '<leader>hu', gs.undo_stage_hunk, { desc = 'Git undo' })
      vim.keymap.set('n', '<leader>hd', gs.diffthis, { desc = 'Git diff' })
      vim.keymap.set('n', '<leader>hD', function()
        gs.diffthis '~'
      end, { desc = 'Git diff' })

      vim.keymap.set({ 'n', 'v' }, ']c', function()
        if vim.wo.diff then
          return ']c'
        end
        vim.schedule(function()
          gs.next_hunk()
        end)
        return '<Ignore>'
      end, { expr = true, buffer = bufnr, desc = 'Jump to next hunk' })
      vim.keymap.set({ 'n', 'v' }, '[c', function()
        if vim.wo.diff then
          return '[c'
        end
        vim.schedule(function()
          gs.prev_hunk()
        end)
        return '<Ignore>'
      end, { expr = true, buffer = bufnr, desc = 'Jump to previous hunk' })
    end,
  },
}
