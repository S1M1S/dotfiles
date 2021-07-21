local map = require('config.utils').map
local t =   require('config.utils').t


require('compe').setup {
  enabled = true,
  autocomplete = true,
  min_length = 1,
  preselect = 'enable',
  documentation = { border = 'single' },
  source = {
    path = true,
    -- nvim_lsp = true,
    nvim_lua = true,
    buffer = true,
    vsnip = true,
  },
}

-- tab navigation for for completion menu
local check_back_space = function()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  elseif vim.fn['vsnip#available'](1) == 1 then
    return t "<Plug>(vsnip-expand-or-jump)"
  elseif check_back_space() then
    return t "<Tab>"
  else
    return vim.fn['compe#complete']()
  end
end
_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  elseif vim.fn['vsnip#jumpable'](-1) == 1 then
    return t "<Plug>(vsnip-jump-prev)"
  else
    -- If <S-Tab> is not working in your terminal, change it to <C-h>
    return t "<S-Tab>"
  end
end

map('i', '<c-space>', 'compe#confirm()',        {expr = true, silent = true, noremap = true})
map('i', '<tab>',     'v:lua.tab_complete()',   {expr = true})
map('i', '<s-tab>',   'v:lua.s_tab_complete()', {expr = true})
