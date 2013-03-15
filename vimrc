set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'altercation/vim-colors-solarized'
Bundle 'digitaltoad/vim-jade'
Bundle 'eagletmt/ghcmod-vim'
Bundle 'gmarik/vundle'
Bundle 'kchmck/vim-coffee-script'
Bundle 'kien/ctrlp.vim'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'Lokaltog/vim-powerline'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-vividchalk'
Bundle 'scrooloose/nerdcommenter'
Bundle 'Shougo/vimproc'
Bundle 'tpope/vim-rails'
Bundle 'tsaleh/vim-matchit'
Bundle 'vim-scripts/ack.vim'
Bundle 'vim-scripts/VimClojure'
Bundle 'vim-scripts/ZoomWin'
Bundle 'wgibbs/vim-irblack'
Bundle 'wycats/nerdtree'
Bundle 'xhr/vim-io'

filetype plugin indent on

syntax on
set number
set hidden

" lilypond vim files
"set runtimepath+=/usr/local/Cellar/lilypond/current/share/lilypond/current/vim/
set runtimepath+=/Applications/Lilypond.app/Contents/Resources/share/lilypond/current/vim/
au BufRead,BufNewFile *.{ly,lyi,ily} set ft=lilypond

" coffeescript
au BufRead,BufNewFile *.coffee set ft=coffee

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
set wildignore+=*.o,*.obj,.git,*.rbc,*.aux,*.log,*.pdf

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase
nnoremap <Leader><space> :noh<CR>

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" matchit
runtime macros/matchit.vim

" NERDTree
let NERDTreeIgnore=['\.rbc$', '\~$', '\.pdf$', '\.midi$']
map <Leader>n :NERDTreeToggle<CR>

" ZoomWin
map <Leader>z :ZoomWin<CR>

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

nnoremap j gj
nnoremap k gk

" search and center
map n nzz
map N Nzz

" reselect visual block after in/outdent
" vimbits.com/bits/20
vnoremap < <gv
vnoremap > >gv

" font
set gfn=AnonymousPro:h12
set vb

color ir_black

set clipboard=unnamed

" printing...
set printoptions=syntax:n,bottom:7pc,top:7pc,left:7pc,right:3pc,header:1

" folding
set foldmethod=indent
set foldlevel=0
set nofoldenable

" ctrl-p
let g:ctrlp_map = '<leader>t'
let g:ctrl_cmd = 'CtrlPMixed'

" learning vim the hard way
noremap _ ddp
noremap - ddkP
inoremap <c-u> <esc>viwU<esc>i
nnoremap <c-u> viwU
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>esv :source $MYVIMRC<cr>
