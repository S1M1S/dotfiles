set runtimepath+=~/dotfiles/.config/nvim

" ================ General =====================

" Catch typos
set spelllang=en_au,en_us

" More natural defaults for opening splits
set splitbelow
set splitright

" set line numbering
set number
set relativenumber

" Turn on syntax highlighting
syntax on

" No messy swapfiles
set noswapfile
set nobackup
set nowb

" Instead, use ShaDa
" 1000 files, save global marks, 500 lines, nohl on startup
set shada='1000,f1,<500,h

" Set persistent undo
set history=500
set undolevels=1000
set undofile

" Get the mouse working
set mouse=a

" IDK why I put this here but oh well
filetype plugin indent on

" On pressing tab, insert 2 spaces
set expandtab
" show existing tab with 2 spaces width
set tabstop=2
set softtabstop=2
" when indenting with '>', use 2 spaces width
set shiftwidth=2

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·

" Handle line wrapping
set nowrap       "Don't wrap lines
set linebreak    "Wrap lines at convenient points

" Set scroll offset
set scrolloff=5

" if the vim window is resized, automatically adjust splits
au VimResized * wincmd =

" Transparent pop up menus
set pumblend=25

" Have to set this in order for tab completion to work
set completeopt=menuone,noselect

" ================ Mapping ======================

" Set mapleader
let mapleader=" "
let maplocalleader=","

" Set up movement shortcuts
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k

" Easily write
nnoremap <leader>w :w<CR>
nnoremap <leader>s :mks!<CR>

" Turn spell checking on and off
nnoremap <silent> <F8> :set spell!<CR>

" No escape
inoremap jk <Esc>

" vv to generate new vertical split
nnoremap <silent> vv <C-w>v

" Ctrl+w,n to create a new tab page
nnoremap <silent> <C-w>n <CMD>tabnew<CR>

" press enter to remove highlighting
nnoremap <silent> <CR> :nohlsearch<CR><CR>

" Rust checking and running
nnoremap <leader>cc :w<CR>:!cargo check<CR>
nnoremap <leader>cr :w<CR>:!cargo run<CR>
nnoremap <leader>ct :w<CR>:!cargo test<CR>

" Yank entire file into system clipboard
nnoremap <leader>ya gg"*yG<C-o>

" Show highlighting under cursor
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" Put a bunch of lua setup after the plug end call
" source ~/dotfiles/.config/nvim/plugins.vim
lua require('plugins')
lua require('chtheme')

set termguicolors

set guifont=JetBrainsMono\ Nerd\ Font\ Mono:h18
