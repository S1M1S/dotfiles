local map = require('config.utils').map

local silent = {silent = true}
-- Navigate buffers and repos
map('n', '<c-a>', [[<cmd>Telescope buffers show_all_buffers=true sort_lastused=true<cr>]], silent)
map('n', '<c-p>', [[<cmd>Telescope git_files<cr>]], silent)
map('n', '<c-d>', [[<cmd>Telescope find_files hidden=true<cr>]], silent)
map('n', '<c-g>', [[<cmd>Telescope live_grep<cr>]], silent)
map('n', '<leader>cs', [[<cmd>Telescope cheat fd<cr>]], silent)
