local map = require('config.utils').map

function fix_nvim_tree()
  local toggle = require('nvim-tree').toggle
  toggle()
  toggle()
end

vim.cmd(':command! -complete=file -nargs=1 Cd cd <args> | lua fix_nvim_tree()')
local map = require('config.utils').map
map('c', 'cd', 'Cd')

map('n', '<leader>t', '<cmd>NvimTreeToggle<cr>')
