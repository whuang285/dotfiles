" ==================== plugins ==================== "
" vim-plug setup (:PlugInstall)
call plug#begin(stdpath('data') . '/plugged')
"call plug#begin('~/.local/share/nvim/plugged')

" statusline
Plug 'itchyny/lightline.vim'

" syntax highlighting
Plug 'sheerun/vim-polyglot'

" code completion
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" navigation
Plug 'scrooloose/nerdTree'

" usability
Plug 'tpope/vim-surround'

" pywal: color
Plug 'dylanaraps/wal.vim'

" golang
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

call plug#end()

" ==================== settings ==================== "
set number                      " enable line numbers
" set number rnu                 " relative line numbers
set tabstop=4                   " tabs are four columns in width
set shiftwidth=4                " shift by four columns in width
set softtabstop=4               " insert/delete tab width of whitespace
set expandtab                   " use spaces instead of tabs
set smartindent                 " smart indent
" set hidden                     " switch buffers without saving
set backspace=indent,eol,start  " allow backspacing over indentation, line breaks, and insertion start
set ignorecase                  " insensitive case searching...
set smartcase                   " ...but not if the search begins with upper case letter
set noincsearch                 " wait to execute search until <enter> is pressed
set updatetime=400              " reduce update time from 4s to 400ms
set signcolumn=yes              " always show the sign column
set splitright                  " split vertical windows to the right of current windoww
set splitbelow                  " split horizontal windows below current windows
set clipboard=unnamedplus       " copy to clipboard
set completeopt=menu            " show possible completions in a pmenu

" ==================== style ==================== "

colorscheme wal                 " set color

" ==================== key mappings ==================== "
let mapleader = ";"

" ==================== deoplete ==================== "
if has('nvim')
    " Enable deoplete on startup
    let g:deoplete#enable_at_startup = 1
endif

" Disable deoplete when in multi cursor mode
"function! Multiple_cursors_before()
    "let b:deoplete_disable_auto_complete = 1
"endfunction
"function! Multiple_cursors_after()
    "let b:deoplete_disable_auto_complete = 0
"endfunction

" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

"==================== nerdtree ==================== "
nmap <leader>n :NERDTreeToggle<CR>

let g:NERDTreeShowHidden = 1    " show hidden files
