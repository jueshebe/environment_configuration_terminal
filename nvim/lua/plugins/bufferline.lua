local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
  return
end

vim.opt.termguicolors = true
bufferline.setup{
	options = {
		mode = "tabs",
		numbers = "ordinal",
		-- indicator = {
		-- 	style = "underline"
		-- },
		-- separator_style = "slant",
		offsets = {
			{
				filetype = "NvimTree",
				text = "File Explorer",
				-- text_align = "left" | "center" | "right"
				-- separator = true
				padding = 1
			}
		}
	},
	highlights = {
    separator = {
      guifg = '#073642',
      guibg = '#002b36',
    },
    separator_selected = {
      guifg = '#073642',
    },
    background = {
      guifg = '#657b83',
      guibg = '#002b36'
    },
    buffer_selected = {
      guifg = '#fdf6e3',
      gui = "bold",
    },
    fill = {
      guibg = '#073642'
    }
  },
	-- highlights = {
	-- 	fill = {
	-- 		ctermbg = 255,
	-- 		ctermfg = 255
	-- 	}
	-- },
}

--tabs
local keymap = vim.keymap
keymap.set("n", "<Leader>to", ":tabnew<CR>")
keymap.set("n", "<Leader>tc", ":tabclose<CR>")
keymap.set("n", "<Leader>tn", ":tabn<CR>")
keymap.set("n", "<Leader>tp", ":tabp<CR>")
keymap.set("n", "<Leader>tml", ":-tabmove<CR>")
keymap.set("n", "<Leader>tmr", ":+tabmove<CR>")
