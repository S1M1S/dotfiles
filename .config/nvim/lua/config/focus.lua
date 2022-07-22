local map = require('cartographer')

require('focus').setup {
  compatible_filetrees = { 'nvimtree' }
}

map.n.nore.silent['<c-h>'] = '<cmd>FocusSplitLeft<cr>'
map.n.nore.silent['<c-j>'] = '<cmd>FocusSplitDown<cr>'
map.n.nore.silent['<c-k>'] = '<cmd>FocusSplitUp<cr>'
map.n.nore.silent['<c-l>'] = '<cmd>FocusSplitRight<cr>'
map.n.nore.silent['vv']    = '<cmd>FocusSplitNicely<cr>'
