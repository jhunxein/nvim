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
