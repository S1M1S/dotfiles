function fix_nvim_tree()
  local nvim_tree_toggle = require('nvim-tree').toggle
  nvim_tree_toggle()
  nvim_tree_toggle()
end

vim.cmd(':command! -complete=file -nargs=1 Cd cd <args> | lua fix_nvim_tree()')
local map = require('config.utils').map
map('c', 'cd', 'Cd')

function chtheme(themeStyle)
  require('github-theme').setup({ themeStyle = themeStyle })
  require('feline').reset_highlights()
end

vim.cmd(':command! -nargs=1 Chtheme lua chtheme("<args>")')
