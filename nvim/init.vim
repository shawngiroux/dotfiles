" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes
Plug 'ctrlpvim/ctrlp.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'joshdick/onedark.vim'
Plug 'jremmen/vim-ripgrep'
Plug 'mattn/emmet-vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ntpeters/vim-better-whitespace'
Plug 'preservim/nerdcommenter'
Plug 'preservim/nerdtree'
Plug 'preservim/tagbar'
Plug 'ryanoasis/vim-devicons'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-syntastic/syntastic'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-notes'

" Initialize plugin system
call plug#end()

"****************************************
"    ______                           __
"   / ____/__  ____  ___  _________ _/ /
"  / / __/ _ \/ __ \/ _ \/ ___/ __ `/ /
" / /_/ /  __/ / / /  __/ /  / /_/ / /
" \____/\___/_/ /_/\___/_/   \__,_/_/
"
"****************************************
set number relativenumber

set expandtab
set autoindent
set smartindent
set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4
set backspace=2

set ignorecase
set smartcase

set splitright
set splitbelow

set clipboard=unnamedplus
set mouse=a

set nocompatible

set encoding=utf8

set maxmempattern=5000

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

syntax on
colorscheme onedark

" Italics
highlight Comment cterm=italic gui=italic
highlight Type cterm=italic gui=italic
highlight Conditional cterm=italic gui=italic
highlight Repeat cterm=italic gui=italic

" JS Keyword Highlights
highlight jsThis cterm=italic gui=italic
highlight jsImport cterm=italic gui=italic
highlight jsFrom cterm=italic gui=italic
highlight jsExport cterm=italic gui=italic
highlight jsExportDefault cterm=italic gui=italic

" Bolds
highlight Function cterm=bold gui=bold

" Note: You can do :exe 'hi '.synIDattr(synstack(line('.'), col('.'))[-1], 'name') to see what highlight group the item under cursor belongs to.

"*************************************
"     ____  __            _
"    / __ \/ /_  ______ _(_)___  _____
"   / /_/ / / / / / __ `/ / __ \/ ___/
"  / ____/ / /_/ / /_/ / / / / (__  )
" /_/   /_/\__,_/\__, /_/_/ /_/____/
"               /____/
"
"*************************************

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_php_checkers = ['php']

" Ctrlp
" Ripgrep Settings
if executable('rg')
  set grepprg=rg\ --color=never
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob "" --hidden'
  let g:ctrlp_use_caching = 0
  let g:ctrlp_show_hidden = 1
endif

set wildignore+=*/vendor

" NERDTree
nnoremap <C-n> :NERDTreeToggle<CR>

" Vim Devicons
" after a re-source, fix syntax matching issues (concealing brackets):
if exists('g:loaded_webdevicons')
  call webdevicons#refresh()
endif

" Vim Airline
let g:airline_theme='onedark'
let g:airline_powerline_fonts = 1

" Coc.nvim
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

" Tagbar for Rust
let g:rust_use_custom_ctags_defs = 1  " if using rust.vim
let g:tagbar_type_rust = {
  \ 'ctagsbin' : '/home/calico/bin/universal_ctags/bin/ctags',
  \ 'ctagstype' : 'rust',
  \ 'kinds' : [
      \ 'n:modules',
      \ 's:structures:1',
      \ 'i:interfaces',
      \ 'c:implementations',
      \ 'f:functions:1',
      \ 'g:enumerations:1',
      \ 't:type aliases:1:0',
      \ 'v:constants:1:0',
      \ 'M:macros:1',
      \ 'm:fields:1:0',
      \ 'e:enum variants:1:0',
      \ 'P:methods:1',
  \ ],
  \ 'sro': '::',
  \ 'kind2scope' : {
      \ 'n': 'module',
      \ 's': 'struct',
      \ 'i': 'interface',
      \ 'c': 'implementation',
      \ 'f': 'function',
      \ 'g': 'enum',
      \ 't': 'typedef',
      \ 'v': 'variable',
      \ 'M': 'macro',
      \ 'm': 'field',
      \ 'e': 'enumerator',
      \ 'P': 'method',
  \ },
\ }

"******************************
"     ____  _           __
"    / __ )(_)___  ____/ /____
"   / __  / / __ \/ __  / ___/
"  / /_/ / / / / / /_/ (__  )
" /_____/_/_/ /_/\__,_/____/
"
"******************************

" Space as leader key
let mapleader=" "

" Source vimrc
nnoremap <silent> <Leader>sv :source $MYVIMRC<cr>

" Open this config file
nnoremap <Leader>v :e $MYVIMRC<CR>

" Open shell config
nnoremap <Leader>z :e ~/.zshrc<CR>

" Delete whitespace
nnoremap <Leader>dws :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

" Toggle Syntastic
nnoremap <Leader>st :SyntasticToggleMode<CR>

" Tab and Shift table to cycle through auto complete
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Go to tab by number
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt

" Git shortcuts
map <leader>gs :Gstatus<CR>
map <leader>gb :Gblame<CR>
map <leader>gd :Gdiff<CR>
map <leader>gp :Gpush<CR>
map <leader>gf :diffget //3<CR>
map <leader>gj :diffget //2<CR>

" Window binds
map <leader>ws :split<CR>
map <leader>wv :vsplit<CR>
map <leader>wk :wincmd k<CR>
map <leader>wj :wincmd j<CR>
map <leader>wh :wincmd h<CR>
map <leader>wl :wincmd l<CR>

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

nmap <leader>f :TagbarToggle<CR>
