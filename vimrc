" johns vimrc
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
filetype off

" vim-plug
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

Plug 'altercation/solarized'
Plug 'altercation/vim-colors-solarized'
Plug 'http://github.com/sjl/vitality.vim'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-airline/vim-airline'
Plug 'junegunn/seoul256.vim'

call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" USING PLUG COMMANDS
" PlugInstall [name ...] [#threads]"""""Install plugins
" PlugUpdate [name ...] [#threads]""""""Install or update plugins
" PlugClean[!]""""""""""""""""""""""""""Remove unused directories (bang version will clean without prompt)
" PlugUpgrade"""""""""""""""""""""""""""Upgrade vim-plug itself
" PlugStatus""""""""""""""""""""""""""""Check the status of plugins
" PlugDiff""""""""""""""""""""""""""""""Examine changes from the previous update and the pending changes
" PlugSnapshot[!] [output path]"""""""""Generate script for restoring the current snapshot of the plugins

" TO ADD PLUG " https://github.com/junegunn/vim-plug/wiki/tutorial
" Add Plug to above list
" Save buffer
" source %
" PlugInstall
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

filetype plugin indent on
syntax enable

set background=dark
colorscheme solarized

let g:solarized_contrast="high"
let g:solarized_visability="low"

let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ }

"set list          " show nonprinting chars (set with listchars)
"set listchars=eol:¬,extends:»,tab:▸\ ,trail:›

map <space> :noh<cr>

noremap ; :

" SPLITS
set splitbelow
set splitright

" TOGGLE SPLITS
nmap <Tab> <C-w>w

set laststatus=2
set noshowmode

set t_Co=256
set encoding=utf-8
set ttimeoutlen=50

set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch

set nobackup       "no backup files
set nowritebackup  "only in case you don't want a backup file while editing
set noswapfile     "no swap files

"set foldcolumn=1   " Add a bit extra margin to the left

" SMOOTH SCROLL SETUP
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>

set rnu

" Relative or absolute number lines
function! NumberToggle()
    if(&nu == 1)
        set nu!
        set rnu
    else
        set nornu
        set nu
    endif
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" FUNCTION KEYS -- http://vim.wikia.com/wiki/Alternative_tab_navigation
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap     		<F1>  :help
nnoremap       <silent> <F2>  :sp $MYVIMRC   	<cr>
nnoremap       <silent> <F3>  :sp ~/.vimbook   	<cr>
nnoremap       <silent> <F4>  :set paste!    	<cr>
" nnoremap       <silent> <F5>  :set number!   	<cr>
" nnoremap       <silent> <F5>  :exec &nu==&rnu? "se nu!" : "se rnu!"<cr>
nnoremap       <silent> <F5>  :call NumberToggle()	<cr>
nnoremap       <silent> <F6>  :sp new           	<cr>
nnoremap       <silent> <F7>  :vs new 	        	<cr>
nnoremap       <silent> <F8>  :res +5        		<cr>
nnoremap       <silent> <F9>  :res -5        		<cr>
nnoremap       <silent> <F10> :w!            		<cr>
nnoremap       <silent> <F11> :q!            		<cr>


" nnoremap       <silent> <F5>  :set number!   	<cr>
" nnoremap       <silent> <F5>  :exec &nu==&rnu? "se nu!" : "se rnu!"<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ABBREVIATIONS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
iabbrev #d Description:
iabbrev #b . $HOME/Dropbox/bin/library.sh
iabbrev #c initializeANSI
iab d6 <c-r>=strftime("%d/%m/%y")<cr>
iab dt <c-r>=strftime("# %A, %e %B %Y %T")<cr>
iab dtt <c-r>=strftime("%A, %e %B %Y %T")<cr>
iab je John Eley
iab l1 ##################################################################
iab l2 #-----------------------------------------------------------------
iab l3 #=================================================================
iab la """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
iab lc /*---------------------------------------------------------------*/

iab ins #include <stdio.h>
iab inc #include <cs50.h>
iab df #define
iab _sh #!/bin/bash<CR>. $HOME/Dropbox/bin/library.sh<CR>initializeANSI<CR>

" autocommands
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Setting to automatically remove trailing whitespace when saving a file
" This works for all files (for individual extensions use *.sh,*.py etc)
autocmd BufWritePre * :%s/\s\+$//e


" Whenever you save .vimrc, it will be automatically sourced by vim.
autocmd! bufwritepost .vimrc nested source %
autocmd BufNewFile,BufRead *.vm,*.html,*.htm,*.shtml,*.stm set ft=velocity
autocmd BufNewFile,BufRead *.ino setf arduino       "Bind syntax definition to .pde files:
autocmd BufWritePre * :%s/\s\+$//e                  "Remove whitespace before saving file

highlight Comment ctermfg=DarkGrey                  "Make comments light blue


" If any files share the below extension they will be made executable.
function! FileExecutable (fname)
  execute "silent! ! test -x" a:fname
  return v:shell_error
endfunction
autocmd BufWritePost *.sh,*.pl,*.cgi,*.py if FileExecutable("%:p") | :!chmod a+x % ^@ endif

" SKELETON FILES
" http://www.thegeekstuff.com/2008/12/vi-and-vim-autocommand-3-steps-to-add-custom-header-to-your-file/
augroup skeletongroup
    autocmd!
    autocmd bufnewfile *.sh so $HOME/Dotfiles/vim/templates/skeleton.sh
    autocmd bufnewfile *.sh exe "1," . 8 . "g/File Name:.*/s//File Name: " .expand("%")
    autocmd bufnewfile *.sh exe "1," . 8 . "g/Creation Date:.*/s//Creation Date: " .strftime("%d-%m-%Y")
    autocmd Bufwritepre,filewritepre *.sh exe "1," . 8 . "g/Last Modified:.*/s/Last Modified:.*/Last Modified: " .strftime("%c")
augroup END


" how many lines of history VIM remembers
set history=700

" let g:airline#extensions#tabline#enabled = 2
" let g:airline#extensions#tabline#fnamemod = ':t'
" let g:airline#extensions#tabline#left_sep = ' '
" let g:airline#extensions#tabline#left_alt_sep = '|'
" let g:airline#extensions#tabline#right_sep = ' '
" let g:airline#extensions#tabline#right_alt_sep = '|'
" let g:airline_left_sep = ' '
" let g:airline_left_alt_sep = '|'
" let g:airline_right_sep = ' '
" let g:airline_right_alt_sep = '|'
" let g:airline_theme= 'solarized'
"
" air-line
let g:airline_powerline_fonts = 1

" if !exists('g:airline_symbols')
"     let g:airline_symbols = {}
" endif

" unicode symbols
" let g:airline_left_sep = '»'
" let g:airline_left_sep = '▶'
" let g:airline_right_sep = '«'
" let g:airline_right_sep = '◀'
" let g:airline_symbols.linenr = '␊'
" let g:airline_symbols.linenr = '␤'
" let g:airline_symbols.linenr = '¶'
" let g:airline_symbols.branch = '⎇'
" let g:airline_symbols.paste = 'ρ'
" let g:airline_symbols.paste = 'Þ'
" let g:airline_symbols.paste = '∥'
" let g:airline_symbols.whitespace = 'Ξ'
"
" " airline symbols
" let g:airline_left_sep = ''
" let g:airline_left_alt_sep = ''
" let g:airline_right_sep = ''
" let g:airline_right_alt_sep = ''
" let g:airline_symbols.branch = ''
" let g:airline_symbols.readonly = ''
" let g:airline_symbols.linenr = ''


