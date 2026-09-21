local dap = require("dap")


dap.adapters.lldb = {
  type = 'executable',
  command = '/usr/local/opt/llvm/bin/lldb-dap', -- Path to the lldb-vscode executable (adjust it according to your system)
  -- command = '/Users/julianestehe/.vscode/extensions/vadimcn.vscode-lldb-1.11.0/lldb/bin/debugserver',
  -- args = {
  --       "--fd=16",
  --       "--native-regs",
  --       "--setsid"
  -- },
  name = "lldb",
  console = "integratedTerminal"
}


dap.configurations.cpp = {
  {
    name = "Launch file",
    type = "lldb",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = "${workspaceFolder}",
    stopAtBeginningOfMainSubprogram = true,
    stopOnEntry = false,
    runInTerminal = true
  },
}

