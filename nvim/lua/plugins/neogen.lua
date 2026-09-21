local status, neogen = pcall(require, "neogen")

if not status then
  return
end
-- neogen docstring
neogen.setup({
	enabled = true, --if you want to disable Neogen
	input_after_comment = false, -- (default: true) automatic jump (with insert mode) on inserted annotation
	snippet_engine = "luasnip",
	languages = {
		python = {
			template = {
				annotation_convention = "google_docstrings", -- for a full list of annotation_conventions, see supported-languages below,
			},
		},
	},
})
local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "<Leader>dc", ":lua require('neogen').generate()<CR>", opts)


