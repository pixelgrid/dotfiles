set nocompatible              " be iMproved, required
set rtp+=$GOROOT/misc/vim
filetype off                  " required

set anti enc=utf-8
set guifont=Source\ Code\ Pro\ Powerline\ 21

" imap <C-J> <Plug>snipMateNextOrTrigger
" smap <C-J> <Plug>snipMateNextOrTrigger

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
" We could also add repositories with a extension
Plugin 'scrooloose/nerdtree.git'
Plugin 'kien/ctrlp.vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'mattn/emmet-vim'
Plugin 'tpope/vim-fugitive'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-surround'
Plugin 'delimitMate'
Plugin 'tcomment'
Plugin 'fatih/vim-go'
Plugin 'nsf/gocode', {'rtp': 'vim/'}
" Plugin 'Valloric/YouCompleteMe'
Plugin 'Shougo/neocomplete.vim'
Plugin 'Shougo/neosnippet'
Plugin 'Shougo/neosnippet-snippets'
" Plugin 'marijnh/tern_for_vim'
Plugin 'desert-warm-256'
Plugin 'isRuslan/vim-es6'
Plugin 'shawncplus/phpcomplete.vim'
" snipmate and its depentencies
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
" Plugin 'garbas/vim-snipmate'
" react snippets
Plugin 'justinj/vim-react-snippets'
" snippets collection
Plugin 'honza/vim-snippets'
Plugin 'tpope/vim-commentary'
Plugin 'leafgarland/typescript-vim'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

colorscheme desert-warm-256
highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE
let delimitMate_expand_cr = 1
let delimitMate_expand_space = 1
let g:tern_show_argument_hints="on_hold"
let g:airline_powerline_fonts = 1
let g:airline_theme='hybridline'
set laststatus=2
set relativenumber
set ignorecase
set smartcase
set incsearch
set hlsearch
set showmatch
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
set t_Co=256
set splitright
" set nopaste
" make CtrlP not set the current directory to the last file opened
let g:ctrlp_working_path_mode=0
let g:go_fmt_command = "goimports"
source ~/.vim/configuration/mappings.vim
source ~/.vim/configuration/neocomplete_config.vim
" source ~/.vim/configuration/neosnippet_config.vim
set shell=/bin/sh
