--window maximize
local status, maximize = pcall(require, 'maximize')
if not status then
  return
end

maximize.setup()
vim.keymap.set('n', '<Leader>z', "<Cmd>lua require('maximize').toggle()<CR>")

local function maximize_status()
  return vim.t.maximized and '   ' or ''
end

