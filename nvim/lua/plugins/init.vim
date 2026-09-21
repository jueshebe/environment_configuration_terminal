" Directorio de pluginsplug
call plug#begin('~/.local/share/nvim/plugged')


"investigar
Plug 'sheerun/vim-polyglot'
Plug 'nvim-lua/plenary.nvim'

"search tool
" Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-file-browser.nvim'
Plug 'nvim-telescope/telescope-dap.nvim'
Plug 'xiyaowong/telescope-emoji'
" Plug 'nvim-telescope/telescope-treesitter.nvim'
"window maximizer
Plug 'declancm/maximize.nvim'

"move on windows
Plug 'christoomey/vim-tmux-navigator'

"file explorer
Plug 'nvim-tree/nvim-web-devicons' " optional
Plug 'nvim-tree/nvim-tree.lua'
" Plug 'kyazdani42/nvim-tree.lua'
" Plug 'kyazdani42/nvim-web-devicons'

"tabs on a pane, emulate normal panes on a guide"
Plug 'akinsho/bufferline.nvim'

"lua-line
Plug 'nvim-lualine/lualine.nvim'

"harpoon para moverme entre archivos
Plug 'ThePrimeagen/harpoon'

"indentation
Plug 'Yggdroot/indentLine'

"autopairs
Plug 'windwp/nvim-autopairs'
Plug 'windwp/nvim-ts-autotag'

"replace with register
Plug 'vim-scripts/ReplaceWithRegister'

"comment code. not used for docstring o documentation info (see neogen)
Plug 'numToStr/Comment.nvim'

"git blame (show line modifications)
Plug 'f-person/git-blame.nvim'
Plug 'dinhhuy258/git.nvim'
Plug 'lewis6991/gitsigns.nvim'
"git select on conflict
Plug 'akinsho/git-conflict.nvim'

"highlight on languages.
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

"server configuration (collection of LSP configs)
Plug 'neovim/nvim-lspconfig'
"only java
Plug 'mfussenegger/nvim-jdtls'

"annotations tool
Plug 'danymat/neogen'


"lsp formatting and linter
Plug 'jose-elias-alvarez/null-ls.nvim'
"auto-completition
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer' " for buffer completition
Plug 'hrsh7th/cmp-path' "  for path completition
Plug 'hrsh7th/cmp-nvim-lsp' "for LSP (maybe repeated)
Plug 'hrsh7th/cmp-cmdline' "for command mode
Plug 'rcarriga/cmp-dap' "for DAP REPL completitions
Plug 'PhilRunninger/cmp-rpncalc' "for mathematical operations
Plug 'hrsh7th/cmp-calc' " mathematical operations
Plug 'uga-rosa/cmp-dictionary' " dictionary completitions
Plug 'jcha0713/cmp-tw2css'
Plug 'hrsh7th/nvim-cmp'
Plug 'garyhurtz/cmp_bulma.nvim'

" Colors for hex, rgb, etc
Plug 'catgoose/nvim-colorizer.lua'

"snippets
Plug 'L3MON4D3/LuaSnip' " snippet engine
Plug 'saadparwaiz1/cmp_luasnip' "snippets source
Plug 'rafamadriz/friendly-snippets' " snippets source for languages
Plug 'notomo/cmp-neosnippet'

"vscode-like pictograms por cmp menu
Plug 'onsails/lspkind.nvim'


"debugging
Plug 'mfussenegger/nvim-dap'
"debugging ui
Plug 'rcarriga/nvim-dap-ui'
Plug 'nvim-neotest/nvim-nio'

"implementation of debugpy DAP
Plug 'mfussenegger/nvim-dap-python' "python configuration

" adaptadores
" Plug 'mxsdev/nvim-dap-vscode-js'
" problems must be set manually on plugings file
", {'do': 'npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out'} " manuall configuration https://github.com/mxsdev/nvim-dap-vscode-js
" for typescript
Plug 'sigmasd/deno-nvim'

"investigar
Plug 'vim-python/python-syntax'

"sesiones
" Plug 'tpope/vim-obsession'

" Copilot
Plug 'github/copilot.vim'

" Mason para LSP y DAP
Plug 'williamboman/mason.nvim'


" colorscheme
Plug 'bluz71/vim-nightfly-colors'
Plug 'joshdick/onedark.vim'
Plug 'dracula/vim', { 'as': 'dracula' }

Plug 'startup-nvim/startup.nvim'

call plug#end()
