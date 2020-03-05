" Don't try to be compatible with vi
set nocompatible

" Helps force plugins to load correctly when it is turned back on below
filetype off

" Install VimPlug if it isn't already
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'scrooloose/nerdcommenter'
Plug 'airblade/vim-gitgutter'

Plug 'w0rp/ale'

Plug 'morhetz/gruvbox'

Plug 'tmux-plugins/vim-tmux-focus-events'

Plug 'tpope/vim-fugitive'

Plug 'sheerun/vim-polyglot'

call plug#end()

syntax on

" For plugins to load correctly
filetype plugin indent on

set number

set ruler

set spell spelllang=en

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
" clear search
map <leader><space> :let @/=''<cr>

" Store swap
if empty(glob('~/.vim/swap_files'))
  silent !mkdir -p ~/.vim/swap_files
endif
set directory=~/.vim/swap_files//

" Store undo files
set undofile
if empty(glob('~/.vim/undo_files'))
  silent !mkdir -p ~/.vim/undo_files
endif
set undodir=~/.vim/undo_files//

" Store backup files
if empty(glob('~/.vim/backup_files'))
  silent !mkdir -p ~/.vim/backup_files
endif
set backupdir=~/.vim/backup_files//

set t_Co=256
set background=dark
colorscheme gruvbox

" Reload file on focus
set autoread
autocmd FocusGained,BufEnter * silent! checktime
" Save when focus is lost
autocmd FocusLost,WinLeave * :silent! w

" Save file as sudo. For protected files.
cmap w!! w !sudo tee > /dev/null %

" Start NERDTree and switch to code pane on start
autocmd VimEnter * NERDTree | wincmd p
" Exit vim if NERDTree is the only open window
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeShowHidden=1
let g:nerdtree_tabs_open_on_console_startup=1

autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescript.jsx

let g:ale_fix_on_save = 1
let g:ale_fixers = {}

let g:ale_fixers['*'] = ['remove_trailing_lines', 'trim_whitespace']

let js_fixer = ['prettier']
let g:ale_fixers['javascript'] = js_fixer
let g:ale_fixers['typescript'] = js_fixer
let g:ale_javascript_prettier_options = '--single-quote --trailing-comma es5'

let g:ale_fixers['python'] = ['black', 'isort']
let g:black_linelength = 80

let g:ale_fixers['java'] = ['google_java_format']

let g:ale_fixers['haskell'] = ['stylish-haskell']

let g:ale_fixers['go'] = ['goimports']

let g:ale_fixers['rust'] = ['rustfmt']

let c_fixer = ['clang-format']
let g:ale_fixers['c'] = c_fixer
let g:ale_fixers['h'] = c_fixer
let g:ale_fixers['cpp'] = c_fixer
let g:ale_fixers['hpp'] = c_fixer
let g:ale_fixers['glsl'] = c_fixer
