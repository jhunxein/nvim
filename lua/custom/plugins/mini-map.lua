return {
  'echasnovski/mini.map',
  version = false,
  config = function()
    require('mini.map').setup()

    local nmap = require('core.util').map('n', 'MiniMap: ')
    nmap('<Leader>mc', MiniMap.close, 'Close')
    nmap('<Leader>mf', MiniMap.toggle_focus, 'Toggle focus')
    nmap('<Leader>mo', MiniMap.open, 'Open')
    nmap('<Leader>mr', MiniMap.refresh, 'Refresh')
    nmap('<Leader>ms', MiniMap.toggle_side, 'Toggle side')
    nmap('<Leader>mt', MiniMap.toggle, 'Toogle')
  end,
}
