local map = require('cartographer')

require('auto-session').setup {
  pre_save_cmds = {
    'NvimTreeClose',
    'cclose',
    'lua vim.notify.dismiss()',
  },
  post_restore_cmds = {
    'NvimTreeRefresh',
    'set cmdheight=1',
  },
  auto_save_enabled = true,
  auto_restore_enabled = false,
  auto_session_enable_last_session=true, -- experimental feature to improve gui compatibility
}

map.n.nore.silent['<leader>sl'] = '<cmd>silent RestoreSession<cr>'
map.n.nore.silent['<leader>ss'] = '<cmd>SaveSession<cr>'
map.n.nore.silent['<leader>si'] = [[ <cmd>lua require('notify')('Session name: ' .. require('auto-session-library').current_session_name())<cr> ]]

-- For a better experience with the plugin overall using this config for sessionoptions is recommended.
vim.o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal"
