require('plugins')
require('mappings')
require('lsp.lspconfig')
require('completions')
require('lualine').setup()

vim.cmd.colorscheme('neonplasma')

vim.cmd([[

set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set nofoldenable
set ignorecase
set smartcase
set number
set autoindent
set tabstop=4
set shiftwidth=4
set smarttab
set softtabstop=4
set mouse=a
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {<Space><Space>}<left><left>
" inoremap {<CR> {<CR>}<ESC>O
" inoremap {;<CR> {<CR>};<ESC>O

syntax on
au BufRead,BufNewFile *.ml,*.mli compiler ocaml

set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
let g:Terminal_CloseOnEnd = 1
let g:Terminal_SendFileKey = '<F9>'

let NERDTreeIgnore=['\.pdf$', '\~$']

function! Init()
	call TermToggle(12)
	NERDTreeToggle
	wincmd 2 w
	stopi!
	if empty(bufname("%"))
		call SwitchToTree()
	endif
	set encoding=UTF-8
endfunction

autocmd VimEnter * call Init()

]])
