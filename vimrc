let mapleader = ","
set foldlevelstart=0

set noshowmode
set clipboard=unnamed

syntax on
filetype plugin indent on
set relativenumber
set number
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
set softtabstop=2
set shiftwidth=2
set smarttab
set expandtab
set listchars=tab:▸\ ,eol:¬,space:.
" }}}

set ttyfast
set lazyredraw

set cindent
set smartindent
set autoindent
set ai

set backspace=indent,eol,start
set ruler

filetype off
set runtimepath+=/Applications/LilyPond.app/Contents/Resources/share/lilypond/current/vim
filetype on
syntax on

call plug#begin('~/.vim/plugged')

Plug 'hashivim/vim-terraform'
let g:terraform_align=1

Plug 'alvan/vim-closetag'

let g:closetag_filenames = "*.html,*.xhtml,*.js,*.jsx"

Plug 'tmhedberg/matchit'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-rails'

Plug 'JamshedVesuna/vim-markdown-preview'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

let g:jsx_ext_required = 0

Plug 'godlygeek/tabular'
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'kchmck/vim-coffee-script'
Plug 'eagletmt/ghcmod-vim'
Plug 'eagletmt/neco-ghc'
Plug 'neovimhaskell/haskell-vim'

Plug 'itchyny/vim-haskell-indent'


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

Plug 'fatih/vim-go'
let g:go_fmt_command = "goimports"

Plug 'wlangstroth/vim-racket'

Plug 'rust-lang/rust.vim'

Plug 'luochen1990/rainbow'
let g:rainbow_active = 1

let g:rainbow_conf = {
	\	'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
	\	'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
	\	'operators': '_,_',
	\	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
	\	'separately': {
	\		'*': {},
	\		'tex': {
	\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
	\		},
	\		'lisp': {
	\			'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
	\		},
	\		'vim': {
	\			'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
	\		},
	\		'html': {
	\			'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
	\		},
	\		'css': 0,
	\	}
	\}

Plug 'tpope/vim-fireplace'
Plug 'gregspurrier/vim-midje'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'tpope/vim-vinegar'

call plug#end()

colorscheme PaperColor

"hi MatchParen cterm=none ctermbg=blue ctermfg=green
hi MatchParen cterm=bold ctermbg=none ctermfg=blue

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

"let NERDTreeHijackNetrw=1
"nnoremap <Leader>j :NERDTree %<CR>
"nnoremap <Leader>j :e `dirname %`<CR>
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

"map <Leader>n :NERDTreeToggle<CR>
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd bufenter *.jbuilder set ft=ruby

"set iskeyword-=_

set shell=zsh

let g:haskell_tabular = 1

vmap a= :Tabularize /=<CR>
vmap a; :Tabularize /::<CR>
vmap a- :Tabularize /-><CR>
