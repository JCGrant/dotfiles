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

if empty(glob('~/.vim/swap_files'))
  silent !mkdir -p ~/.vim/swap_files
endif
set directory=~/.vim/swap_files//

set undofile
if empty(glob('~/.vim/undo_files'))
  silent !mkdir -p ~/.vim/undo_files
endif
set undodir=~/.vim/undo_files//

if empty(glob('~/.vim/backup_files'))
  silent !mkdir -p ~/.vim/backup_files
endif
set backupdir=~/.vim/backup_files//

syntax on
set t_Co=256
set background=dark

filetype plugin indent on

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'fatih/vim-go'
Plug 'airblade/vim-gitgutter'
Plug 'w0rp/ale'
Plug 'junegunn/fzf'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'scrooloose/nerdcommenter'
Plug 'morhetz/gruvbox'

call plug#end()

colorscheme gruvbox

autocmd VimEnter * NERDTree | wincmd p
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

if executable('goimports') == 0
  !go get golang.org/x/tools/cmd/goimports
endif
let g:go_fmt_command = "goimports"
