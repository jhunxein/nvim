return {
  'numToStr/Comment.nvim',
  lazy = false,
  opts = {
    toggler = {
      ---Line-comment toggle keymap
      line = 'mm',
      ---Block-comment toggle keymap
      block = 'mb',
    },
    ---LHS of operator-pending mappings in NORMAL and VISUAL mode
    opleader = {
      ---Line-comment keymap
      line = 'mm',
      ---Block-comment keymap
      block = 'mb',
    },
  },
}
