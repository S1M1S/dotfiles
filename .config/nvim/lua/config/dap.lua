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
    name =  "RSpec (Active File)",
    "program": "rspec",
    "programArgs": [
        "-I",
        "${workspaceFolder}",
        "${file}"
    ],
    "useBundler": false
  },
}
