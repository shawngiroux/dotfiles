execute pathogen#infect()

" general settings
set number

filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab
set smartindent

" for html/javascript files, 2 spaces
autocmd Filetype html setlocal ts=2 sw=2 expandtab
autocmd Filetype javascript setlocal ts=2 sw=2 expandtab

" ctrlp settings
set runtimepath^=~/.vim/bundle/ctrlp.vim

if executable('rg')
  set grepprg=rg\ --color=never
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob "" --hidden'
  let g:ctrlp_use_caching = 0
  let g:ctrlp_show_hidden = 1
endif

" airline settings
let g:airline_powerline_fonts = 1

" Ctrl-n to open nerdtree
map <C-n> :NERDTreeToggle<CR>

" colorscheme luna
syntax on
color dracula
set t_Co=256
set background=dark
highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE


autocmd Filetype cpp setlocal tabstop=4

nnoremap <SPACE> <Nop>
let mapleader = " "
nnoremap <Leader>v :e $MYVIMRC<CR>
nnoremap <Leader>s :source ~/.vimrc<CR>
nnoremap <Leader>t :Tab /= <CR>
nnoremap <Leader>y :Tab /:\zs/l0l1
