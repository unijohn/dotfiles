set nocompatible                " break away from old vi compatibility
filetype off

set encoding=utf-8
set nu
set clipboard=unnamed

set softtabstop=2
set shiftwidth=2
set tabstop=2
set expandtab

highlight BadWhitespace ctermbg=red guibg=red
set hlsearch

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let VUndle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'pangloss/vim-javascript'
Plugin 'indenthtml.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'alessandroyorba/sidonia'

" All of your Plugins must be added before the following line
call vundle#end()               " required
filetype plugin indent on       " required
" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding via spacebar
nnoremap <space> za

au BufNewFile,BufRead *.py
  \ set tabstop=4 |
  \ set softtabstop=4 |
  \ set shiftwidth=4 |
  \ set textwidth=79 |
  \ set expandtab |
  \ set autoindent |
  \ set fileformat=unix |
  \ match BadWhitespace /^\t\+/ |
	\ match BadWhitespace /^\s\+$/ 

au BufNewFile,BufRead *.js
  \ set tabstop=3 |
  \ set softtabstop=3 |
  \ set shiftwidth=3 |
	\ match BadWhitespace /^\t\+/ |
	\ match BadWhitespace /^\s\+$/

au BufNewFile *.js 
  \ set fileformat=unix |
  \ let b:comment_leader = '//'

au BufNewFile,BufRead *.html
  \ set filetype=xml |
  \ set tabstop=3 |
  \ set softtabstop=3 |
  \ set shiftwidth=3 |
  \ match BadWhitespace /^\t\+/ |
	\ match BadWhitespace /^\s\+$/

au BufNewFile *.html
  \ set filetype=unix |
  \ let b:comment_leader = '<!--'

let python_highlight_all=1
syntax on

set viminfo=            " don't use or save viminfo files

"------ Stuff ------"
set background=dark

set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp

set showcmd             " Show (partial) command in status line.
set showmatch           " Show matching brackets.
set ignorecase          " Do case insensitive matching
set smartcase           " Do smart case matching
set incsearch           " Incremental search
set hidden              " Hide buffers when they are abandoned

set noerrorbells
set visualbell
set t_vb=

nore ; :
nore , ;

map cc :.,$s/^ *//<CR>

noremap <silent> ,cc:<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader, '\/')<CR>/<CR>:nohlsearch<CR>
noremap <silent> ,cu:<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader, '\/')<CR>//e<CR>:nohlsearch<CR>
