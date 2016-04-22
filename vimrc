" always show the status line
set laststatus=2
set showtabline=2
set noshowmode
set clipboard=unnamed

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
Plug 'regedarek/ZoomWin'
Plug 'rking/ag.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
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

set backspace=indent,eol,start

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

" ZooomWin
nnoremap <Leader>z :ZoomWin<CR>

let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"

map <C-n> :NERDTreeToggle<CR>

" NERDTree File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
  exec 'autocmd FileType nerdtree highlight ' . a:extension .' ctermbg='.  a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
  exec 'autocmd FileType nerdtree syn match ' . a:extension .' #^\s\+.*'.  a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')

nnoremap <Leader>j :Explore<CR>
nnoremap <C-x>0 :ZoomWin<CR>
nnoremap <C-x>1 <C-w>v
nnoremap <C-x>2 <C-w>s
