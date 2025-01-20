-- [[ Basic Keymaps ]]

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- vim.keymap.set('n', '<space>oe', '<cmd>Lexplore %:p:h<CR>', { desc = 'Open Explorer' })
-- vim.keymap.set('n', '<space>de', '<cmd>Lexplore<CR>', { desc = 'Close Explorer' })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', ']e', '<cmd>lua vim.diagnostic.goto_next({severity=ERROR})<cr>', { desc = 'Go to next error' })
vim.keymap.set('n', '[e', '<cmd>lua vim.diagnostic.goto_prev({severity=ERROR})<cr>', { desc = 'Go to previous error' })
vim.keymap.set('n', '<leader>odf', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>odl', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- disable history command
vim.keymap.set('n', 'q:', '<nop>', { remap = true })

vim.keymap.set({ 'n', 'i' }, '<Esc>', '<cmd>noh<cr><Esc>', { desc = 'Escape search', silent = true })

vim.keymap.set('n', '<leader>qq', '<cmd>qa<cr>', { desc = 'Quit' })

vim.keymap.set('n', '<leader>ol', '<cmd>Lazy<cr>', { desc = 'Open Lazy' })
vim.keymap.set('n', '<leader>om', '<cmd>Mason<cr>', { desc = 'Open Mason' })

-- tabs
vim.keymap.set('n', '<leader>ott', '<cmd>term<cr>', { desc = 'Open terminal' })
vim.keymap.set('n', '<leader>otn', '<cmd>tabnew<cr><cmd>term<cr>', { desc = 'Open terminal in new tab' })
vim.keymap.set('n', '<leader>otv', '<cmd>vsplit<cr><cmd>term<cr>', { desc = 'Open terminal in vertical' })
vim.keymap.set('n', '<leader>oth', '<cmd>split<cr><cmd>term<cr>', { desc = 'Open terminal in horizontal' })
vim.keymap.set('n', '<leader><tab>n', '<cmd>tabnew<cr>', { desc = 'Tab new' })
vim.keymap.set('n', '<leader><tab>]', '<cmd>tabnext<cr>', { desc = 'Tab next' })
vim.keymap.set('n', '<leader><tab>[', '<cmd>tabprev<cr>', { desc = 'Tab previous' })
vim.keymap.set('n', '<leader><tab>d', '<cmd>tabclose<cr>', { desc = 'Tab Close' })
for i = 1, 5 do
  vim.keymap.set('n', '<leader><tab>' .. i, '<cmd>' .. i .. 'tabnext<cr>', { desc = 'Tab to ' .. i })
end
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { silent = true })

-- savefile
vim.keymap.set({ 'n', 'i', 'v' }, '<C-S>', '<cmd>write<cr>', { desc = 'Save file' })
vim.keymap.set({ 'n', 'i', 'v' }, '<A-s>', '<cmd>FormatWrite<cr>', { desc = 'Format and save file' })

-- buffer navigation
vim.keymap.set('n', '<leader>ja', '<cmd>bprev<cr>', { desc = 'Previous buffer' })
vim.keymap.set('n', '<leader>jd', '<cmd>bnext<cr>', { desc = 'Next buffer' })
vim.keymap.set('n', '<space>dd', '<cmd>%bd|e#<CR>', { desc = 'Close buffer except current' })
-- vim.keymap.set('n', '<space>da', '<cmd>%bd<CR>', { desc = 'Close all buffer' })

-- LSP
vim.keymap.set('n', '<leader>lt', '<cmd>LspStop<cr>', { desc = 'LSP Stop' })
vim.keymap.set('n', '<leader>ls', '<cmd>LspStart<cr>', { desc = 'LSP Start' })
vim.keymap.set('n', '<leader>lr', '<cmd>LspRestart<cr>', { desc = 'LSP Restart' })
