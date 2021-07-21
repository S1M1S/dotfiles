local map = require('config.utils').map
require('neogit').setup { disable_commit_confirmation = true }

map('n', '<leader>g', [[<cmd>Neogit<cr>]], { silent = true })
