" Revised 2017-04-17_21:48:24

" Source for this setup:
" http://erikzaadi.com/2012/03/19/auto-installing-vundle-from-your-vimrc/

let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme) 
  echo "Installing Vundle.."
  echo ""
  silent !mkdir -p ~/.vim/bundle
  silent !git clone https://github.com/VundleVim/Vundle.vim ~/.vim/bundle/Vundle.vim
  let iCanHazVundle=0
endif

set nocompatible                " break away from old vi compatibility

filetype on
syntax on

set background=dark
set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp
set clipboard=unnamed
set encoding=utf-8
set expandtab
set hidden              " Hide buffers when they are abandoned
set incsearch           " Incremental search
set list
set listchars=tab:>-
set nocompatible
set noerrorbells
set nu
set ruler
set report=0
set shiftwidth=2
set showcmd             " Show (partial) command in status line
set softtabstop=2
set tabstop=2
set t_vb=
set viminfo=            " don't use or save viminfo files
set visualbell


set ignorecase          " Do case insensitive matching
set smartcase           " Do smart case matching

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
" Plugin 'alessandroyorba/sidonia' -- no longer available

" All of your Plugins must be added before the following line

if iCanHazVundle == 0
  echo "... Installing Vundles, please ignore key map error messages"  
  echo ""
  :PluginInstall
  :q
endif

call vundle#end()               " required
filetype plugin indent on       " required
" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding via spacebar
nnoremap <space> za

au BufNewFile,BufRead *.py
  \ set tabstop=3 |
  \ set softtabstop=3 |
  \ set shiftwidth=3 |
  \ set textwidth=79 |
  \ set expandtab |
  \ set autoindent |
  \ set fileformat=unix |
  \ match BadWhitespace /^\t\+/ |
  \ match BadWhitespace /^\s\+$/ |
  \ let python_highlight_all=1

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

au BufWritePre * :%s/\s+$//e

" Highlight text whose length is over 100 columns
set colorcolumn=100
highlight ColorColumn ctermbg=darkred guibg=#330000
highlight OverLength ctermbg=17 ctermfg=white guibg=#592929
match OverLength /\%99v.\+/

nore ; :
nore , ;

map cc :.,$s/^ *//<CR>

noremap <silent> ,cc:<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader, '\/')<CR>/<CR>:nohlsearch<CR>
noremap <silent> ,cu:<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader, '\/')<CR>//e<CR>:nohlsearch<CR>

autocmd! GUIEnter * set vb t_vb=
