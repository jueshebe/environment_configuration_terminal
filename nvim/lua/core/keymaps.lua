--assign map leader
vim.g.mapleader = " " 

local keymap = vim.keymap
--mapping window movement (we use plug to use with tmux)
keymap.set("n", "<Leader>h", "<C-w>h")
keymap.set("n", "<Leader>j", "<C-w>j")
keymap.set("n", "<Leader>k", "<C-w>k")
keymap.set("n", "<Leader>l", "<C-w>l")

-- keymap.set("n", "<C-h>", "<C-w>h")
-- keymap.set("n", "<C-j>", "<C-w>j")
-- keymap.set("n", "<C-k>", "<C-w>k")
-- keymap.set("n", "<C-l>", "<C-w>l")

-- vim.g.tmux_navigator_no_mappings = 1
-- keymap.set("n", "<C-h>", ": TmuxNavigateLeft<cr>")
-- keymap.set("n", "<C-j>", ": TmuxNavigateDown<cr>")
-- keymap.set("n", "<C-k>", ": TmuxNavigateUp<cr>")
-- keymap.set("n", "<C-l>", ": TmuxNavigateRight<cr>")

-- clear highlighted text after search
keymap.set("n", "<Leader>q", ':let @/=""<CR>')

-- increment/decrement numbers
--keymap.set("n", "<Leader>+", "<C-a>")
--keymap.set("n", "<Leader>-", "<C-x>")

--split window
keymap.set("n", "<Leader>wh", "<C-w>v")
keymap.set("n", "<Leader>wv", "<C-w>s")
keymap.set("n", "<Leader>we", "<C-w>=")
keymap.set("n", "<Leader>wx", ":close<CR>")

--center cursor
-- keymap.set("n", "j", "jzz")
-- keymap.set("n", "k", "kzz")
keymap.set("n", "{", "{zz")
keymap.set("n", "}", "}zz")
keymap.set("n", "<C-o>", "<C-o>zz")
keymap.set("n", "<C-i>", "<C-i>zz")
keymap.set("n", "n", "nzz")
keymap.set("n", "<S-n>", "<S-n>zz")
-- keymap.set("n", "G", "Gzz")


--copy current file
keymap.set("n", "<Leader>cf", ":let @+=expand('%:p')<CR>")
