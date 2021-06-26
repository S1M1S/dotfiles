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

" Set up barbar shortcuts
nnoremap <silent> <A-,> <CMD>BufferPrevious<CR>
nnoremap <silent> <A-.> <CMD>BufferNext<CR>
nnoremap <silent> <A-<> :BufferMovePrevious<CR>
nnoremap <silent> <A->> :BufferMoveNext<CR>
nnoremap <silent> <A-c> <CMD>BufferClose<CR>
nnoremap <silent> <leader>bo <CMD>BufferOrderByDirectory<CR>
nnoremap <silent> <leader>s  <CMD>BufferPick<CR>

" Set up telescope shortcuts
nnoremap <C-p>      <cmd>lua require('telescope.builtin').git_files()<cr>
nnoremap <leader>pp <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>pg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>pb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>ph <cmd>lua require('telescope.builtin').help_tags()<cr>

" Easily write
nnoremap <leader>w :w<CR>

" No escape
inoremap jk <Esc>

" vv to generate new vertical split
nnoremap <silent> <leader>vv <C-w>v

" Ctrl+w to create a new tab page
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

Plug 'christoomey/vim-tmux-navigator'

" Color scheme
if !has ('nvim')
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'ryanoasis/vim-devicons'
  Plug 'junegunn/seoul256.vim'
  let g:seoul256_srgb = 1
  let g:airline_theme='seoul256'
  hi Normal guibg=NONE ctermbg=NONE

  colo seoul256

  " Configure Airline
  let g:airline_powerline_fonts = 1
  let g:airline#extensions#tabline#enabled = 1
endif
