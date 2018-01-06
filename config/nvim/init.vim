call plug#begin('~/.config/nvim/plugged')

Plug 'NLKNguyen/papercolor-theme'
Plug 'icymind/NeoSolarized'

Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

Plug 'elixir-editors/vim-elixir'
Plug 'avdgaag/vim-phoenix'

" vim-coffee-script
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'JamshedVesuna/vim-markdown-preview'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-projectionist'

Plug 'alvan/vim-closetag'

Plug 'machakann/vim-highlightedyank'

call plug#end()

set nocompatible
set clipboard=unnamed

set re=1

let mapleader=","

set runtimepath+=/Applications/Lilypond.app/Contents/Resources/share/lilypond/current/vim

syntax enable		" enable syntax processing

set tabstop=2		" number of visual spaces per TAB
set softtabstop=2	" number of spaces in TAB when editing
set shiftwidth=2    " number of spaces to use with (auto)indent commands
set expandtab		" TABs are spaces

set number          " show line numbers
set numberwidth=3   " line number gutter width
set showcmd         " show command in bottom bar

filetype indent on  " load filetype-specific indent files

set path+=**        " search down into subfolders
set wildmenu        " visual autocomplete for command menu
set lazyredraw      " redraw only when we need to
set showmatch       " highlight matching [{()}]

set incsearch       " search as characters are entered
set hlsearch        " highlight matches

" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

set termguicolors


colorscheme PaperColor
set background=dark

let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tre view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'
"
" shortcut to :find
nnoremap <C-f> :FZF<cr>
inoremap jk <esc>

nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k

nnoremap j gj
nnoremap k gk

" no updates
set updatecount=0
set nobackup
set nowritebackup

set backspace=indent,eol,start

set splitright
set splitbelow

" clear highlit search results
vnoremap <leader>c :s/^/#/g<cr>:nohlsearch<cr>
" open the current file's directory
" nnoremap - :Sex<cr>
nnoremap - :e %:h<tab><cr>

set wildignore+=_build/**,deps/**,docs/**

" strip whitespace on save
autocmd BufWritePre * %s/\s\+$//e

runtime! macros/matchit.vim

autocmd FileType elixir setlocal commentstring=#\ %s
autocmd FileType rake setlocal commentstring=#\ %s

au Bufnewfile,bufRead *.pm,*.t,*.pl set filetype=perl6

set colorcolumn=80
highlight ColorColumn ctermbg=1 guibg=lightgrey

let vim_markdown_preview_github=1

set inccommand=split

let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.html.eex'
