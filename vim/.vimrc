execute pathogen#infect()

set nocompatible

filetype plugin indent on
syntax enable
set background=dark
set t_Co=256
let base16colorspace=256
colorscheme base16-monokai

set incsearch
set hlsearch
set number
set showmatch
set scrolloff=5
set mouse=a

set laststatus=2
set ruler
set showcmd
set wildmenu

set backspace=indent,eol,start
set autoindent
set cindent
set expandtab
set smarttab
set shiftround
set shiftwidth=2
set softtabstop=2

set rtp+=~/.fzf
nnoremap <C-P> :FZF<CR>
