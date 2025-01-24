return {
  'Exafunction/codeium.nvim',
  enabled = true,
  dependencies = {
    'nvim-lua/plenary.nvim',
    'hrsh7th/nvim-cmp',
  },
  opts = {
    enable_cmp_source = false,
    virtual_text = {
      enabled = true,
      default_filetype_enabled = false,
      filetypes = {
        python = true,
        typescript = true,
        javascript = true,
        vue = true,
        react = true,
        c = true,
        lua = true,
        markdown = true,
      },
      key_bindings = {
        accept = '<M-y>',
        next = '<M-n>',
        prev = '<M-p>',
        dismiss = '<M-e>',
      },
    },
  },
}
