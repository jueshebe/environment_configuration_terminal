local status_ok, dap_python = pcall(require, "dap-python")
if not status_ok then
  return
end

dap_python.setup()

-- custom configuration
local dap = require("dap")
configs = dap.configurations.python

table.insert(configs, {
  type = 'python';
  request = 'launch';
  name = 'Launch file (debug libs)';
  program = '${file}';
  justMyCode = false;
  console = "integratedTerminal";
})

table.insert(configs, {
  type = 'python';
  request = 'launch';
  name = 'Pytest: All Files';
  module = 'pytest';
  justMyCode = true;
  console = "integratedTerminal";
})

table.insert(configs, {
  type = 'python';
  request = 'launch';
  name = 'Pytest: Current File';
  module = 'pytest';
  args = {
        "${file}",
        "-sv",
        "--log-cli-level=INFO",
        "--log-file=test_out.log"
  },
  justMyCode = true;
  console = "integratedTerminal";
})
