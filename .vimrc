" ================ General =====================

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

" Handle linewrapping
set nowrap       "Don't wrap lines
set linebreak    "Wrap lines at convenient points

" if the vim window is resized, automatically adjust splits
au VimResized * wincmd =

" ================ Persistent Undo ==================

" Keep undo history across sessions, by storing in file.
if has('persistent_undo') && isdirectory(expand('~').'/.vim/backups')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
endif

" ================ Commands =====================

command! Bd  silent! execute "bp|bd#"
command! Bda silent! execute "%bd|e#|bd#"
command! Reload silent! execute "source $MYVIMRC"

if !has('nvim')
  cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!
endif

" ================ Mapping ======================

" Set mapleader
let mapleader=","

" Move between buffers like tabs
nnoremap gb :bn<CR>
nnoremap gB :bp<CR>

" Easily write
nnoremap <leader>w :w

" No escape
inoremap jk <Esc>

" vv to generate new vertical split
nnoremap <silent> <leader>vv <C-w>v

" press enter to remove highlighting
nnoremap <silent> <CR> :nohlsearch<CR><CR>

" Rust checking and running
nnoremap <leader>cc :w<CR>:!cargo check<CR>
nnoremap <leader>cr :w<CR>:!cargo run<CR>
nnoremap <leader>ct :w<CR>:!cargo test<CR>

" Yank entire file into system clipboard
nnoremap <leader>ya gg"*yG<C-o>

" ================ Rusty Tags =======================

if !has ('nvim')
  autocmd BufRead *.rs :setlocal tags=./rusty-tags.vi;/
endif

" ================ Custom Settings ========================

" TPope plugins
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-ragtag'

Plug 'ryanoasis/vim-devicons'
Plug 'christoomey/vim-tmux-navigator'

" Color scheme
if !has ('nvim')
  " Plug 'junegunn/seoul256.vim'
  " Plug 'vim-airline/vim-airline'
  " Plug 'vim-airline/vim-airline-themes'

  colo seoul256
  let g:seoul256_srgb = 1
  let g:airline_theme='seoul256'
  hi Normal guibg=NONE ctermbg=NONE

  " Configure Airline
  let g:airline_powerline_fonts = 1
  let g:airline#extensions#tabline#enabled = 1
endif

" Setup italics for VictorMono
highlight Comment         cterm=italic
highlight Identifier      cterm=italic
highlight Type            cterm=italic
highlight htmlItalic      cterm=italic
highlight markdownItalic  cterm=italic
