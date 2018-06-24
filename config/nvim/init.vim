" not vi compatible
set nocompatible

" use OS clipboard
set clipboard=unnamed

" faster regular expression engine
set re=1

" comma leader
let mapleader=","
map <leader> <Plug>(easymotion-prefix)

syntax enable		" enable syntax processing

set tabstop=2		" number of visual spaces per TAB
set softtabstop=2	" number of spaces in TAB when editing
set smarttab
set shiftwidth=2    " number of spaces to use with (auto)indent commands
set expandtab		" TABs are spaces

filetype indent on  " load filetype-specific indent files
filetype plugin on

" relative line numbers
set number
set relativenumber
set numberwidth=3   " line number gutter width
set showcmd         " show command in bottom bar

" open new panes to the right and below of current
set splitright
set splitbelow

" interactive search
set incsearch       " search as characters are entered
set hlsearch        " highlight matches
set ignorecase
set smartcase

" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" faster pane navigation
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k

" up/down navigation with wrapped lines
nnoremap j gj
nnoremap k gk

" faster escape
inoremap jk <esc>

" no updates
set updatecount=0
set nobackup
set nowritebackup

set backspace=indent,eol,start

if has('nvim')
  " Live highlight of interactive commands like substitute
  set inccommand=split
endif

" Edit ~/.vimrc file
nnoremap <leader>ev :vsplit $MYVIMRC<cr>

" Source ~/vimrc file
nnoremap <leader>sv :source $MYVIMRC<cr>

" plugin management
call plug#begin('~/.config/nvim/plugged')

Plug 'shime/vim-livedown'

Plug 'hashivim/vim-terraform'

Plug 'elixir-editors/vim-elixir'
Plug 'slashmili/alchemist.vim'

Plug 'mileszs/ack.vim'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Preferred colorscheme
Plug 'NLKNguyen/papercolor-theme'


Plug 'tpope/vim-characterize'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'

Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

Plug 'easymotion/vim-easymotion'
Plug 'haya14busa/incsearch.vim'

Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'troydm/zoomwintab.vim'

Plug 'janko-m/vim-test'

Plug 'sevko/vim-nand2tetris-syntax'

Plug 'vim-syntastic/syntastic'

call plug#end()

let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeQuitOnOpen = 1
nnoremap <C-n> :NERDTreeFind<cr>
nnoremap - :NERDTreeFind<cr>
nnoremap <leader>t :NERDTreeToggle<cr>

colorscheme PaperColor
set background=dark

" set yellow column gutter at 80 characters
set colorcolumn=80
highlight ColorColumn ctermbg=11
highlight ColorColumn ctermfg=0

" clear trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e

nnoremap <C-f> :Files<cr>
nnoremap <C-b> :Buffers<cr>

map  <leader>f <Plug>(easymotion-bd-f)
nmap <leader>f <Plug>(easymotion-overwin-f)
nmap <leader>l <Plug>(easymotion-overwin-line)
map  <leader>w <Plug>(easymotion-bd-w)
nmap <leader>w <Plug>(easymotion-overwin-w)

let g:EasyMotion_keys='aoeusnth'

map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)


let g:NERDTreeIgnore = ['\.out$']
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }
let g:NERDTreeShowIgnoredStatus = 1

let g:airline_theme='deus'
let g:airline_powerline_fonts = 1

cnoreabbrev Ack Ack!
nnoremap <Leader>a :Ack!<Space>
if executable('ag')
  let g:ackprg = 'noglob ag --vimgrep --ignore=*.tfstate'
endif

tnoremap <Esc> <C-\><C-n>

let test#strategy = 'neovim'

nnoremap <leader>tf :TestFile<cr>
nnoremap <leader>ts :TestSuit<cr>
nnoremap <leader>tl :TestLast<cr>
nnoremap <leader>tn :TestNearest<cr>

set runtimepath+=/Applications/Lilypond.app/Contents/Resources/share/lilypond/current/vim
au Bufnewfile,bufRead *.ly,*.lyi set filetype=lilypond
autocmd FileType lilypond setlocal commentstring=%\ %s

autocmd FileType tex setlocal commentstring=%\ %s

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_elixir_checker = 1

let g:syntastic_elixir_checkers = ['elixir']
