let mapleader = ","
set foldlevelstart=0

set noshowmode
set clipboard=unnamed

syntax on
filetype plugin indent on
set relativenumber
set numberwidth=3
set hidden
set vb
set re=1
set colorcolumn=80

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

" Whitespace {{{
set nowrap
set tabstop=2
set shiftwidth=2
set softtabstop=2
set smarttab
set expandtab
" }}}

set cindent
set smartindent
set autoindent
set ai

set backspace=indent,eol,start

call plug#begin('~/.vim/plugged')

Plug 'godlygeek/tabular'
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'kchmck/vim-coffee-script'
Plug 'eagletmt/ghcmod-vim'
Plug 'eagletmt/neco-ghc'
Plug 'scrooloose/syntastic'
Plug 'neovimhaskell/haskell-vim'

Plug 'itchyny/vim-haskell-indent'

Plug 'scrooloose/nerdtree'

Plug 'elixir-lang/vim-elixir'
Plug 'slashmili/alchemist.vim'

" fzf --- {{{
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

nnoremap <Leader>b :Buffers<cr>
nnoremap <Leader>t :Files<cr>
nnoremap <Leader>a :Ag<space>
" }}}

" Vimux {{{
Plug 'benmills/vimux'
let g:VimuxUseNearest = 1
nnoremap <Leader>vp :VimuxPromptCommand<CR>
map <Leader>vq :VimuxCloseRunner<CR>
map <Leader>vz :call VimuxZoomRunner()<CR>
map <Leader>vv :call VimuxToggleRunner()<CR><C-w>=
augroup ruby_test
  autocmd!
  autocmd Filetype ruby nnoremap <leader>rl :RunRubyFocusedTest<cr><C-w>=
  autocmd Filetype ruby nnoremap <leader>rf :RunAllRubyTests<cr><C-w>=
  autocmd Filetype ruby nnoremap <leader>rc :VimuxClosePanes<cr>
augroup END
let g:VimuxOrientation = "h"
let g:VimuxHeight = "30"
" }}}

Plug 'vim-scripts/ZoomWin'
nnoremap <leader>z :ZoomWin<CR>

Plug 'scrooloose/nerdcommenter'
map <Leader>cc <plug>NERDCommenterToggle
map <Leader>c<space> <plug>NERDCommenterComment

Plug 'pgr0ss/vimux-ruby-test'

Plug 'spiegela/vimix'
let g:vimix_map_keys = 1

Plug 'flazz/vim-colorschemes'

" vim-airline {{{
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
set laststatus=2
let g:airline_powerline_fonts = 1
" }}}

" EasyMotion --- {{{
Plug 'easymotion/vim-easymotion'
let g:EasyMotion_keys = 'aoeuisnthd'

map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

map <Leader>l <Plug>(easymotion-bd-jk)
nmap <Leader>l <Plug>(easymotion-overwin-line)

map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)
" }}}

Plug '~/.vim/plugged/potion'
Plug '~/Code/vimix-spec'

call plug#end()

colorscheme twilight256

nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k

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
nnoremap <C-x>0 :ZoomWinTabIn<CR>
nnoremap <C-x>2 <C-w>s
nnoremap <C-x>3 <C-w>v

augroup delete_trailing_whitespace
  autocmd!
  autocmd BufWritePre * :%s/\s\+$//e
augroup END

function! VimuxToggleRunner()
  if exists("g:VimuxRunnerIndex")
    call VimuxCloseRunner()
  else
    call VimuxOpenRunner()
  endif
endfunction

nnoremap <leader>mb :call <SID>VimixRunCommand("espec")<cr>

" vimrc read/source {{{
nnoremap <leader>ev :vsplit ~/.vimrc<cr>
nnoremap <leader>sv :source ~/.vimrc<cr>
" }}}

" training ---- {{{
:inoremap jk <esc>
:inoremap <esc> <nop>
:inoremap <c-[> <nop>
:inoremap <right> <nop>
:inoremap <left> <nop>
:inoremap <up> <nop>
:inoremap <down> <nop>
" }}}

" Vimscript file settings -------------- {{{
augroup filetype_vim
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}



:nnoremap Q :call <SID>QuickfixToggle()<cr>
:nnoremap <leader>vt :call VimuxRunCommand("tig")<cr>

let g:quickfix_is_open = 0

function! s:QuickfixToggle()
  if g:quickfix_is_open
    cclose
    let g:quickfix_is_open = 0
    execute g:quickfix_return_to_window . "wincmd w"
  else
    let g:quickfix_return_to_window = winnr()
    copen
    let g:quickfix_is_open = 1
  endif
endfunction


let $FZF_DEFAULT_COMMAND='ag -g ""'

augroup elixir_test
  autocmd!
  autocmd Filetype elixir nnoremap <Leader>ed :call VimixPromptCommand()<CR>docs<CR>
  autocmd Filetype elixir nnoremap <Leader>ec :call VimixPromptCommand()<CR>credo --strict<CR>
augroup END

map <Leader>n :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd bufenter *.jbuilder set ft=ruby

set iskeyword-=_

map <Leader>s :SyntasticToggleMode<CR>

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

set shell=zsh

let g:haskell_tabular = 1

vmap a= :Tabularize /=<CR>
vmap a; :Tabularize /::<CR>
vmap a- :Tabularize /-><CR>
