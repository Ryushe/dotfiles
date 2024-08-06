set runtimepath +=~/configs/.vimrc
nnoremap <Enter> o <ESC>
nnoremap <S-Enter> O <ESC>

nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
nnoremap n nzzzv
nnoremap N Nzzzv
imap jj <Esc>
imap jk <Esc>

map <C-c> "+y
map <C-v> "+p

" turn syntax on
syntax on

" number lines
set number
set relativenumber
set tabstop=4
set shiftwidth=4
set expandtab
set clipboard+=unnamedplus
