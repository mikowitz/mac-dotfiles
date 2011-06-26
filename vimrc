set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-vividchalk'
Bundle 'scrooloose/nerdcommenter'
Bundle 'sjbach/lusty'
Bundle 'vim-scripts/ZoomWin'
Bundle 'wgibbs/vim-irblack'
Bundle 'wycats/nerdtree'

filetype plugin indent on

syntax on
set number
set hidden

" lilypond vim files
set runtimepath+=/usr/local/Cellar/lilypond/current/share/lilypond/current/vim/
au BufRead,BufNewFile *.{ly,lyi} set ft=lilypond

" Whitespace
set nowrap
set tabstop=2
set shiftwidth=2
set softtabstop=2
set smarttab
set expandtab

" colwidth
set wrap
set textwidth=79
set colorcolumn=100

" set leader to comma
let mapleader=","

" Status bar
set laststatus=2
set statusline=%f\ %y%m%=%c\ %l/%L

" Tab completion
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase
nnoremap <Leader><space> :noh<CR>

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" NERDTree
let NERDTreeIgnore=['\.rbc$', '\~$']
map <Leader>n :NERDTreeToggle<CR>

" ZoomWin
map <Leader><Leader> :ZoomWin<CR>

" NERDCommenter
map <Leader>cc <plug>NERDCommenterToggle
map <Leader>c<space> <plug>NERDCommenterComment

" Navigation shortcuts
" split vertically and move cursor to new buffer
nnoremap <Leader>w <C-w>v<C-w>l
" split horizontally and move cursor to new buffer
nnoremap <Leader>s <C-w>s<C-w>j

" navigate buffers with Ctl + vim movement keys
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" jj > <ESC>
imap jj <ESC>
imap JJ <ESC>

" search and center
map n nzz
map N Nzz

color ir_black
