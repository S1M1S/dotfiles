local dap = require('dap')

dap.adapters.ruby = {
  type = 'server',
  port = '${port}',
  executable = {
    command = './bin/readapt',
    args = { 'socket', '--port=${port}' },
  }
}

dap.configurations.ruby = {
  {
    type = 'ruby';
    request = 'launch';
    name = 'Rails';
    program = 'rails';
    programArgs = { 's' };
    useBundler = true;
  },
  {
    type =  "ruby",
    request =  "launch",
    name =  "RSpec LocalFile",
    program =  "rspec",
    programArgs = { "${relativeFile}" },
    useBundler =  true
  },
  {
    type =  "ruby",
    request =  "launch",
    name =  "RSpec Selected Line",
    program =  "rspec",
    programArgs = { "${relativeFile}:${lineNumber}" },
    useBundler =  true
  }
}
