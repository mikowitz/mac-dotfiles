" always show the status line
set laststatus=2
set showtabline=2
set noshowmode

call plug#begin('~/.vim/plugged')
Plug 'benmills/vimux'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'easymotion/vim-easymotion'
Plug 'elixir-lang/vim-elixir'
Plug 'gosukiwi/vim-atom-dark'
Plug 'jaxbot/semantic-highlight.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
Plug 'rking/ag.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-rails'
Plug 'wgibbs/vim-irblack'
call plug#end()

syntax on
set relativenumber
set hidden
set vb

set tags+=./.git/tags

color atom-dark-256

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

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" easymotion
map <Leader>l <Plug>(easymotion-bd-jk)
nmap <Leader>l <Plug>(easymotion-overwin-line)

map <Leader>w <Plug>(easymotion-overwin-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

map <Leader>f <Plug>(easymotion-overwin-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

let g:EasyMotion_keys = 'aoeuisnthd'

" ctrl-p
let g:ctrlp_map = '<leader>t'
let g:ctrlp_cmd = 'CtrlPRoot'

" NERDCommenter
map <Leader>cc <plug>NERDCommenterToggle
map <Leader>c<space> <plug>NERDCommenterComment

nnoremap <Leader>b :Buffers<cr>
nnoremap <Leader>F :Files<cr>

" ag
nnoremap <Leader>a :Ag<space>

" vimux
nnoremap <Leader>vp :VimuxPromptCommand<CR>
map <Leader>vq :VimuxCloseRunner<CR>
map <Leader>vz :call VimuxZoomRunner()<CR>
