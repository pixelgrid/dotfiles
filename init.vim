" install vim plug if not install
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

set termguicolors
syntax on
set nocompatible              " be iMproved, required
filetype off
filetype plugin indent on
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
set relativenumber
let mapleader = "\<Space>"

" ======= coc settings
set updatetime=300
set shortmess+=c
set encoding=utf-8
let g:coc_suggest_disable=1

let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25

let g:sneak#label = 1
let g:sneak#use_ic_scs = 1

" -- no Statusline ----------------------------------------------------------------
set laststatus=0

"enable title to be shown in tmux bar
set title

"" MAPPINGS
imap nn <Esc>
nmap <leader>s :Files<CR>
nmap <leader>t :Buffers<CR>
nmap <leader>n :NvimTreeToggle<CR>
nmap <leader>e :tabe <bar> TW<CR>
nmap gs :Rg <C-R><C-W><CR>
nmap ges :Rg \b<C-R><C-W>\b<CR>
nmap n nzz
nmap N Nzz
nmap # #zz
nmap * *zz
nmap <leader>y "*yy

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> <leader>rn :call CocActionAsync('rename')<CR>

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

"" COMMANDS
command! -bang -nargs=? -complete=dir Files
\ call fzf#vim#files(<q-args>, {'options': ['--preview', 'bat -p --color always {}']}, <bang>0)

let $FZF_PREVIEW_COMMAND = 'bat -p --color always {} || cat {}'
command! -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>),
  \   1,
  \   fzf#vim#with_preview('right:50%'))


""" Telescope.nvim
" Find files using Telescope command-line sugar.
nmap <leader>s :Files<CR>
nmap <leader>b :Buffers<CR>
nnoremap gs :Rg <C-R><C-W><CR>


"" Functions
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

function! s:WriteCreatingDirs()
  let l:file=expand("%")
  if empty(getbufvar(bufname("%"), '&buftype')) && l:file !~# '\v^\w+\:\/'
    let dir=fnamemodify(l:file, ':h')
    if !isdirectory(dir)
      call mkdir(dir, 'p')
    endif
  endif
  write
endfunction
command! W call s:WriteCreatingDirs()

call plug#begin('~/.local/share/nvim/plugged')
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'justinmk/vim-sneak'
Plug 'airblade/vim-gitgutter'
Plug 'morhetz/gruvbox'
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-eslint', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-lists', {'do': 'yarn install --frozen-lockfile'}
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'
call plug#end()

colorscheme gruvbox

augroup suffixes
    autocmd!

    let associations = [
                \["javascript", ".js,.javascript,.es,.esx,.json"],
                \]

    for ft in associations
        execute "autocmd FileType " . ft[0] . " setlocal suffixesadd=" . ft[1]
    endfor
augroup END
