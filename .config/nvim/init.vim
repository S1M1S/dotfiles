set runtimepath+=~/dotfiles/.config/nvim

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
      \| PlugInstall --sync | source $MYVIMRC
      \| endif

" Plugins will be downloaded under the specified directory.
call plug#begin(stdpath('data') . '/plugged')

" ================ Plugins ========================

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

" Tmux
Plug 'christoomey/vim-tmux-navigator'

" Cosmetics
Plug 'shaunsingh/seoul256.nvim'
Plug 'hoob3rt/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'akinsho/nvim-bufferline.lua'
let g:nvim_tree_width = 40

" Allow write readonly
Plug 'lambdalisue/suda.vim'
cnoremap w!! SudaWrite

" Parsing
Plug 'neovim/nvim-lspconfig'
Plug 'ray-x/lsp_signature.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Set up snippets!
Plug 'rafamadriz/friendly-snippets'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'hrsh7th/nvim-compe'
set pumblend=25
" Have to set this in order for tab completion to work
set completeopt=menuone,noselect
" allow HTML snippets in .html.erb
let g:vsnip_filetypes = {}
let g:vsnip_filetypes.eruby = ['html']

" Set up project searching with telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Project tree
Plug 'kyazdani42/nvim-tree.lua'

" Misc, handy for development
Plug 'famiu/nvim-reload'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

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

" ================ Mapping ======================

" Set mapleader
let mapleader=","

" Set up bufferline shortcuts
nnoremap <silent> <A-,> :BufferLineCyclePrev<CR>
nnoremap <silent> <A-.> :BufferLineCycleNext<CR>
nnoremap <silent> <A-<> :BufferLineMovePrev<CR>
nnoremap <silent> <A->> :BufferLineMoveNext<CR>
nnoremap <silent> <A-s> :BufferLineSortByExtension<CR>
nnoremap <silent> <A-c>c     :bp\|bd %<CR>
nnoremap <silent> <A-c>l     :BufferLineCloseRight<CR>
nnoremap <silent> <A-c>h     :BufferLineCloseLeft<CR>
nnoremap <silent> <leader>s  :BufferLinePick<CR>

" Set up telescope shortcuts
nnoremap <C-p>      <cmd>lua require('telescope.builtin').git_files()<cr>
nnoremap <leader>pp <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>pg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>pb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>ph <cmd>lua require('telescope.builtin').help_tags()<cr>

" Set up nvim-tree shortcuts
nnoremap <leader>t :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>

" Easily write
nnoremap <leader>w :w<CR>

" No escape
inoremap jk <Esc>

" vv to generate new vertical split
nnoremap <silent> vv <C-w>v

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

" Needed for bufferline
set termguicolors

" Put a bunch of lua setup after the plug end call
lua require('setup')
source ~/dotfiles/.config/nvim/lsp.vim
