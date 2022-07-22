local map = require('config.utils').map

-- shortcuts to quit out of nvim
map({'i', 'n'}, '<f4>', '<esc>:wq<cr>')
map({'i', 'n'}, '<s-f4>', '<f16>', { noremap = false })
map({'i', 'n'}, '<f16>', '<esc>:wqa<cr>') -- shift+f4

-- shortcuts for inserting today's date
map({'c'}, '-date', '<C-R>=strftime("%Y%m%d-%H%M")<CR>-')
map({'n'}, '<leader>date', 'i<c-r>=strftime("%Y-%m-%d %a %I:%M %p")<cr><esc>')

-- option+w kicks you out of terminal
map({'t'}, '∑', '<C-\\><C-N>')

-- slightly quicker way to open a fold
map({'n'}, 'zz', 'za')

-- remap jumping forward and backward a page to just a half page
map({'n'}, '<c-j>', '<c-d>')
map({'n'}, '<c-k>', '<c-u>')

-- make it easier to close the quickfix list
map({'n'}, '<leader>cc', '<cmd>cclose<cr>')
