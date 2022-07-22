local map = require('config.utils').map

vim.g.ale_disable_lsp = true
vim.g.ale_fixers = {
  ruby = {'rubocop'},
}

vim.api.nvim_create_autocmd({'BufEnter', 'BufWinEnter'}, {
  pattern = '*.rb',
  command = 'ALEEnable'
})

map('n', '<leader>af', '<cmd>ALEFix<cr>')
