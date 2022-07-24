local dap = require('dap')
local map = require('cartographer')

map.n.nore['gdc'] = [[<cmd>lua require('dap').continue()<cr>]]
map.n.nore['gdl'] = [[<cmd>lua require('dap').run_last()<cr>]]
map.n.nore['gdb'] = [[<cmd>lua require('dap').toggle_breakpoint()<cr>]]
map.n.nore['gdw'] = [[<cmd>lua require('dapui').toggle()<cr>]]

dap.adapters.ruby = {
  -- type = 'executable';
  type = 'server',
  command = 'bin/docker-debug',
  host = 'localhost',
  port = '3002',
  args = {
    'socket',
    'host=0.0.0.0',
    'port=3002',
  },
}

dap.configurations.ruby = {
  {
    type = 'ruby',
    request = 'attach',
    name = 'RSpec (Active File)',
    program = 'rspec',
    programArgs = { '${relativeFile}' },
    useBundler = false,
  }
}

require('dapui').setup()

-- dap.adapters.ruby = function(callback, config)
--   callback {
--     type = 'server',
--     host = '0.0.0.0',
--     port = '3002',
--     executable = {
--       command = 'bin/docker-debug',
--       args = {
--         '--nonstop',
--         '--open',
--         '--port=3002',
--         '--host=0.0.0.0',
--         '-c',
--         '--',
--         'bundle',
--         'exec',
--         config.command,
--         config.script,
--       },
--     },
--   }
-- end

-- dap.configurations.ruby = {
--   -- {
--   --   type =  'ruby',
--   --   name =  'RSpec (Active File)',
--   --   request =  'attach',
--   --   debugPort = 'localhost:3002',
--   --   localfsMap = '/app:${workspaceFolder}',
--   --   command = 'rspec',
--   --   script = { '${file}' },
--   -- },
--   -- {
--   --   type = 'ruby';
--   --   request = 'launch';
--   --   name = 'Rails';
--   --   program = 'rails';
--   --   programArgs = { 's' };
--   --   useBundler = true;
--   -- },
-- }
