-- LSP configuration (error messages)
vim.diagnostic.config({
	virtual_text = true,
	signs = true,
	underline = false,
	update_in_insert = true,
})

-- completitions for LSP
local capabilities = nil
local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if status_ok then
	capabilities = cmp_nvim_lsp.default_capabilities()
end

vim.opt.completeopt = { "menu", "menuone", "noselect" }

-- Key maps for the LSP
local on_attach = function()
	vim.keymap.set("n", "K", vim.lsp.buf.hover)
	vim.keymap.set("n", "gd", ":lua vim.lsp.buf.definition()<CR>")
	vim.keymap.set("n", "sdj", ": lua vim.diagnostic.goto_next()<CR>")
	vim.keymap.set("n", "sdk", ": lua vim.diagnostic.goto_prev()<CR>")
	vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename)
	vim.keymap.set("n", "sdh", vim.diagnostic.open_float)
	vim.keymap.set("n", "<leader>ab", vim.lsp.buf.format)
	--vim.keymap.set("n","<leader>ed",vim.lsp.diagnostic.enable)
	--vim.keymap.set("n","<leader>cd",vim.lsp.diagnostic.disable)
end

---- PYTHON-----
--(pip install "python-lsp-server[all]")
--pip install pylsp-mypy
--pip install python-lsp-black
vim.lsp.config("pylsp", {
	capabilities = capabilities,
	on_attach = on_attach,
	settings = {
		pylsp = {
			configurationSources = {"flake8"},
			plugins = {
				-- PEP 8
				pycodestyle = {
					enabled = false,
				},
				mccabe = {
					enabled = false,
				},
				pyflakes = {
					enabled = false,
				},
				pylint = {
					enabled = true,
					-- args = {
					-- 	"--disable=import-error,too-many-arguments,too-many-instance-attributes,too-many-statements,too-many-locals,too-few-public-methods,unused-import,line-too-long,unused-variable,undefined-variable,trailing-whitespace",
					-- },
				},
				pydocstyle = {
					enabled = true,
					convention = "pep257",
					addSelect = { "D405" },
				},
				flake8 = {
					enabled = true,
				},

				black = {
					enabled = true,
				},
			},
		},
	},
})


-- ---- C/C++-----
vim.lsp.config("clangd", {
	capabilities = capabilities,
	on_attach = on_attach,
})

---- typescript, vue, react ----
--[[steps
npm init
npm -g install typescript
npx tsc --init
npm install eslint
npx eslint --init (select manual config or XO)
npm install -g typescript typescript-language-server (tsconfig.json)
npm i -g vscode-langservers-extracted
]]
-- add this on package.json to allow ESM modules "type": "module",
-- npm install -g prettier (configurar en package.json)
  -- "prettier": {
  --   "singleQuote": true
  -- }
-- tsserver (javascript , typescript)
--
function prettier()
	local file_path = vim.api.nvim_buf_get_name(0)
	local str_comando_bash = ":silent w |silent !prettier --write " .. file_path
	vim.api.nvim_command(str_comando_bash)
end
local on_attach_tsserver = function()
	vim.keymap.set("n", "K", vim.lsp.buf.hover)
	vim.keymap.set("n", "gd", ":lua vim.lsp.buf.definition()<CR>")
	vim.keymap.set("n", "sdj", ": lua vim.diagnostic.goto_next()<CR>")
	vim.keymap.set("n", "sdk", ": lua vim.diagnostic.goto_prev()<CR>")
	vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename)
	vim.keymap.set("n", "sdh", vim.diagnostic.open_float)
	vim.keymap.set("n", "<leader>ab", ":lua prettier()<CR>", {silent = true})
end


local cmd = {
  vim.fn.expand("~/.local/share/nvim/mason/bin/typescript-language-server"),
  "--stdio"
}
vim.lsp.config("ts_ls", {
	cmd = cmd,
	capabilities = capabilities,
	on_attach = on_attach_tsserver,
})


local cmd = {
  vim.fn.expand("~/.local/share/nvim/mason/bin/vscode-eslint-language-server"),
  "--stdio"
}
vim.lsp.config("eslint", {
	cmd = cmd,
	capabilities = capabilities,
	on_attach = on_attach_tsserver,
	filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx", "vue", "svelte", "astro" }
})


local cmd = {
  vim.fn.expand("~/.local/share/nvim/mason/bin/ngserver"),
  "--tsProbeLocations", "node_modules",
  "--ngProbeLocations", "node_modules",
  "--stdio"
}
vim.lsp.config("angularls", {
	capabilities = capabilities,
	on_attach = on_attach_tsserver,
  cmd = cmd,
  on_new_config = function(new_config,new_root_dir)
    new_config.cmd = cmd
  end,
})


local cmd = {
  vim.fn.expand("~/.local/share/nvim/mason/bin/emmet-language-server"),
  "--stdio"
}
vim.lsp.config("emmet_language_server", {
  cmd = cmd,
  capabilities = capabilities,
})

-- npm i -g vscode-langservers-extracted
--Enable (broadcasting) snippet capability for completion
local cmd = {
  vim.fn.expand("~/.local/share/nvim/mason/bin/vscode-css-language-server"),
  "--stdio"
}
vim.lsp.config("cssls", {
	cmd = cmd,
  capabilities = capabilities,
})


-- java
--https://github.com/eclipse-jdtls/eclipse.jdt.ls (lsp server)
vim.lsp.config("jdtls", {
	capabilities = capabilities,
	on_attach = on_attach,
})
--
-- local config = {
-- 	cmd = {'/Users/julianestehe/Applications/jdt_language_server/bin/jdtls'},
-- 	root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw'}, { upward = true })[1]),
-- 	capabilities = capabilities,
-- 	on_attach = on_attach,
-- }
-- require('jdtls').start_or_attach(config)

--Bash
local cmd = {
  vim.fn.expand("~/.local/share/nvim/mason/bin/bash-language-server"),
  "start"
}
vim.lsp.config("bashls", {
	cmd = cmd,
	capabilities = capabilities,
	on_attach = on_attach,
})

vim.lsp.enable({
	"pylsp",
	"clangd",
	"ts_ls",
	"eslint",
	"angularls",
	"emmet_language_server",
	"cssls",
	"jdtls",
	"bashls",
})
