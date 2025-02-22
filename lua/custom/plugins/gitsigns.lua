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
      local nmap = require('core.util').map('n', 'Git: ', bufnr)

      nmap('<leader>gp', require('gitsigns').preview_hunk, 'Preview git hunk')

      nmap('<leader>gs', gs.stage_hunk, 'Stage')
      nmap('<leader>gr', gs.reset_hunk, 'Reset')
      vim.keymap.set('v', '<leader>gs', function()
        gs.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
      end, { desc = 'Git: Stage' })

      vim.keymap.set('v', '<leader>gr', function()
        gs.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
      end, { desc = 'Git: Reset' })

      nmap('<leader>gS', gs.stage_buffer, 'Stage buffer ')
      nmap('<leader>gR', gs.reset_buffer, 'Reset buffer')
      nmap('<leader>gu', gs.undo_stage_hunk, 'Undo')
      nmap('<leader>gd', gs.diffthis, 'Diff file')
      nmap('<leader>gD', function()
        gs.diffthis '~'
      end, 'Diff')

      -- Navigation
      vim.keymap.set('n', 'g]', function()
        if vim.wo.diff then
          vim.cmd.normal { 'g]', bang = true }
        else
          gs.nav_hunk 'next'
        end
      end, { desc = 'Git: next hunk' })

      vim.keymap.set('n', 'g[', function()
        if vim.wo.diff then
          vim.cmd.normal { 'g[', bang = true }
        else
          gs.nav_hunk 'prev'
        end
      end, { desc = 'Git: previous hunk' })
      --
      -- Toggles
      nmap('<leader>gt', gs.toggle_deleted, 'Toggle deleted')
      nmap('<leader>gw', gs.toggle_word_diff, 'Toggle word diff')

      -- Text object
      vim.keymap.set({ 'o', 'x' }, 'gh', gs.select_hunk, { desc = 'Git: select hunk' })
    end,
  },
}
