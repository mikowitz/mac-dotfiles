" always show the status line
set laststatus=2
set noshowmode
set clipboard=unnamed

syntax on
set number
set hidden
set vb
set regexpengine=2

" set leader to comma
let mapleader=","

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase
nnoremap <Leader><space> :noh<CR>

" no backups
set updatecount=0
set nobackup
set nowritebackup

" Whitespace
set nowrap
set tabstop=2
set shiftwidth=2
set softtabstop=2
set smarttab
set expandtab

set cindent
set smartindent
set autoindent
set ai

set backspace=indent,eol,start

call plug#begin('~/.vim/plugged')
Plug 'chriskempson/base16-vim'
Plug 'guns/vim-sexp'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'regedarek/ZoomWin'
Plug 'rking/ag.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-repeat'
call plug#end()

set tags+=./.git/tags

"color atom-dark-256
set background=dark
colorscheme base16-twilight


nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

let g:EasyMotion_keys = 'aoeuisnthd'

" NERDCommenter
map <Leader>cc <plug>NERDCommenterToggle
map <Leader>c<space> <plug>NERDCommenterComment

nnoremap <Leader>b :Buffers<cr>
nnoremap <Leader>t :Files<cr>

" ag
nnoremap <Leader>a :Ag<space>

" vimux
nnoremap <Leader>vp :VimuxPromptCommand<CR>
map <Leader>vq :VimuxCloseRunner<CR>
map <Leader>vz :call VimuxZoomRunner()<CR>

" ZooomWin
nnoremap <Leader>z :ZoomWin<CR>

if has('nvim')
  let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
elseif exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
  inoremap <special> <Esc> <Esc>hl
  set guicursor+=i:blinkwait0
endif

nnoremap <Leader>j :Explore<CR>
nnoremap <C-x>0 :ZoomWin<CR>
nnoremap <C-x>1 <C-w>v
nnoremap <C-x>2 <C-w>s

autocmd BufWritePre * :%s/\s\+$//e

let g:airline_powerline_fonts = 1
