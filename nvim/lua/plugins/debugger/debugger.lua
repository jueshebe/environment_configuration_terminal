local status_ok, dap = pcall(require, "dap")

if not status_ok then
  return
end


--debugger mapping
vim.keymap.set("n", "<Leader>1", ":lua require'dap'.continue()<CR>")
vim.keymap.set("n", "<Leader>2", ":lua require'dap'.step_over()<CR>")
vim.keymap.set("n", "<Leader>3", ":lua require'dap'.step_into()<CR>")
vim.keymap.set("n", "<Leader>4", ":lua require'dap'.step_out()<CR>")
vim.keymap.set("n", "<Leader>5", ":lua require'dap'.terminate()<CR>:lua require'dap'.run_last()<CR>")
vim.keymap.set("n", "<Leader>6", ":lua require'dap'.step_back()<CR>")
vim.keymap.set("n", "<Leader>7", ":lua require'dap'.focus_frame()<CR>")
vim.keymap.set("n", "<Leader>8", ":Telescope dap list_breakpoints<CR>")

vim.keymap.set("n", "<Leader>b", ":lua require'dap'.toggle_breakpoint()<CR>")
vim.keymap.set("n", "<Leader>B", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")
vim.keymap.set("n", "<Leader>L", ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>")
vim.keymap.set("n", "<Leader>cb", ":lua require'dap'.clear_breakpoints()<CR>")
vim.keymap.set("n", "<Leader>de", ":lua require('dapui').close()<CR>:lua require'dap'.terminate()<CR>")
-- vim.keymap.set("n", "<Leader>de", ":lua require'dap'.terminate()<CR>")
vim.keymap.set("n", "<Leader>e", ":lua require'dapui'.eval()<CR>")

vim.fn.sign_define('DapBreakpoint', {text='🛑', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapStopped', {text='', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapBreakpointCondition', {text='🛑', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapBreakpointRejected', {text='🛑', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapBreakpointResolved', {text='🛑', texthl='', linehl='', numhl=''})

-- dap configuration for python
require("plugins.debugger.python.python_conf")

-- dap configuration for javascript
-- https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation#javascript-chrome
require("plugins.debugger.javascript.javascript_conf")

-- dap c
require("plugins.debugger.c.c_config")

-- bash
require("plugins.debugger.bash.bash")

-- read manual adapter configuration
-- require("dap.ext.vscode").load_launchjs(nil, { lldb = {'cpp', 'c', 'rust'}})
