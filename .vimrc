execute pathogen#infect()

" Filetype indent settings
"filetype plugin indent on
"filetype indent on

"autocmd Filetype html setlocal ts=2 sw=2 expandtab
"autocmd Filetype javascript setlocal ts=2 sw=2 expandtab
"autocmd Filetype cpp setlocal tabstop=4
"autocmd Filetype javascript setlocal ts=4 sts=4 sw=4

" general settings
set number relativenumber

set expandtab
set autoindent
set smartindent
set shiftwidth=4
set tabstop=4
set softtabstop=4
set backspace=2

set ignorecase
set smartcase

set splitright
set splitbelow

set clipboard=unnamedplus

" ctrlp settings
set runtimepath^=~/.vim/bundle/ctrlp.vim

" Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_javascript_checkers=['eslint']
let g:syntastic_javascript_eslint_generic = 1
let g:syntastic_javascript_eslint_exec = '/bin/ls'
let g:syntastic_javascript_eslint_exe='$(npm bin)/eslint'
let g:syntastic_javascript_eslint_args='-f compact'

" IndentLine settings
let g:indentLine_color_term = 239
let g:indentLine_char_list = ['|', '¦', '┆', '┊']

" Ripgrep Settings
if executable('rg')
  set grepprg=rg\ --color=never
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob "" --hidden'
  let g:ctrlp_use_caching = 0
  let g:ctrlp_show_hidden = 1
endif

" airline settings
let g:airline_theme='base16_gruvbox_dark_hard'
let g:airline_powerline_fonts = 1

" Ctrl-n to open nerdtree
map <C-n> :NERDTreeToggle<CR>

syntax on
colorscheme gruvbox
set t_Co=256
set background=dark
highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE

" Python indentation
let g:pymode_indent = 0

" Emmet Settings
let g:user_emmet_settings = {
\  'javascript' : {
\      'extends' : 'jsx',
\  },
\}

nnoremap <SPACE> <Nop>
let mapleader = " "
nnoremap <Leader>v :e $MYVIMRC<CR>
nnoremap <Leader>z :e ~/.zshrc<CR>
nnoremap <Leader>hy :e ~/.hyper.js<CR>
nnoremap <Leader>sv :source ~/.vimrc<CR>
nnoremap <Leader>t :Tab /= <CR>
nnoremap <Leader>y :Tab /:\zs/l0l1
nnoremap <Leader>u :!spicetify update
nmap <Leader>f :TagbarToggle<CR>
