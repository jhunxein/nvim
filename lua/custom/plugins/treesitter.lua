return {
  'nvim-treesitter/nvim-treesitter',
  opts = {
    highlight = { enable = true },
    indent = { enable = true },
    ensure_installed = {
      'python',
      'lua',
      'vue',
      'typescript',
      -- 'react',
      'svelte',
      'javascript',
      -- 'typescriptreact',
      -- 'javascriptreact',
      'bash',
      'css',
      'git_config',
      'gitcommit',
      'gitignore',
      'html',
      'markdown',
      'php',
      'phpdoc',
      'go',
      'dockerfile',
      'make',
    },
  },
  config = function(_, opts)
    if type(opts.ensure_installed) == 'table' then
      ---@type table<string, boolean>
      local added = {}
      opts.ensure_installed = vim.tbl_filter(function(lang)
        if added[lang] then
          return false
        end
        added[lang] = true
        return true
      end, opts.ensure_installed)
    end
    require('nvim-treesitter.configs').setup(opts)
  end,
}
