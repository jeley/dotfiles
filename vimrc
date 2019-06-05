"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"    " Johns vimrc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"    set nocompatible               			" be iMproved, required
"    
"    "   call plug#begin('~/.vim/plugged')
"    "
"    "   Plug 'itchyny/lightline.vim'
"    "   Plug 'altercation/solarized'
"    "   Plug 'altercation/vim-colors-solarized'
"    "   Plug 'http://github.com/sjl/vitality.vim'
"    "   Plug 'terryma/vim-smooth-scroll'
"    "
"    "   call plug#end()
"    "
"    "   """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"    "   " PLUG COMMANDS
"    "   " PlugInstall [name ...] [#threads]	Install plugins
"    "   " PlugUpdate [name ...] [#threads]	Install or update plugins
"    "   " PlugClean[!]	Remove unused directories (bang version will clean without prompt)
"    "   " PlugUpgrade	Upgrade vim-plug itself
"    "   " PlugStatus	Check the status of plugins
"    "   " PlugDiff	Examine changes from the previous update and the pending changes
"    "   " PlugSnapshot[!] [output path]	Generate script for restoring the current snapshot of the plugins
"    "   """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"    "
"    syntax enable
"    "   set background=dark
"    "
"    "   let g:solarized_contrast="high"
"    "   let g:solarized_visability="low"
"    "
"    "   colorscheme solarized
"    "
"    "   let g:lightline = {
"    "         \ 'colorscheme': 'solarized',
"    "         \ }
"    
"    "set list          " show nonprinting chars (set with listchars)
"    "set listchars=eol:¬,extends:»,tab:▸\ ,trail:›
"    
"    map <space> :noh<cr>
"    
"    
"    " SPLITS
"    set splitbelow
"    set splitright
"    
"    " TOGGLE SPLITS
"    nmap <Tab> <C-w>w
"    
"    set laststatus=2
"    set noshowmode
"    
"    set hlsearch
"    set incsearch
"    set ignorecase
"    set smartcase
"    set showmatch
"    
"    set nobackup       "no backup files
"    set nowritebackup  "only in case you don't want a backup file while editing
"    set noswapfile     "no swap files
"    
"    set relativenumber
"    
"    "set foldcolumn=1   " Add a bit extra margin to the left
"    
"    " SMOOTH SCROLL SETUP
"    noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
"    noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
"    noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
"    noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>
"    
"    noremap ; :
"    
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
"    
"    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"    " FUNCTION KEYS -- http://vim.wikia.com/wiki/Alternative_tab_navigation
"    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"    nnoremap     		<F1>  :help
"    nnoremap       <silent> <F2>  :sp $MYVIMRC   	<cr>
"    nnoremap       <silent> <F3>  :sp ~/.vimbook   	<cr>
"    nnoremap       <silent> <F4>  :set paste!    	<cr>
"    nnoremap       <silent> <F5>  :call NumberToggle()	<cr>
"    nnoremap       <silent> <F6>  :sp new           	<cr>
"    nnoremap       <silent> <F7>  :vs new 	        	<cr>
"    nnoremap       <silent> <F8>  :res +5        		<cr>
"    nnoremap       <silent> <F9>  :res -5        		<cr>
"    nnoremap       <silent> <F10> :w!            		<cr>
"    nnoremap       <silent> <F11> :q!            		<cr>
"    
"    
"    " nnoremap       <silent> <F5>  :set number!   	<cr>
"    " nnoremap       <silent> <F5>  :exec &nu==&rnu? "se nu!" : "se rnu!"<cr>
"    
"    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"    " ABBREVIATIONS
"    """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"    iabbrev #d Description:
"    iabbrev #b . $HOME/Dropbox/bin/library.sh
"    iabbrev #c initializeANSI
"    iab d6 <c-r>=strftime("%d/%m/%y")<cr>
"    iab dt <c-r>=strftime("# %A, %e %B %Y %T")<cr>
"    iab dtt <c-r>=strftime("%A, %e %B %Y %T")<cr>
"    iab je John Eley
"    iab l1 ##################################################################
"    iab l2 #-----------------------------------------------------------------
"    iab l3 #=================================================================
"    iab la """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"    iab lc /*---------------------------------------------------------------*/
"    
"    iab ins #include <stdio.h>
"    iab inc #include <cs50.h>
"    iab df #define
"    iab _sh #!/bin/bash<CR>. $HOME/Dropbox/bin/library.sh<CR>initializeANSI<CR>
"    
"    " ----------------------------------------------------------------------------
"    " AUTOCOMMANDS
"    " ----------------------------------------------------------------------------
"    " Setting to automatically remove trailing whitespace when saving a file
"    " This works for all files (for individual extensions use *.sh,*.py etc)
"    autocmd BufWritePre * :%s/\s\+$//e
"    
"    
"    " Whenever you save .vimrc, it will be automatically sourced by vim.
"    autocmd! bufwritepost .vimrc nested source %
"    autocmd BufNewFile,BufRead *.vm,*.html,*.htm,*.shtml,*.stm set ft=velocity
"    autocmd BufNewFile,BufRead *.ino setf arduino       "Bind syntax definition to .pde files:
"    autocmd BufWritePre * :%s/\s\+$//e                  "Remove whitespace before saving file
"    highlight Comment ctermfg=DarkGrey                  "Make comments light blue
"    set viminfo='10,\"100,:20,%,n$HOME/.viminfo         "Restore cursor to file position
"    "autocmd BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif
"    
"    " If any files share the below extension they will be made executable.
"    function! FileExecutable (fname)
"      execute "silent! ! test -x" a:fname
"      return v:shell_error
"    endfunction
"    autocmd BufWritePost *.sh,*.pl,*.cgi,*.py if FileExecutable("%:p") | :!chmod a+x % ^@ endif
"    
"    " SKELETON FILES
"    " http://www.thegeekstuff.com/2008/12/vi-and-vim-autocommand-3-steps-to-add-custom-header-to-your-file/
"    augroup skeletongroup
"        autocmd!
"        autocmd bufnewfile *.sh so $HOME/Dotfiles/vim/templates/skeleton.sh
"        autocmd bufnewfile *.sh exe "1," . 8 . "g/File Name:.*/s//File Name: " .expand("%")
"        autocmd bufnewfile *.sh exe "1," . 8 . "g/Creation Date:.*/s//Creation Date: " .strftime("%d-%m-%Y")
"        autocmd Bufwritepre,filewritepre *.sh exe "1," . 8 . "g/Last Modified:.*/s/Last Modified:.*/Last Modified: " .strftime("%c")
"    augroup END
"    
"    
ets how many lines of history VIM has to remember
set history=700

" Enable filetype plugins
" filetype plugin on
" filetype indent on
" syntax on
"
" " Set to auto read when a file is changed from the outside
" set autoread
"
" " With a map leader it's possible to do extra key combinations
" let mapleader = ","
"
" " Fast saving
" " nmap <leader>w :w!<cr>
"
" " Toggle Paster Mode
" set pastetoggle=<F4>
"
"
" set nohlsearch
"
" set number
" set relativenumber
"
" " => VIM user interface
" " """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " Set 7 lines to the cursor - when moving vertically using j/k
" set so=7
"
" " Turn on the WiLd menu
" set wildmenu
"
" " Ignore compiled files
" set wildignore=*.o,*~,*.pyc
"
" "Always show current position
" set ruler
"
" " Height of the command bar
" set cmdheight=2
"
" " A buffer becomes hidden when it is abandoned
" set hid
"
" " Configure backspace so it acts as it should act
" set backspace=eol,start,indent
" set whichwrap+=<,>,h,l
"
" " Ignore case when searching
" set ignorecase
"
" " When searching try to be smart about cases 
" set smartcase
"
" " Highlight search results
" set hlsearch
"
" " Makes search act like search in modern browsers
" set incsearch
"
" " Don't redraw while executing macros (good performance config)
" set lazyredraw
"
" " For regular expressions turn magic on
" set magic
"
" " Show matching brackets when text indicator is over them
" set showmatch
" " How many tenths of a second to blink when matching brackets
" set mat=2
"
" " No annoying sound on errors
" set noerrorbells
" set novisualbell
" set t_vb=
" set tm=500
"
" call plug#begin('~/.config/nvim/plugged')
"
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
"
" call plug#end()
"
" " PlugInstall [name ...] [#threads]	Install plugins
" " PlugUpdate [name ...] [#threads]	Install or update plugins
" " PlugClean[!]				Remove unused directories
" (bang version will clean without prompt)
" " PlugUpgrade				Upgrade vim-plug itself
" " PlugStatus				Check the status of plugins
" " PlugDiff				Examine changes from the previous
" update and the pending changes
" " PlugSnapshot[!] [output path]		Generate script for restoring
" the current snapshot of the plugins
"
"
" " set background=dark
" " colorscheme kalisi
" " syntax on
" " " Set utf8 as standard encoding and en_US as the standard language
" " set encoding=utf8
" "
" "
" let g:airline_theme = 'solarized'
" "
" "
" "
" "
" "
" "
" " " Use Unix as the standard file type
" " set ffs=unix,dos,mac
" " """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " " => Files, backups and undo
" " """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " " Turn backup off
" set nobackup
" set nowb
" set noswapfile
" " """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " " => Text, tab and indent related
" " """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " " Use spaces instead of tabs
" " " set expandtab
" "
" " " Be smart when using tabs ;)
" " set smarttab
" "
" " " 1 tab == 2 spaces
" " set tabstop=2 shiftwidth=2 expandtab
" "
" " " Linebreak on 500 characters
" " set lbr
" " set tw=500
" "
" " set ai "Auto indent
" " set si "Smart indent
" " set wrap "Wrap lines
" "
" "
" " """"""""""""""""""""""""""""""
" " " => Visual mode related
" " """"""""""""""""""""""""""""""
" " " Visual mode pressing * or # searches for the current selection
" " " Super useful! From an idea by Michael Naumann
" " vnoremap <silent> * :call VisualSelection('f')<CR>
" " vnoremap <silent> # :call VisualSelection('b')<CR>
" "
" "
" " """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " " => Moving around, tabs, windows and buffers
" " """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " " Treat long lines as break lines (useful when moving around in them)
" " map j gj
" " map k gk
" "
" " " Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
" " map <space> /
" " map <c-space> ?
" "
" " " Disable highlight when <leader><cr> is pressed
" " " map <silent> <leader><cr> :noh<cr>
" " nnoremap <F3> :noh<return><F3>
" "
" " " Smart way to move between windows
" " map <C-j> <C-W>j
" " map <C-k> <C-W>k
" " map <C-h> <C-W>h
" " map <C-l> <C-W>l
" "
" " " Close the current buffer
" " map <leader>bd :Bclose<cr>
" "
" " " Close all the buffers
" " map <leader>ba :1,1000 bd!<cr>
" "
" " " Useful mappings for managing tabs
" " map <leader>tn :tabnew<cr>
" " map <leader>to :tabonly<cr>
" " map <leader>tc :tabclose<cr>
" " map <leader>tm :tabmove
" "
" " " Opens a new tab with the current buffer's path
" " " Super useful when editing files in the same directory
" " map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/
" "
" " " Switch CWD to the directory of the open buffer
" " map <leader>cd :cd %:p:h<cr>:pwd<cr>
" "
" " " Specify the behavior when switching between buffers 
" " try
" "   set switchbuf=useopen,usetab,newtab
" "     set stal=2
" "     catch
" "     endtry
" "
" "     " Return to last edit position when opening files (You want this!)
" "     autocmd BufReadPost *
" "          \ if line("'\"") > 0 && line("'\"") <= line("$") |
" "     \   exe "normal! g`\"" |
" "     \ endif
" " Remember info about open buffers on close
" " set viminfo^=%
" "
" "
" " """"""""""""""""""""""""""""""
" " " => Status line
" " """"""""""""""""""""""""""""""
" " Always show the status line
" set laststatus=2
"
" " Format the status line
" " set statusline=\ %{HasPaste}()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \
" set statusline=\ %F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \
"
" " Map colon
" map ; :
"
"
" " """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " " => Editing mappings
" " """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " " Remap VIM 0 to first non-blank character
" " map 0 ^
" "
" " " Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
" " nmap <M-j> mz:m+<cr>`z
" " nmap <M-k> mz:m-2<cr>`z
" " vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
" " vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z
" "
" " if has("mac") || has("macunix")
" "   nmap <D-j> <M-j>
" "     nmap <D-k> <M-k>
" "       vmap <D-j> <M-j>
" "         vmap <D-k> <M-k>
" "         endif
" "
" "         " Delete trailing white space on save, useful for Python and
" "         CoffeeScript ;)
" "         func! DeleteTrailingWS()
" "           exe "normal mz"
" "             %s/\s\+$//ge
" "               exe "normal `z"
" "               endfunc
" "               autocmd BufWrite *.py :call DeleteTrailingWS()
" "               autocmd BufWrite *.coffee :call DeleteTrailingWS()
" "
" "
"   """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vimgrep searching and cope displaying
" " """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " " When you press gv you vimgrep after the selected text
" " vnoremap <silent> gv :call VisualSelection('gv')<CR>
" "
" " " Open vimgrep and put the cursor in the right position
" " map <leader>g :vimgrep // **/*.<left><left><left><left><left><left><left>
" "
" " " Vimgreps in the current file
" " map <leader><space> :vimgrep //
" " <C-R>%<C-A><right><right><right><right><right><right><right><right><right>
" "
" " " When you press <leader>r you can search and replace the selected text
" " vnoremap <silent> <leader>r :call VisualSelection('replace')<CR>
" "
" " " Do :help cope if you are unsure what cope is. It's super useful!
" " "
" " " When you search with vimgrep, display your results in cope by doing:
" " "   <leader>cc
" " "
" " " To go to the next search result do:
" " "   <leader>n
" " "
" " " To go to the previous search results do:
" " "   <leader>p
" " "
" " map <leader>cc :botright cope<cr>
" " map <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg
" " map <leader>n :cn<cr>
" " map <leader>p :cp<cr>
" "
" "
" " """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " " => Spell checking
" " """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " " Pressing ,ss will toggle and untoggle spell checking
" " map <leader>ss :setlocal spell!<cr>
" "
" " " Shortcuts using <leader>
" " map <leader>sn ]s
" " map <leader>sp [s
" " map <leader>sa zg
" " map <leader>s? z=
" "
" " let g:NERDSpaceDelims = 1
" "
" " """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " " => Misc
" " """""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" " " Remove the Windows ^M - when the encodings gets messed up
" " noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm
" "
" " map <C-f> :FZF<CR>
" "
" " command! -nargs=+ Jsf execute 'silent lgrep! -rnw
" " --exclude-dir={node_modules,dist,bower_components} --includ=*.{js,jsx}
" "  <args> ./' | lopen 30
" "  command! -nargs=+ Js execute 'new | r ! grep -rnw -h
" "  --exclude-dir={node_modules,dist,bower_components} --includ=*.{js,jsx}
" "  <args> ./'
" "  command! -nargs=+ Less execute 'silent lgrep! -rnw
" "  --exclude-dir={node_modules,dist,bower_components} --includ=*.{less,css}
" "  <args> ./' | lopen 30
" "
" "  inoremap {<cr> {<cr>}<c-o>O
" "  inoremap [<cr> [<cr>]<c-o>O
" "  inoremap (<cr> (<cr>)<c-o>O
" "
" "  nnoremap fj 15j
" "  nnoremap fk 15k
" "  " Delete All but current buffer
" "  nnoremap dbb :BufOnly<CR>
" "  nnoremap dsp :on<CR>
" "  nnoremap <Leader>lc :lclose<CR>:cclose<CR>
" "
" "  tnoremap <Esc> <C-\><C-n>
" "
" "  autocmd FileType javascript set formatprg=prettier\ --stdin
" "  autocmd FileType rust set formatprg=rustfmt
" "  autocmd FileType vue set formatprg=prettier\ --stdin
" "  autocmd FileType css set formatprg=postcss\ --no-map\ -u\
" postcss-prettify
" "
" "
" "
" "
"
