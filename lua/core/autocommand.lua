-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

local nvim_terminal = vim.api.nvim_create_augroup('nvim_terminal', { clear = true })

vim.api.nvim_create_autocmd({ 'TermOpen', 'TermEnter' }, {
  callback = function()
    vim.opt.number = false
    vim.opt.relativenumber = false
    vim.o.autowrite = false
    vim.o.hidden = true
    vim.o.confirm = false
  end,
  group = nvim_terminal,
})

vim.api.nvim_create_autocmd({ 'TermClose', 'TermLeave' }, {
  callback = function()
    vim.opt.number = true
    vim.opt.relativenumber = true
    vim.o.autowrite = false
    vim.o.hidden = false
    vim.o.confirm = true
  end,
  group = nvim_terminal,
})
--
-- local write_group = vim.api.nvim_create_augroup('custom_write', { clear = true })
-- vim.api.nvim_create_autocmd('BufWritePre', {
--   callback = function(opts)
--     local opt = {}
--     opt.bufnr = opts.buf
--     -- vim.lsp.buf.format(opt)
--     vim.cmd('Format')
--   end,
--   group = write_group,
-- })
