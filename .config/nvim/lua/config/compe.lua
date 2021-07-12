local map = require('config.utils').map
local t =   require('config.utils').t

require('compe').setup {
  enabled = true,
  autocomplete = true,
  min_length = 1,
  preselect = 'always',
  documentation = { border = 'single' },
  source = {
    path = true,
    -- nvim_lsp = true,
    nvim_lua = true,
    buffer = true,
    vsnip = true,
  },
}

local opts = {noremap = true, silent = true, expr = true}

map('i', '<c-space>', [[compe#complete()]],            opts)
map('i', '<c-f>',     [[compe#scroll({'delta': +4})]], opts)
map('i', '<c-d>',     [[compe#scroll({'delta': -4})]], opts)
