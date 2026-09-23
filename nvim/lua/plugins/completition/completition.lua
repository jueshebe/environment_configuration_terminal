-- Set up nvim-cmp (text completition)
local status_cmp, cmp = pcall(require, "cmp")
local status_luasnip, luasnip = pcall(require, "luasnip")
local status_luasnip_vscode, from_vscode = pcall(require, "luasnip/loaders/from_vscode")
local status_dictionary, dictionary = pcall(require, "cmp_dictionary")
local status_lspkind, lspkind = pcall(require, 'lspkind') --vscode-like pictograms
local status_cmp_dap, cmp_dap = pcall(require, "cmp_dap")

if not (status_cmp and status_luasnip and status_luasnip_vscode and status_lspkind and status_cmp_dap) then
  return
end

--mapping for luasnip
-- vim.keymap.set({"i", "s"}, "J", function() luasnip.jump( 1) end, {silent = true})
-- vim.keymap.set({"i", "s"}, "K", function() luasnip.jump(-1) end, {silent = true})

from_vscode.lazy_load()

vim.opt.completeopt = "menu,menuone,noselect"

--cmp setup
cmp.setup({
	enabled = function() -- DAP REPL
    return vim.api.nvim_buf_get_option(0, "buftype") ~= "prompt"
      or cmp_dap.is_dap_buffer()
  end,
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body) -- For `luasnip` users.
		end,
	},
	mapping = cmp.mapping.preset.insert({
		['<C-u>'] = cmp.mapping.scroll_docs(-4),
		['<C-d>'] = cmp.mapping.scroll_docs(4),
		['<C-p>'] = cmp.mapping.select_prev_item(),
		['<C-n>'] = cmp.mapping.select_next_item(),
		-- ['<C-Space>'] = cmp.complete(),
		-- ['<C-e>'] = cmp.abort(),
		['<C-c>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	}),
	sources = cmp.config.sources({
		{ name = 'nvim_lsp', priority = 10 },
		{ name = 'buffer' },
		{ name = 'luasnip' }, -- For luasnip users.
		{ 
			name = 'path',
			option = {
				trailing_slash = true
			}
		},
		{ name = 'rpncalc' },
		{ name = 'calc' },
		{ name = 'cmp-tw2css' },
		{ name = 'dictionary' },
		{ 
			name = 'bulma',
			option = {
				filetypes = {
						"html",
						"css"
				},
			}
		},
		{name = "neosnippet"},
	}),
	formatting = {
    format = lspkind.cmp_format({
			with_text = true,
      maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
      ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
			menu = {
				nvim_lsp = "[LSP]",
				buffer = "[buf]",
				luasnip = "[snip]",
				path = "[path]",
				rpncalc = "[rpncal]",
				calc = "[cal]",
				cmp_tw2css = "[tw2css]",
				dictionary = "[dict]",
				bulma = "[bulma]",
				neosnippet = "[neosnippet]"
			}
    })
		-- format = lspkind.cmp_format({ with_text = true, maxwidth = 50 })
  },

})


-- completition on nvim Command mode
cmp.setup.cmdline('/', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = 'buffer' }
      }
    })
	
cmp.setup.cmdline(':', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = 'path' }
	}, {
		{
			name = 'cmdline',
			option = {
				ignore_cmds = { 'Man', '!' }
			}
		}
	})
})


-- completition for DAP
cmp.setup.filetype({ "dap-repl", "dapui_watches", "dapui_hover" }, {
  sources = {
    { name = "dap" },
  },
})

-- language completition

local home = vim.fn.expand('$HOME')
local rel_english_language = "/.config/nvim/lua/plugins/completition/en.dict"
local english_language_path = home .. rel_english_language

dictionary.setup({
  paths = { english_language_path },
  exact_length = 2,
  first_case_insensitive = true,
  -- document = {
  --   enable = true,
  --   command = { "wn", "${label}", "-over" },
  -- },
	-- max_number_items = 30,
})
