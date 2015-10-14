set number cindent smartindent showcmd tabstop=8 shiftwidth=8 autoread
set ff=unix background=dark t_Co=256 cursorline nohlsearch
set lazyredraw nocompatible autowrite
set backupdir=$HOME/.vim/backup
set directory=$HOME/.vim/backup
set laststatus=2
set wildignore=*.o,*~

let g:airline_powerline_fonts = 1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_cpp_compiler_options = ' -std=c++11'
filetype off

if isdirectory("/home/alexandru/.vim/bundle/Vundle.vim")
	set rtp+=~/.vim/bundle/Vundle.vim
	call vundle#begin()
	Plugin 'gmarik/Vundle.vim'
	Plugin 'bling/vim-airline'
	call vundle#end() 
endif


syntax enable
colorscheme desert

filetype plugin on
filetype indent on
highlight ColorColumn ctermbg=Black guibg=#2c2d27

let &colorcolumn=join(range(81,999),",")
let mapleader = "\<space>"

nnoremap ; :
nnoremap : ;
inoremap <C-c> <ESC>

nnoremap <leader>w :w<cr>
nnoremap <leader>q :q<cr>
nnoremap <leader>] :bnext<cr>
nnoremap <leader>[ :bprevious<cr>

autocmd FocusLost * silent! wa
