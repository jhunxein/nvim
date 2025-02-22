return {
  'neovim/nvim-lspconfig',
  dependencies = {
    -- Automatically install LSPs and related tools to stdpath for Neovim
    { 'williamboman/mason.nvim' }, -- NOTE: Must be loaded before dependants
    'williamboman/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',

    -- Useful status updates for LSP.
    -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
    { 'j-hui/fidget.nvim', opts = {} },

    -- Allows extra capabilities provided by nvim-cmp
    'hrsh7th/cmp-nvim-lsp',
  },
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    local wk = require 'which-key'
    local telescope_builtin = require 'telescope.builtin'
    local nmap = require('core.util').map('n', 'LSP: ')

    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
      callback = function(event)
        -- See `:help K` for why this keymap
        nmap('K', vim.lsp.buf.hover, 'Hover Documentation')

        -- key grouping
        wk.add {
          { '<leader>l', group = 'LSP' },
          { '<leader>le', group = 'LSP: Diagnostic message error' },
        }

        nmap('<leader>ln', vim.lsp.buf.rename, 'Rename')
        nmap('<leader>la', vim.lsp.buf.code_action, 'Code Action')
        nmap('<leader>lI', telescope_builtin.lsp_implementations, 'Go to Implementation')
        nmap('<leader>lt', vim.lsp.buf.type_definition, 'Type Definition')
        nmap('<leader>ls', telescope_builtin.lsp_document_symbols, 'Document Symbols')

        -- nmap('<C-k>', '<Nop>', 'Signature Documentation')
        -- vim.keymap.set('n', '<C-k>', '<Nop>', { silent = true })

        nmap('<leader>ld', vim.lsp.buf.declaration, 'Go to Declaration')
        nmap('<leader>lD', vim.lsp.buf.definition, 'Go to Definition')
        nmap('<leader>lr', telescope_builtin.lsp_references, 'Go to References')
        nmap('<leader>lv', ':vsplit | lua vim.lsp.buf.definition()<CR>', 'Go to Definition in vertical screen')

        -- Diagnostic keymaps
        nmap('<leader>l[', vim.diagnostic.goto_prev, 'Go to previous diagnostic message')
        nmap('<leader>l]', vim.diagnostic.goto_next, 'Go to next diagnostic message')
        nmap('<leader>le[', '<cmd>lua vim.diagnostic.goto_prev({severity=ERROR})<cr>', 'Go to previous error')
        nmap('<leader>le]', '<cmd>lua vim.diagnostic.goto_next({severity=ERROR})<cr>', 'Go to next error')
        nmap('<leader>lo', vim.diagnostic.setloclist, 'Open diagnostics list')

        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
          local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })
          vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
            buffer = event.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.document_highlight,
          })

          vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
            buffer = event.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.clear_references,
          })

          vim.api.nvim_create_autocmd('LspDetach', {
            group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
            callback = function(event2)
              vim.lsp.buf.clear_references()
              vim.api.nvim_clear_autocmds { group = 'kickstart-lsp-highlight', buffer = event2.buf }
            end,
          })

          -- The following code creates a keymap to toggle inlay hints in your
          -- code, if the language server you are using supports them
          --
          -- This may be unwanted, since they displace some of your code
          if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
            nmap('<leader>lh', function()
              vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
            end, 'Toggle Inlay Hints')
          end
        end
      end,
    })

    -- Setup each server
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())
    -- Enable the following language servers
    --  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
    --
    --  Add any additional override configuration in the following tables. Available keys are:
    --  - cmd (table): Override the default command used to start the server
    --  - filetypes (table): Override the default list of associated filetypes for the server
    --  - capabilities (table): Override fields in capabilities. Can be used to disable certain LSP features.
    --  - settings (table): Override the default settings passed when initializing the server.
    --        For example, to see the options for `lua_ls`, you could go to: https://luals.github.io/wiki/settings/

    local servers = {
      dockerls = {},
      bashls = {},
      yamlls = {},
      clangd = {},
      gopls = {},
      ts_ls = {
        init_options = {
          plugins = {
            {
              name = '@vue/typescript-plugin',
              location = '',
              languages = { 'javascript', 'typescript', 'vue' },
            },
          },
        },
        filetypes = {
          'javascript',
          'javascriptreact',
          'javascript.jsx',
          'typescript',
          'typescriptreact',
          'typescript.tsx',
          'vue',
        },
      },
      volar = {},
      ruff = {},
      pyright = {
        settings = {
          pyright = {
            disableOrganizeImports = true,
          },
          python = {
            analysis = {
              autoSearchPaths = true,
              useLibraryCodeForTypes = true,
              ignore = { '*' },
            },
          },
        },
      },
      svelte = {},
      tailwindcss = {
        filetypes = {
          'html',
          'javascript',
          'javascriptreact',
          'typescript',
          'typescriptreact',
          'vue',
          'svelte',
        },
      },
      lua_ls = {
        -- cmd = {...},
        -- capabilities = {},
        settings = {
          Lua = {
            completion = {
              callSnippet = 'Replace',
            },
            -- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
            -- diagnostics = { disable = { 'missing-fields' } },
          },
        },
      },
    }

    -- Ensure the servers and tools above are listed
    --  To check the current status of installed tools and/or manually install
    --  other tools, you can run
    --    :Mason

    require('mason').setup()

    local ensure_installed = vim.tbl_keys(servers or {})
    vim.list_extend(ensure_installed, {
      'stylua',
      'shfmt',
      'prettierd',
      'eslint_d',
      'ruff',
      -- 'pylint',
    })

    require('mason-tool-installer').setup { ensure_installed = ensure_installed }

    require('mason-lspconfig').setup {
      handlers = {
        function(server_name)
          local server = servers[server_name] or {}
          -- This handles overriding only values explicitly passed
          -- by the server configuration above. Useful when disabling
          -- certain features of an LSP (for example, turning off formatting for ts_ls)
          server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
          require('lspconfig')[server_name].setup(server)
        end,
      },
    }
  end,
}
