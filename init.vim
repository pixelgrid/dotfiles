" install vim plug if not install
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

set nocompatible              " be iMproved, required
filetype off
filetype plugin indent on
set laststatus=2
set ignorecase
set smartcase
set incsearch
set hlsearch
set showmatch
set expandtab
set smarttab
set shiftwidth=2
set tabstop=2
set t_Co=256
set noswapfile
set number
let mapleader = "\<Space>"

imap nn <Esc>
nmap <leader>s :Files<CR>
nmap <leader>t :Buffers<CR>
nmap <leader>n :NERDTree<CR>
nmap gs :Rg <C-R><C-W><CR>
nmap ges :Rg \b<C-R><C-W>\b<CR>
nmap n nzz
nmap N nzz
nmap # #zz
nmap * *zz

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

"""" enable 24bit true color
set termguicolors

"""" enable the theme
syntax on

filetype plugin indent on
" On pressing tab, insert 2 spaces
set expandtab
" show existing tab with 2 spaces width
set tabstop=2
set softtabstop=2
" when indenting with '>', use 2 spaces width
set shiftwidth=2

" ======= coc settings
set updatetime=300
set shortmess+=c
set encoding=utf-8

" LIMELIGHT SETTINGS
" Color name (:help cterm-colors) or ANSI code
" let g:limelight_conceal_ctermfg = 'gray'
" let g:limelight_conceal_ctermfg = 240

" Color name (:help gui-colors) or RGB color
" let g:limelight_conceal_guifg = 'DarkGray'
" let g:limelight_conceal_guifg = '#777777'

" Default: 0.5
" let g:limelight_default_coefficient = 0.7

" Number of preceding/following paragraphs to include (default: 0)
" let g:limelight_paragraph_span = 1

" Beginning/end of paragraph
"   When there's no empty line between the paragraphs
"   and each paragraph starts with indentation
" let g:limelight_bop = '^\s'
" let g:limelight_eop = '\ze\n^\s'

" Highlighting priority (default: 10)
"   Set it to -1 not to overrule hlsearch
" let g:limelight_priority = -1

" AYU SETTINGS
let ayucolor="light"  " for light version of theme
" let ayucolor="mirage" " for mirage version of theme
" let ayucolor="dark"   " for dark version of theme

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" : "\<TAB>"

call plug#begin('~/.local/share/nvim/plugged')
" Plug 'fatih/vim-go'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
" Plug 'dense-analysis/ale'

Plug 'Rigellute/rigel'
Plug 'moll/vim-node'
Plug 'tpope/vim-fugitive'
"Plug 'bilalq/lite-dfm'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'danilo-augusto/vim-afterglow'
Plug 'ayu-theme/ayu-vim'

Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-eslint', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-lists', {'do': 'yarn install --frozen-lockfile'}


"Plug 'neoclide/coc-git', {'do': 'yarn install --frozen-lockfile'}
"Plug 'neoclide/coc-tabnine', {'do': 'yarn install --frozen-lockfile'}
"Plug 'neoclide/coc-css', {'do': 'yarn install --frozen-lockfile'}
"Plug 'neoclide/coc-json', {'do': 'yarn install --frozen-lockfile'}
"Plug 'neoclide/coc-html', {'do': 'yarn install --frozen-lockfile'}
"Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
"Plug 'neoclide/coc-flow', {'do': 'yarn install --frozen-lockfile'}

call plug#end()

colorscheme ayu
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
autocmd VimEnter * Goyo 50%x100% | highlight StatusLineNC ctermfg=white
autocmd BufWritePre *.go :CocCommand editor.action.organizeImport
