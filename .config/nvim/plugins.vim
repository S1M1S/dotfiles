" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
      \| PlugInstall --sync | source $MYVIMRC
      \| endif

" Plugins will be downloaded under the specified directory.
call plug#begin(stdpath('data') . '/plugged')

" ================ Plugins ========================

" TPope plugins
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-dispatch'
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

" Emmet for <C-y>, emmeting
Plug 'mattn/emmet-vim'

" Cosmetics
Plug 'kyazdani42/nvim-web-devicons'
Plug 'bluz71/vim-nightfly-guicolors'
" Plug 'hoob3rt/lualine.nvim'
Plug 'bluz71/vim-moonfly-statusline'
let g:nightflyCursorColor = 1
let g:moonflyIgnoreDefaultColors = 1
let g:moonflyWithNvimLspIndicator = 1
let g:moonflyWithNerdIcon = 1
let g:moonflyWithGitBranchCharacter = 1

Plug 'akinsho/nvim-bufferline.lua'
Plug 'sunjon/shade.nvim'
let g:nvim_tree_width = 40

" Allow write readonly
Plug 'lambdalisue/suda.vim'
cnoremap w!! SudaWrite

" Parsing
Plug 'neovim/nvim-lspconfig'
Plug 'kabouzeid/nvim-lspinstall'
Plug 'ray-x/lsp_signature.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Set up snippets!
Plug 'rafamadriz/friendly-snippets'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'hrsh7th/nvim-compe'
Plug 'windwp/nvim-autopairs'

" allow HTML snippets in .html.erb
let g:vsnip_filetypes = {}
let g:vsnip_filetypes.eruby = ['html']

" Set up project searching with telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Racing around docs
Plug 'ggandor/lightspeed.nvim'

" Project tree
Plug 'kyazdani42/nvim-tree.lua'

" Misc, handy for development
Plug 'famiu/nvim-reload'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()
