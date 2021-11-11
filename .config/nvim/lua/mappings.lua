map = require('config.utils').map

map({'i', 'n'}, '<f4>', '<esc>:wq<cr>')
map({'i', 'n'}, '<s-f4>', '<f16>', { noremap = false })
map({'i', 'n'}, '<f16>', '<esc>:wqa<cr>') -- shift+f4
