call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'tpope/vim-commentary'
Plug 'alxyang/a.vim'
Plug 'wincent/terminus'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-notes'
Plug 'mileszs/ack.vim'
Plug 'wincent/vim-clipper'
Plug 'chriskempson/base16-vim'
Plug 'itchyny/lightline.vim'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-sleuth'
Plug 'ntpeters/vim-better-whitespace'
call plug#end()

set nocompatible

filetype plugin indent on
syntax enable
set background=dark
set noshowmode
set t_Co=256
colorscheme elflord
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
  colorscheme base16-monokai
endif

set incsearch
set hlsearch
set number
set showmatch
set scrolloff=5
set mouse=a
set ttymouse=xterm2
if has('mouse_sgr')
  set ttymouse=sgr
endif

set laststatus=2
set ruler
set showcmd
set wildmenu

set backspace=indent,eol,start
set autoindent
set expandtab
set smarttab
set shiftround
set shiftwidth=2
set softtabstop=2

set rtp+=/usr/local/opt/fzf
nnoremap <c-p> :FZF<cr>

autocmd VimResized * wincmd =

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" Save last cursor position in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif

" Highlight all instances of word under cursor, when idle.
" Useful when studying strange source code.
" Type z/ to toggle highlighting on/off.
nnoremap z/ :if AutoHighlightToggle()<Bar>set hls<Bar>endif<CR>
function! AutoHighlightToggle()
  let @/ = ''
  if exists('#auto_highlight')
    au! auto_highlight
    augroup! auto_highlight
      setl updatetime=4000
      echo 'Highlight current word: off'
      return 0
  else
    augroup auto_highlight
      au!
      au CursorHold * let @/ = '\V\<'.escape(expand('<cword>'), '\').'\>'
    augroup end
    setl updatetime=500
    echo 'Highlight current word: ON'
    return 1
  endif
endfunction

" Wrap words, but only break lines when the enter key is pressed
nnoremap <leader>w :call VisualWordWrapToggle()<CR>
function! VisualWordWrapToggle()
  let @/ = ''
  if exists('#visual_word_wrap')
    au! visual_word_wrap
    augroup! visual_word_wrap
      echo 'Visual word wrap: off'
      return 0
    :set nolinebreak
  else
    augroup visual_word_wrap
    augroup end
    :set linebreak
    :set wrap
    :set nolist
    :set wrapmargin=0
    echo 'Visual word wrap: on'
    return 1
  endif
endfunction

" Distraction-free writing
command! ProseMode call ProseMode()
nmap \p :ProseMode<CR>
function! ProseMode()
  call goyo#execute(0, [])
  set spell noci nosi noai nolist noshowmode noshowcmd
  set complete+=s
  set bg=light
endfunction
