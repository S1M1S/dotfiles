-- Reload this file on write
vim.cmd([[autocmd BufWritePost plugins.lua source <afile> | PackerCompile]])

return require('packer').startup(function()
  use 'wbthomason/packer.nvim'

  -- Convenience plugins
  use {
    { 'mattn/emmet-vim', keys = {{ 'i', '<C-y>' }} }, -- Emmet
    { 'rstacruz/vim-hyperstyle', ft = { 'css' } },
    { 'ggandor/lightspeed.nvim', -- Racing around docs with s and S
      keys = {
        { 'n', 's' },
        { 'n', 'S' },
        { 'n', 't' },
        { 'n', 'T' },
        { 'n', 'f' },
        { 'n', 'F' },
      }
    },
  }

  -- TPope plugins necessary for survival
  use {
    { 'tpope/vim-abolish', cmd = { 'S', 'Subvert', 'Abolish' } },
    { 'tpope/vim-commentary', keys = 'gcc', cmd = { 'Commentary' } },
    { 'tpope/vim-dispatch', cmd = { 'Dispatch', 'Make', 'Focus', 'Start' } },
    { 'tpope/vim-endwise', ft = { 'rb', 'erb', 'sh', 'zsh', 'lua', 'vim' } },
    { 'tpope/vim-eunuch', cmd = { 'Delete', 'Move', 'Rename', 'Chmod', 'Mkdir', 'Clocate', 'SudoWrite', 'SudoEdit' } },
    { 'tpope/vim-repeat', keys = '.' },
    'tpope/vim-sensible',
    'tpope/vim-surround',
    'tpope/vim-unimpaired',
    { 'tpope/vim-ragtag', ft = { 'html', 'erb' } },
    { 'tpope/vim-rails', config = [[require('config.rails')]] },
    { 'tpope/vim-bundler' },
  }

  -- ALE for linting and fixing
  use {
    'w0rp/ale',
    ft = {
      'bash',
      'html',
      'javascript',
      'json',
      'lua',
      'markdown',
      'ruby',
      'sh',
      'vim',
      'zsh',
    },
    config = 'vim.cmd[[ALEEnable]]'
  }

  -- Syntax highlighting
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use { 'nvim-treesitter/nvim-treesitter-context' }
  use { 'nvim-treesitter/nvim-treesitter-textobjects' }
  use { 'rrethy/nvim-treesitter-textsubjects' }
  require('config.treesitter')

  use { 'rafamadriz/neon', config = [[require('config.theme')]] }

  -- LSP
  use { 'neovim/nvim-lspconfig', }
  use { 'williamboman/nvim-lsp-installer', }
  use { 'onsails/lspkind-nvim' }
  require('config.lsp')

  -- Snippets
  use { 'hrsh7th/nvim-cmp', }
  use { 'hrsh7th/cmp-vsnip', requires = { 'hrsh7th/vim-vsnip' } }
  use { 'hrsh7th/cmp-nvim-lsp' }
  use { 'hrsh7th/cmp-buffer' }
  use { 'hrsh7th/cmp-path' }
  use { 'rafamadriz/friendly-snippets' }
  require('config.cmp')

  -- let's see if autopairs are any good
  use { "windwp/nvim-autopairs", config = function() require("nvim-autopairs").setup {} end }
  -- Git
  use {
    { 'tpope/vim-fugitive', cmd = { 'Git', 'Gstatus', 'Gblame', 'Gpush', 'Gpull' }, disable = true },
    {
      'lewis6991/gitsigns.nvim',
      requires = { 'nvim-lua/plenary.nvim' },
      config = [[require('config.gitsigns')]],
      event = 'BufEnter',
    },
    { 'TimUntersberger/neogit', keys = '<leader>g', cmd = 'Neogit', config = [[require('config.neogit')]] },
  }

  -- Search
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      { 'nvim-lua/popup.nvim' },
      { 'nvim-lua/plenary.nvim' },
    },
    config = [[require('config.telescope')]]
  }
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
  use {
    'nvim-telescope/telescope-cheat.nvim',
    requires = { 'tami5/sql.nvim' },
    config = [[require('telescope').load_extension('cheat')]],
    after = 'telescope.nvim',
  }

  -- Lines
  use { 'nvim-lualine/lualine.nvim', config = [[require('config.lualine')]] }
  use { 'kyazdani42/nvim-tree.lua', config = [[require('config.tree')]], requires = { 'kyazdani42/nvim-web-devicons' } }
  use { 'akinsho/bufferline.nvim', config = [[require('config.bufferline')]], requires = { 'kyazdani42/nvim-web-devicons' } }
  use { 'moll/vim-bbye' }

  -- Markdown
  use { 'gabrielelana/vim-markdown', ft = 'markdown', config = [[require('config.markdown')]], }
end)
