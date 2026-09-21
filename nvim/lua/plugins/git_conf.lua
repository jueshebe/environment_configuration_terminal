local status_icons, conflict = pcall(require, "git-conflict")
local status_gitsigns, gitsigns = pcall(require, 'gitsigns')
local status_git, git = pcall(require, 'git')

if not (status_icons and status_gitsigns and status_git) then
  return
end


--git select change in conflict 
conflict.setup{
			enabled = true,
			default_mappings = true, -- disable buffer local mapping created by this plugin
			disable_diagnostics = false, -- This will disable the diagnostics in a buffer whilst it is conflicted
			highlights = { -- They must have background color, otherwise the default color will be used
        incoming = 'DiffAdd',
        current = 'DiffText',
				-- incoming = '',
				-- current = '',
			}
}
-- local opts = { noremap = true, silent = true }
-- vim.api.nvim_set_keymap("n", "<Leader>gi", ":GitConflictChooseTheirs<CR>", opts)
-- vim.api.nvim_set_keymap("n", "<Leader>ga", ":GitConflictChooseOurs<CR>", opts)
-- vim.api.nvim_set_keymap("n", "<Leader>gb", ":GitConflictChooseBoth<CR>", opts)
-- vim.api.nvim_set_keymap("n", "<Leader>gp", ":GitConflictNextConflict<CR>", opts)
-- vim.api.nvim_set_keymap("n", "<Leader>go", ":GitConflictPrevConflict<CR>", opts)
gitsigns.setup()
git.setup()
