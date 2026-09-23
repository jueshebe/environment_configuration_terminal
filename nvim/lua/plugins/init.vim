" Directorio de pluginsplug
call plug#begin('~/.local/share/nvim/plugged')


Plug 'sheerun/vim-polyglot' " soporte de sintaxis para muchos lenguajes
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " resaltado y análisis sintáctico lenguajes
Plug 'nvim-lua/plenary.nvim' " utilidades compartidas para plugins Lua

"search tool
Plug 'nvim-telescope/telescope-fzy-native.nvim' " búsqueda difusa rápida
Plug 'nvim-telescope/telescope.nvim' " buscador de archivos, texto y comandos
Plug 'nvim-telescope/telescope-file-browser.nvim' " explorador de archivos para Telescope
Plug 'nvim-telescope/telescope-dap.nvim' " integración de Telescope con DAP
Plug 'xiyaowong/telescope-emoji' " buscador e inserción de emojis
"
"window maximizer
Plug 'declancm/maximize.nvim' " maximiza y restaura ventanas

"move on windows
Plug 'christoomey/vim-tmux-navigator' " navegación entre Neovim y paneles de Tmux

"file explorer
Plug 'nvim-tree/nvim-web-devicons' " iconos para archivos y plugins
Plug 'nvim-tree/nvim-tree.lua' " explorador de archivos

"tabs on a pane, emulate normal panes on a guide"
Plug 'akinsho/bufferline.nvim' " pestañas y buffers en la parte superior

"lua-line
Plug 'nvim-lualine/lualine.nvim' " barra de estado configurable

"harpoon para moverme entre archivos
Plug 'ThePrimeagen/harpoon' " acceso rápido a archivos frecuentes (sin configurar aun)

"indentation
Plug 'Yggdroot/indentLine' " guías visuales de indentación

"autopairs
Plug 'windwp/nvim-autopairs' " cierre automático de pares
Plug 'windwp/nvim-ts-autotag' " cierre automático de etiquetas HTML

"replace with register
Plug 'vim-scripts/ReplaceWithRegister' " reemplaza texto usando un registro

"comment code. not used for docstring o documentation info (see neogen)
Plug 'numToStr/Comment.nvim' " comenta y descomenta código

"git blame (show line modifications)
Plug 'f-person/git-blame.nvim' " muestra quién modificó cada línea
Plug 'dinhhuy258/git.nvim' " comandos Git dentro de Neovim
Plug 'lewis6991/gitsigns.nvim' " signos y acciones Git junto a las líneas
"git select on conflict
Plug 'akinsho/git-conflict.nvim' " navegación y resolución de conflictos Git


"server configuration (collection of LSP configs)
Plug 'neovim/nvim-lspconfig' " configuraciones para servidores LSP
"only java
Plug 'mfussenegger/nvim-jdtls' " integración LSP para Java

"annotations tool
Plug 'danymat/neogen' " genera documentación y anotaciones


"lsp formatting and linter
Plug 'jose-elias-alvarez/null-ls.nvim' " integra formateadores y linters como LSP
"auto-completition
Plug 'hrsh7th/nvim-cmp' " motor principal de autocompletado
Plug 'hrsh7th/cmp-buffer' " completado desde buffers abiertos
Plug 'hrsh7th/cmp-path' " completado de rutas
Plug 'hrsh7th/cmp-nvim-lsp' " completado proporcionado por LSP
Plug 'hrsh7th/cmp-cmdline' " completado de comandos
Plug 'rcarriga/cmp-dap' " completado en la consola DAP
Plug 'PhilRunninger/cmp-rpncalc' " cálculos con notación RPN
Plug 'hrsh7th/cmp-calc' " cálculos en el menú de completado
Plug 'uga-rosa/cmp-dictionary' " completado desde diccionarios
Plug 'jcha0713/cmp-tw2css' " clases de Tailwind CSS
Plug 'hrsh7th/nvim-cmp' " motor de autocompletado (declaración repetida)
Plug 'garyhurtz/cmp_bulma.nvim' " clases del framework Bulma

" Colors for hex, rgb, etc
Plug 'catgoose/nvim-colorizer.lua' " previsualiza colores hex y RGB

"snippets
Plug 'L3MON4D3/LuaSnip' " motor de snippets
Plug 'saadparwaiz1/cmp_luasnip' " fuente de snippets para nvim-cmp
Plug 'rafamadriz/friendly-snippets' " colección de snippets por lenguaje
Plug 'notomo/cmp-neosnippet' " integración de neosnippet con nvim-cmp

"vscode-like pictograms por cmp menu
Plug 'onsails/lspkind.nvim' " iconos para elementos de LSP y completado


"debugging
Plug 'mfussenegger/nvim-dap' " depuración mediante DAP
"debugging ui
Plug 'rcarriga/nvim-dap-ui' " interfaz visual para DAP
Plug 'nvim-neotest/nvim-nio' " utilidades asíncronas para DAP UI

"implementation of debugpy DAP
Plug 'mfussenegger/nvim-dap-python' " adaptador DAP para Python

" adaptadores
" Plug 'mxsdev/nvim-dap-vscode-js'
" problems must be set manually on plugings file
", {'do': 'npm install --legacy-peer-deps && npx gulp vsDebugServerBundle && mv dist out'} " manuall configuration https://github.com/mxsdev/nvim-dap-vscode-js
" for typescript
Plug 'sigmasd/deno-nvim' " integración de Deno con Neovim

"investigar
Plug 'vim-python/python-syntax' " resaltado de sintaxis para Python

"sesiones
" Plug 'tpope/vim-obsession'

" Copilot
Plug 'github/copilot.vim' " sugerencias de código con GitHub Copilot

" Mason para LSP y DAP
Plug 'williamboman/mason.nvim' " instala herramientas externas para Neovim


" colorscheme
Plug 'bluz71/vim-nightfly-colors' " tema Nightfly
Plug 'joshdick/onedark.vim' " tema OneDark
Plug 'dracula/vim', { 'as': 'dracula' } " tema Dracula

Plug 'startup-nvim/startup.nvim' " pantalla de inicio personalizada

call plug#end()
