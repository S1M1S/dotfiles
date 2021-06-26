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
" Plug 'kana/vim-textobj-user'
" Plug 'kana/vim-textobj-indent'
Plug 'junegunn/seoul256.vim'
" Plug 'junegunn/goyo.vim'
" Plug 'junegunn/limelight.vim'
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
" Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'christoomey/vim-tmux-navigator'
" Plug 'nelstrom/vim-textobj-rubyblock'
" Plug 'cespare/vim-toml'
" Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'mattn/emmet-vim'
" Plug 'dense-analysis/ale'
" Plug 'ludovicchabant/vim-gutentags'

" if has('nvim')
"   Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" else
"   Plug 'Shougo/deoplete.nvim'
"   Plug 'roxma/nvim-yarp'
"   Plug 'roxma/vim-hug-neovim-rpc'
" endif
" let g:deoplete#enable_at_startup = 1

Plug 'lambdalisue/suda.vim'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Set up snippets!
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'rafamadriz/friendly-snippets'

set completeopt=menuone,noselect
Plug 'hrsh7th/nvim-compe'
Plug 'tzachar/compe-tabnine', { 'do': './install.sh' }
let g:compe = {}
let g:compe.enabled = v:true
let g:compe.source = {
      \ 'buffer': v:true,
      \ 'spell': v:true,
      \ 'nvim_lsp': v:true,
      \ 'tabnine': v:true,
      \ }

" Set up project searching with telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()


lua << EOF
  -- set up tab completion for nvim-compe
  local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
  end

  local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
      return true
    else
      return false
    end
  end

  -- Use (s-)tab to:
  --- move to prev/next item in completion menuone
  --- jump to prev/next snippet's placeholder
  _G.tab_complete = function()
    if vim.fn.pumvisible() == 1 then
      return t "<C-n>"
    elseif vim.fn.call("vsnip#available", {1}) == 1 then
      return t "<Plug>(vsnip-expand-or-jump)"
    elseif check_back_space() then
      return t "<Tab>"
    else
      return vim.fn['compe#complete']()
    end
  end

  _G.s_tab_complete = function()
    if vim.fn.pumvisible() == 1 then
      return t "<C-p>"
    elseif vim.fn.call("vsnip#jumpable", {-1}) == 1 then
      return t "<Plug>(vsnip-jump-prev)"
    else
      -- If <S-Tab> is not working in your terminal, change it to <C-h>
      return t "<S-Tab>"
    end
  end

  vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
  vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
  vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
  vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})

  --Setup for Neovim LSP
  --Enable (broadcasting) snippet capability for completion
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true

  require'lspconfig'.html.setup {
    capabilities = capabilities,
  }
  require'lspconfig'.solargraph.setup{
    capabilities = capabilities,
  }
EOF

source ~/.vimrc
