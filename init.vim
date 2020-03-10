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
nmap <leader>n :NERDTreeToggle<CR>
nmap gs :Rg <C-R><C-W><CR>
nmap ges :Rg \b<C-R><C-W>\b<CR>
nmap n nzz
nmap N Nzz
nmap # #zz
nmap * *zz

" Floaterm config
let g:floaterm_keymap_toggle = '<leader>t'
let g:floaterm_width = 0.9
let g:floaterm_height = 0.9
let g:floaterm_position = 'center'

let $FZF_PREVIEW_COMMAND = 'bat --theme="Monokai Extended Light" -p --color=always {} || cat {}'
let $FZF_DEFAULT_OPTS='--layout=reverse'

command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, {'options': ['--preview', 'bat -p --theme="Monokai Extended Light" --color=always {}']}, <bang>0)

command! -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>),
  \   1,
  \   fzf#vim#with_preview('right:50%'))


let g:fzf_layout = { 'window': 'call CreateCenteredFloatingWindow()' }

function! CreateCenteredFloatingWindow()
    let width = min([&columns - 4, max([80, &columns - 20])])
    let height = min([&lines - 4, max([20, &lines - 10])])
    let top = ((&lines - height) / 2) - 1
    let left = (&columns - width) / 2
    let opts = {'relative': 'editor', 'row': top, 'col': left, 'width': width, 'height': height, 'style': 'minimal'}

    let top = "╭" . repeat("─", width - 2) . "╮"
    let mid = "│" . repeat(" ", width - 2) . "│"
    let bot = "╰" . repeat("─", width - 2) . "╯"
    let lines = [top] + repeat([mid], height - 2) + [bot]
    let s:buf = nvim_create_buf(v:false, v:true)
    call nvim_buf_set_lines(s:buf, 0, -1, v:true, lines)
    call nvim_open_win(s:buf, v:true, opts)
    set winhl=Normal:Floating
    let opts.row += 1
    let opts.height -= 2
    let opts.col += 2
    let opts.width -= 4
    call nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)
    au BufWipeout <buffer> exe 'bw '.s:buf
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
" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
nmap <silent> gc :GitMessenger<CR>

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

set updatetime=300
set shortmess+=c
set encoding=utf-8
set background=light

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" : "\<TAB>"


" tmux-navigator
" let g:tmux_navigator_no_mappings = 1

" nnoremap <silent> <M-i> :TmuxNavigateLeft<cr>
" nnoremap <silent> <M-e> :TmuxNavigateDown<cr>
" nnoremap <silent> <M-u> :TmuxNavigateUp<cr>
" nnoremap <silent> <M-n> :TmuxNavigateRight<cr>

ab :greece: 🇬🇷
call plug#begin('~/.local/share/nvim/plugged')
Plug 'fatih/vim-go'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
" Plug 'dense-analysis/ale'
Plug 'moll/vim-node'
Plug 'tpope/vim-fugitive'
Plug 'NLKNguyen/papercolor-theme'
Plug 'tpope/vim-surround'
Plug 'ryanoasis/vim-devicons'

Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-eslint', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-lists', {'do': 'yarn install --frozen-lockfile'}
Plug 'mhinz/vim-startify'
Plug 'rhysd/git-messenger.vim'

Plug 'voldikss/vim-floaterm'
Plug 'liuchengxu/vista.vim'
Plug 'christoomey/vim-tmux-navigator'

call plug#end()

colorscheme papercolor
hi FloatermNF guibg=white
hi FloatermBorderNF guibg=white guifg=white
