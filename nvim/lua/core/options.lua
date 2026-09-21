local opt = vim.opt -- for conciseness

 
-- set nohlsearch
--opt.langmenu=en_US.UTF-8
--optlanguage messages en_US.UTF-8

-- line numbers
-- opt.relativenumber = true
opt.number = true

--tabs & identation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- line wrapping
opt.wrap = false

--search settings
opt.ignorecase = true
opt.smartcase = true

--cursor line
opt.cursorline = true

--appereance
-- opt.termguicolors = true
-- opt.background = "dark"
-- opt.signcolumn = "yes"

-- backspace
opt.backspace = "indent,eol,start"

--clipboard
opt.clipboard:append("unnamedplus")

--identation
vim.g.indentLine_enabled = 1
vim.g.indentLine_fileTypeExclude = {'text', 'sh', 'help', 'terminal'}
vim.g.indentLine_bufNameExclude = {'NERD_tree.*', 'term:.*'}
