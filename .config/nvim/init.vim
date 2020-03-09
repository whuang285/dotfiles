" vim-plug setup (:PlugInstall)
call plug#begin(stdpath('data') . '/plugged')
"call plug#begin('~/.local/share/nvim/plugged')

" syntax highlighting
Plug 'sheerun/vim-polyglot'

" pywal: color
Plug 'dylanaraps/wal.vim'

" golang
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

call plug#end()

" set color
colorscheme wal

" enable relative line numbers
" set rnu
set number

" tab/indent settings
set tabstop=4
set shiftwidth=4
set expandtab
set smartindent

" copy to clipboard
set clipboard=unnamedplus

" allow backspacing over indentation, line breaks, and insertion start
set backspace=indent,eol,start

