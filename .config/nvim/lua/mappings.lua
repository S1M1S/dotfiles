local map_old = require('config.utils').map
local map = require('cartographer')

-- shortcuts to quit out of nvim
map_old({'i', 'n'}, '<f4>', '<esc>:wq<cr>')
map_old({'i', 'n'}, '<s-f4>', '<f16>', { noremap = false })
map_old({'i', 'n'}, '<f16>', '<esc>:wqa<cr>') -- shift+f4

-- shortcuts for inserting today's date
map_old({'c'}, '-date', '<C-R>=strftime("%Y%m%d-%H%M")<CR>-')
map_old({'n'}, '<leader>date', 'i<c-r>=strftime("%Y-%m-%d %a %I:%M %p")<cr><esc>')

-- option+w kicks you out of terminal
map_old({'t'}, '∑', '<C-\\><C-N>')

-- slightly quicker way to open a fold
map_old({'n'}, 'zz', 'za')

-- make it easier to close the quickfix list
map_old({'n'}, '<leader>cc', '<cmd>cclose<cr>')

-- swap full page jump for half page jump
map.n.nore.silent['<c-b>'] = '<c-u>'
map.n.nore.silent['<c-f>'] = '<c-d>'

-- ctrl+r during visual mode for an amazing replace gui
map.v.nore.silent['<c-r>'] = [["hy:%s/<C-r>h//gc<left><left><left>]]
