local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

-- Extensions
Plug('https://github.com/vim-airline/vim-airline')
Plug('https://github.com/preservim/nerdtree')
Plug('https://github.com/tc50cal/vim-terminal')
Plug('https://github.com/scrooloose/syntastic')
Plug('https://github.com/def-lkb/merlin')
Plug('https://github.com/jpalardy/vim-slime')
Plug('https://github.com/OCamlPro/ocp-indent')
Plug('https://github.com/nvim-lualine/lualine.nvim')
Plug('nvim-tree/nvim-web-devicons')

-- Languages
Plug('https://github.com/ocaml/vim-ocaml')
Plug('https://github.com/neovim/pynvim')

-- LSP
Plug('https://github.com/williamboman/mason.nvim')
Plug('https://github.com/williamboman/mason-lspconfig.nvim')
Plug('https://github.com/neovim/nvim-lspconfig')
Plug('https://github.com/VonHeikemen/lsp-zero.nvim')
Plug('https://github.com/nvim-treesitter/nvim-treesitter')

-- Autocomplete
Plug('https://github.com/L3MON4D3/LuaSnip')
Plug('hrsh7th/nvim-cmp')
Plug('hrsh7th/cmp-nvim-lsp')

-- Themes
Plug('https://github.com/Sly-Harvey/radium.nvim')
Plug('https://github.com/Tsuzat/NeoSolarized.nvim')
Plug('https://github.com/elliothatch/burgundy.vim')
Plug('https://github.com/nyoom-engineering/oxocarbon.nvim')
Plug('https://github.com/maxmx03/fluoromachine.nvim')
Plug('https://github.com/srcery-colors/srcery-vim')
Plug('https://github.com/cseelus/vim-colors-lucid')
Plug('https://github.com/ray-x/aurora')
Plug('https://github.com/lissatransborda/dalton-vim')
Plug('https://github.com/jdsimcoe/hyper.vim')
Plug('https://github.com/caiocutrim/black-coffee-molokai')
Plug('https://github.com/safv12/andromeda.vim')
Plug('https://github.com/cesardeazevedo/Fx-ColorScheme')
Plug('daltonmenezes/aura-theme', { rtp = 'packages/neovim' })
Plug('https://github.com/navarasu/onedark.nvim')
Plug('https://github.com/eskilop/NorthernLights.vim')
Plug('https://github.com/polirritmico/monokai-nightasty.nvim')

vim.call('plug#end')
