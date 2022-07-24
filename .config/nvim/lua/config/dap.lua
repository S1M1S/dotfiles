local dap = require('dap')

dap.adapters.ruby = {
  type = 'server',
  port = '3002',
  executable = {
    command = './bin/docker-readapt',
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
