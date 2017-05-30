set nocompatible

set number

set ruler

set visualbell

set encoding=utf-8

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
autocmd FileType python setlocal shiftwidth=4 tabstop=4
autocmd FileType cs setlocal shiftwidth=4 tabstop=4

set mouse=a
set backspace=indent,eol,start

nnoremap j gj
nnoremap k gk

set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch

set directory=~/.vim/swap_files//
set undofile
set undodir=~/.vim/undo_files//
set backupdir=~/.vim/backup_files//

syntax on
set t_Co=256
set background=dark

filetype plugin indent on
