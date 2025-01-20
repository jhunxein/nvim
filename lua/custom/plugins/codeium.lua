return {
  'Exafunction/codeium.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'hrsh7th/nvim-cmp',
  },
  opts = {
    enable_cmp_source = false,
    virtual_text = {
      enabled = true,
      key_bindings = {
        accept = '<M-y>',
        next = '<M-n>',
        prev = '<M-p>',
        dismiss = '<M-e>',
      },
    },
  },
}
