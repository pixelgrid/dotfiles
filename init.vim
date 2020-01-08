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
nmap <leader>e :tabe <bar> TW<CR>
nmap gs :Rg <C-R><C-W><CR>
nmap ges :Rg \b<C-R><C-W>\b<CR>
nmap n nzz
nmap N nzz
nmap # #zz
nmap * *zz

let $FZF_PREVIEW_COMMAND = 'bat --theme="Monokai Extended Light" -p --color=always {} || cat {}'
let $FZF_DEFAULT_OPTS='--layout=reverse'

command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, {'options': ['--preview', 'bat -p --theme="Monokai Extended Light" --color=always {}']}, <bang>0)

command! -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>),
  \   1,
  \   fzf#vim#with_preview('right:50%'))


let g:fzf_layout = { 'window': 'call FloatingFZF()' }

function! FloatingFZF()
  let buf = nvim_create_buf(v:false, v:true)
  call setbufvar(buf, '&signcolumn', 'no')

  let height = &lines - 3
  let width = float2nr(&columns - (&columns * 2 / 10))
  let col = float2nr((&columns - width) / 2)

  let opts = {
        \ 'relative': 'editor',
        \ 'row': 1,
        \ 'col': col,
        \ 'width': width,
        \ 'height': height
        \ }

  call nvim_open_win(buf, v:true, opts)
endfunction


let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'EndOfBuffer'] }

let g:go_doc_window_popup_window=1
let g:user_emmet_expandabbr_key='<Tab>'
imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")


" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gn <Plug>(coc-diagnostic-next-error)


nmap s <Plug>(easymotion-bd-f)
" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction


""""" VIM GO
let g:go_gopls_complete_unimported = 1
" Specifies whether `gopls` can provide placeholders 
" for function parameters and struct fields.
let g:go_gopls_use_placeholders = 1
let g:go_fmt_command = "goimports"
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:go_def_mapping_enabled=0
" let g:go_doc_popup_window=1
let g:go_doc_keywordprg_enabled=0
""""" VIM GO

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
" let ayucolor="light"  " for light version of theme
let ayucolor="mirage" " for mirage version of theme
" let ayucolor="dark"   " for dark version of theme
set background=light
inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" : "\<TAB>"

call plug#begin('~/.local/share/nvim/plugged')
Plug 'fatih/vim-go'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
" Plug 'dense-analysis/ale'

Plug 'Rigellute/rigel'
Plug 'moll/vim-node'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'danilo-augusto/vim-afterglow'
" Plug 'ayu-theme/ayu-vim'
" Plug 'morhetz/gruvbox'
Plug 'NLKNguyen/papercolor-theme'
Plug 'tpope/vim-surround'
Plug 'ryanoasis/vim-devicons'
Plug 'easymotion/vim-easymotion'

Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-eslint', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-lists', {'do': 'yarn install --frozen-lockfile'}
Plug 'mhinz/vim-startify'

call plug#end()

colorscheme papercolor
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')
autocmd BufWritePre *.go :OR
" autocmd VimEnter * Goyo 50%x100% | highlight StatusLineNC ctermfg=white
