local wk = require 'which-key'
local util = require 'core.util'

wk.add {
  { '<leader>o', group = 'Open' },
  { '<leader>b', group = 'Buffers' },
  { '<leader>s', group = 'String' },
  { '<leader>q', group = 'Session' },
  { '<leader>f', group = 'File' },
  { '<leader>t', group = 'Tab and terminal' },
  { '<leader><tab>', group = 'Tab navigation' },
  { '<leader>g', group = 'Git' },
  { '<leader>fg', group = 'Find Git files' },
}

-- Genereal keymaps
-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set({ 'n', 'i' }, '<Esc>', '<cmd>noh<cr><Esc>', { desc = 'Escape search', silent = true })
vim.keymap.set('n', '<leader>qq', '<cmd>qa<cr>', { desc = 'Quit' })
vim.keymap.set({ 'n', 'i', 'v' }, '<C-S>', '<cmd>write<cr>', { desc = 'Save file' })
vim.keymap.set({ 'n', 'i', 'v' }, '<A-s>', '<cmd>FormatWrite<cr>', { desc = 'Format and save file' })
-- vim.keymap.set('n', '<space>oe', '<cmd>Lexplore %:p:h<CR>', { desc = 'Open Explorer' })
-- vim.keymap.set('n', '<space>de', '<cmd>Lexplore<CR>', { desc = 'Close Explorer' })
-- disable history command
-- vim.keymap.set('n', 'q:', '<nop>', { remap = true })

-- open float windows
local nmap = util.map('n', 'Open: ')

nmap('<leader>ol', '<cmd>Lazy<cr>', 'Lazy')
nmap('<leader>om', '<cmd>Mason<cr>', 'Mason')

-- tabs
nmap = util.map('n', 'Terminal: ')
nmap('<leader>tt', '<cmd>term<cr>', 'Open')
nmap('<leader>tn', '<cmd>tabnew<cr><cmd>term<cr>', 'Open in new tab')
nmap('<leader>tv', '<cmd>vsplit<cr><cmd>term<cr>', 'Open in vertical')
nmap('<leader>th', '<cmd>split<cr><cmd>term<cr>', 'Open in horizontal')
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { silent = true })

nmap = util.map('n', 'Tab: ')
nmap('<leader>tn', '<cmd>tabnew<cr>', 'new')
nmap('<leader><tab>]', '<cmd>tabnext<cr>', 'next')
nmap('<leader><tab>[', '<cmd>tabprev<cr>', 'previous')
nmap('<leader>td', '<cmd>tabclose<cr>', 'close')
for i = 1, 5 do
  nmap('<leader><tab>' .. i, '<cmd>' .. i .. 'tabnext<cr>', 'to ' .. i)
end

-- buffer navigation
nmap = util.map('n', 'Buffer: ')
nmap('<leader>b[', '<cmd>bprev<cr>', 'Previous buffer')
nmap('<leader>b]', '<cmd>bnext<cr>', 'Next buffer')
nmap('<leader>bc', '<cmd>%bd|e#<CR>', 'Close except current')
nmap('<leader>ba', '<cmd>%bd<CR>', 'Close all')
