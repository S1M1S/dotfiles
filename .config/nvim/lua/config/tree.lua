local map = require('config.utils').map

require('nvim-tree').setup({})

function fix_nvim_tree()
  local toggle = require('nvim-tree').toggle
  toggle()
  toggle()
end

vim.cmd(':command! -complete=file -nargs=1 Cd cd <args> | lua fix_nvim_tree()')

map('c', 'cd', 'Cd')
map('n', '<leader>t', '<cmd>NvimTreeToggle<cr>', { silent = true })
