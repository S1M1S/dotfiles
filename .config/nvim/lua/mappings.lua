map = require('config.utils').map

map({'i', 'n'}, '<f4>', '<esc>:wq<cr>')
map({'i', 'n'}, '<s-f4>', '<f16>', { noremap = false })
map({'i', 'n'}, '<f16>', '<esc>:wqa<cr>') -- shift+f4
map({'c'}, '-date', '<C-R>=strftime("%Y%m%d-%H%M")<CR>-')
map({'n'}, '<leader>date', 'i<c-r>=strftime("%Y-%m-%d %a %I:%M %p")<cr><esc>')

