vim.cmd([[

" Terminal Function
let g:term_buf = 0
let g:term_win = 0

let g:file_win = 2
let g:tree_win = 1

function! TermToggle(height)
    NERDTreeToggle
	if win_gotoid(g:term_win)
        hide
    else
        botright new
        exec "resize " . a:height
        try
            exec "buffer " . g:term_buf
        catch
            call termopen($SHELL, {"detach": 0})
            let g:term_buf = bufnr("")
            set nonumber
            set norelativenumber
            set signcolumn=no
        endtry
        startinsert!
        let g:term_win = win_getid()
    endif
	NERDTreeToggle
	wincmd 2 w
endfunction

function! Close()
	wincmd 2 w
	w
	qa
endfunction

function! Save()
	wincmd 2 w
	w
endfunction

function! SwitchToTerminal()
	if win_getid() == win_getid(3) 
		wincmd 2 w
		"startinsert!
	else
		wincmd 3 w
		startinsert!
	endif
endfunction

function! SwitchToTree()
	if win_getid() == win_getid(1)
		wincmd 2 w
		"startinsert!
	else
		wincmd 1 w
		stopi!
	endif
endfunction

]])


-- =================================================================================================
-- Language-dependant mappings (console execution, comments...)
-- =================================================================================================

filename = vim.fn.expand('%')
filetype = vim.bo.filetype

vim.api.nvim_create_autocmd('BufEnter',  { callback = function()
	filename = vim.fn.expand('%')
	filetype = vim.bo.filetype

	local lang_interpreter = {
		['python'] = 'python3',
	}

	vim.keymap.set('n', '<f5>', ':call SwitchToTerminal()<CR>'..(lang_interpreter[filetype] or '')..' '..filename..'<CR>'..[[<c-\><c-n>:call SwitchToTerminal()<CR>]])

	local comment_line = '================================================================================================='
	local comment = {
		['python'] = [["""<CR><CR>"""<up>]],
		['css'] = [[/*<Space><Space>*/<left><left><left>]],
		['ocaml'] = [[(*<Space><Space>*)<left><left><left>]],
		['lua'] = [[--<Space>]],
	}
	vim.keymap.set('i', '<c-c>', comment[filetype] or '')
	vim.keymap.set('n', 'cc', 'i'..(comment[filetype] or '')..comment_line)
end })

-- Colourscheme light mode toggle
require('./colours')
vim.cmd('command! LightToggle lua LightToggle()')

-- Switch to terminal <t>
vim.keymap.set('n', 't', ':call SwitchToTerminal()<CR>')
vim.keymap.set('i', '<c-t>', '<esc>:call SwitchToTerminal()<CR>')
vim.keymap.set('t', '<c-t>', [[<c-\><c-n>:call SwitchToTerminal()<CR>]])

-- Switch to tree <f>
vim.keymap.set('n', '<c-f>', ':call SwitchToTree()<CR>')
vim.keymap.set('i', '<c-f>', '<esc>:call SwitchToTree()<CR>')
vim.keymap.set('t', '<c-f>', [[<c-\><c-n>:call SwitchToTree()<CR>]])

-- Switch to editor <ctrl-e>
vim.keymap.set('n', '<c-e>', ':wincmd 2 w<CR>')
vim.keymap.set('i', '<c-e>', '<esc>:wincmd 2 w<CR>')
vim.keymap.set('t', '<c-e>', [[<c-\><c-n>:wincmd 2 w<CR>]])

-- Save and Close <ctrl-x>
vim.keymap.set('n', '<c-x>', ':call Close()<CR>')
vim.keymap.set('i', '<c-x>', '<esc>:call Close()<CR>')
vim.keymap.set('t', '<c-x>', [[<c-\><c-n>:call Close()<CR>]])

-- Save <ctrl-s>
vim.keymap.set('n', '<c-s>', ':call Save()<CR>')
vim.keymap.set('i', '<c-s>', '<esc>:call Save()<CR>')
vim.keymap.set('t', '<c-s>', [[<c-\><c-n>:call Save()<CR>]])

-- Toggle terminal buffer <ctrl-shift-t>
vim.keymap.set('n', '<c-T>', ':call TermToggle(12)<CR>')

-- Toggle NerdTree buffer <ctrl-shit-f>
-- vim.keymap.set('n', '<c-F>', ':NERDTreeToggle<CR>')

-- Delete whole word <ctrl-backspace> 
vim.keymap.set('i', '<c-h>', '<c-w>')

-- PlugInstall <ctrl-p>
vim.keymap.set('n', '<c-p>', ':PlugInstall<CR>')

-- Switch to editor <esc>
vim.keymap.set('t', '<Esc>', [[<c-\><c-n>:call SwitchToTerminal()<CR>]])
vim.keymap.set('n', '<Esc>', [[:wincmd 2 w<CR>]])

-- Initialise F5 shortcut
vim.keymap.set('n', '<f5>', ':call SwitchToTerminal()<CR>'.._G.filetype.._G.filename..'<CR>')

-- Light mode toggle <ctrl-l>
vim.keymap.set('n', '<c-l>', ':LightToggle<CR>')
vim.keymap.set('i', '<c-l>', '<Esc>:LightToggle<CR>')

-- Visual select whole word <vv>
vim.keymap.set('n', 'vv', 'viw')

-- Terminal go back to normal mode
-- tnoremap <Esc> <C-\><C-n>
-- tnoremap :q! <C-\><C-n>:q!<CR>

-- TODO
-- tnoremap <C-v> cd getcwd()<CR>

