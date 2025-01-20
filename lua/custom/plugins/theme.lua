return {
  {
    'rebelot/kanagawa.nvim',
    priority = 1000,
    opts = {
      transparent = true,
      undercurl = true,
      background = { -- map the value of 'background' option to a theme
        dark = 'dragon', -- try "dragon" !
        light = 'lotus',
      },

      colors = {
        theme = {
          all = {
            ui = {
              bg_gutter = 'none',
            },
          },
        },
      },

      overrides = function(colors)
        local theme = colors.theme
        return {
          Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 }, -- add `blend = vim.o.pumblend` to enable transparency
          PmenuSel = { fg = 'NONE', bg = theme.ui.bg_p2 },
          PmenuSbar = { bg = theme.ui.bg_m1 },
          PmenuThumb = { bg = theme.ui.bg_p2 },
        }
      end,
    },

    config = function(_, opts)
      require('kanagawa').setup(opts)
      vim.cmd [[colorscheme kanagawa]]
    end,
  },
}
