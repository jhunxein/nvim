-- install without yarn or npm
return {
  'iamcco/markdown-preview.nvim',
  cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
  build = 'cd app && npm install',
  init = function()
    vim.g.mkdp_filetypes = { 'markdown' }
    vim.g.mkdp_port = '1234'
  end,
  config = function()
    vim.keymap.set('n', '<leader>mm', ':MarkdownPreviewToggle<cr>', { desc = 'Toggle view markdown' })
  end,
  ft = { 'markdown' },
}
