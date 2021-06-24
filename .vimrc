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

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.
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
else
  cnoremap w!! SudaWrite
endif

" ================ Mapping ======================

" Set mapleader
let mapleader=","

" Auto indent pasted text
" nnoremap p p=`]<C-o>
" nnoremap P P=`]<C-o>

" Move between buffers like tabs
nnoremap gb :bn<CR>
nnoremap gB :bp<CR>

" Sublime Text style CTRL+P
nnoremap <C-p> :GFiles<CR>

" No escape
" inoremap qq <Esc>
inoremap jk <Esc>

" vv to generate new vertical split
nnoremap <silent> vv <C-w>v

" Rust checking and running
nnoremap <leader>cc :w<CR>:!cargo check<CR>
nnoremap <leader>cr :w<CR>:!cargo run<CR>
nnoremap <leader>ct :w<CR>:!cargo test<CR>

nnoremap <silent> <CR> :nohlsearch<CR><CR>

" IDK why I put this here but oh well
filetype plugin on
filetype indent on
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

set nowrap       "Don't wrap lines
set linebreak    "Wrap lines at convenient points

" if the vim window is resized, automatically adjust splits
au VimResized * wincmd =

" ================ Rusty Tags =======================

autocmd BufRead *.rs :setlocal tags=./rusty-tags.vi;/

" ================ Custom Settings ========================

" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

" Plugins will be downloaded under the specified directory.
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

" Declare the list of plugins.
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-ragtag'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-indent'
Plug 'junegunn/seoul256.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'christoomey/vim-tmux-navigator'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'cespare/vim-toml'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'mattn/emmet-vim'
Plug 'dense-analysis/ale'
Plug 'ludovicchabant/vim-gutentags'
Plug 'codehearts/mascara-vim'
Plug 'lambdalisue/suda.vim'

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" Configure fzf
" Bigger preview window
let g:fzf_preview_window = ['right:60%', 'ctrl-/']

" Insert mode completion
inoremap <c-x><c-k> <plug>(fzf-complete-word)
inoremap <c-x><c-f> <plug>(fzf-complete-path)
inoremap <c-x><c-l> <plug>(fzf-complete-line)

" Tab completion for deoplete
function! s:check_back_space() abort "{{{
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ deoplete#manual_complete()

" Color scheme
colo seoul256
let g:seoul256_srgb = 1
let g:airline_theme='seoul256'

" Setup italics for VictorMono
highlight Comment cterm=italic
highlight Identifier cterm=italic
highlight Type cterm=italic
highlight htmlItalic cterm=italic
highlight markdownItalic cterm=italic

" Configure Airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
