set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

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
call plug#begin(stdpath('data') . '/plugged')

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
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Set up snippets!
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'rafamadriz/friendly-snippets'

" Have to set this in order for tab completion to work
set completeopt=menuone,noselect
Plug 'hrsh7th/nvim-compe'
Plug 'tzachar/compe-tabnine', { 'do': './install.sh' }
let g:compe = {}
let g:compe.enabled = v:true
let g:compe.source = {
      \ 'tabnine': v:true,
      \ 'nvim_lsp': v:true,
      \ 'buffer': v:true,
      \ 'spell': v:true,
      \ }
set pumblend=15

" Set up project searching with telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Project tree
Plug 'kyazdani42/nvim-tree.lua'

" Misc, handy for development
Plug 'famiu/nvim-reload'

source ~/.vimrc

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" Needed for bufferline
set termguicolors

" Put a bunch of lua setup after the plug end call
source ~/dotfiles/.config/nvim/lua_setup.vim
