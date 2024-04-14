vim.cmd([[

" Terminal Function
let g:term_buf = 0
let g:term_win = 0

let g:file_win = 2
let g:tree_win = 1

function! TermToggle(height)
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
	echo "switching to tree"
	if win_getid() == win_getid(1)
		wincmd 2 w
		"startinsert!
	else
		wincmd 1 w
		stopi!
	endif
endfunction

]])

filename = vim.fn.expand('%')
filetype = vim.bo.filetype

vim.api.nvim_create_autocmd('BufEnter',  { callback = function()
	filename = vim.fn.expand('%')
	filetype = vim.bo.filetype
	local lang_interpreter = ''
	if filetype == 'python' then
		lang_interpreter = 'python3'
	end
	vim.keymap.set('n', '<f5>', ':call SwitchToTerminal()<CR>'..lang_interpreter..' '..filename..'<CR>'..[[<c-\><c-n>:call SwitchToTerminal()<CR>]])
end })

require('./colours')
vim.cmd('command! LightToggle lua LightToggle()')

-- Toggle terminal on/off (neovim)
vim.keymap.set('n', 't', ':call SwitchToTerminal()<CR>')
vim.keymap.set('i', '<c-t>', '<esc>:call SwitchToTerminal()<CR>')
vim.keymap.set('t', '<c-t>', [[<c-\><c-n>:call SwitchToTerminal()<CR>]])

vim.keymap.set('n', '<c-f>', ':call SwitchToTree()<CR>')
vim.keymap.set('i', '<c-f>', '<esc>:call SwitchToTree()<CR>')
vim.keymap.set('t', '<c-f>', [[<c-\><c-n>:call SwitchToTree()<CR>]])

vim.keymap.set('n', '<c-e>', ':wincmd 2 w<CR>')
vim.keymap.set('i', '<c-e>', '<esc>:wincmd 2 w<CR>')
vim.keymap.set('t', '<c-e>', [[<c-\><c-n>:wincmd 2 w<CR>]])

vim.keymap.set('n', '<c-x>', ':call Close()<CR>')
vim.keymap.set('i', '<c-x>', '<esc>:call Close()<CR>')
vim.keymap.set('t', '<c-x>', [[<c-\><c-n>:call Close()<CR>]])

vim.keymap.set('n', '<c-s>', ':call Save()<CR>')
vim.keymap.set('i', '<c-s>', '<esc>:call Save()<CR>')
vim.keymap.set('t', '<c-s>', [[<c-\><c-n>:call Save()<CR>]])

vim.keymap.set('n', '<c-S-t>', ':call TermToggle(12)<CR>')

vim.keymap.set('i', '<c-h>', '<c-w>')

vim.keymap.set('n', '<c-p>', ':PlugInstall<CR>')

vim.keymap.set('t', '<Esc>', [[<c-\><c-n>:call SwitchToTerminal()<CR>]])
vim.keymap.set('n', '<Esc>', [[:wincmd 2 w<CR>]])

vim.keymap.set('n', '<f5>', ':call SwitchToTerminal()<CR>'.._G.filetype.._G.filename..'<CR>')

vim.keymap.set('n', '<c-l>', ':LightToggle<CR>')
vim.keymap.set('i', '<c-l>', '<Esc>:LightToggle<CR>')

-- Terminal go back to normal mode
-- tnoremap <Esc> <C-\><C-n>
-- tnoremap :q! <C-\><C-n>:q!<CR>

-- TODO
-- tnoremap <C-v> cd getcwd()<CR>

