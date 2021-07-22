-- Reload this file on write
vim.cmd([[autocmd BufWritePost plugins.lua source <afile> | PackerCompile]])

return require('packer').startup(function()
  use 'wbthomason/packer.nvim'

  -- Convenience plugins
  use {
    { 'mattn/emmet-vim', keys = {{ 'i', '<C-y>' }} }, -- Emmet
    'rstacruz/vim-closer', -- Closes parenthesis
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

  -- Snippets
  use {
    'hrsh7th/nvim-compe',
    config = [[require('config.compe')]],
    event = 'InsertEnter *',
    requires = {
      'hrsh7th/vim-vsnip',
      'hrsh7th/vim-vsnip-integ',
      'rafamadriz/friendly-snippets',
    }
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
    ft = { 'lua', 'sh', 'zsh', 'bash', 'html', 'markdown', 'vim', 'ruby', 'javascript' },
    config = 'vim.cmd[[ALEEnable]]'
  }

  -- Syntax highlighting
  use {
    'nvim-treesitter/nvim-treesitter',
    requires = {
      'nvim-treesitter/nvim-treesitter-refactor',
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    run = ':TSUpdate'
  }
  use { 'cespare/vim-toml', ft = { 'toml' } }

  -- LSP
  use {
    'neovim/nvim-lspconfig',
    { 'kabouzeid/nvim-lspinstall', config = [[require('config.lspinstall')]] },
    'onsails/lspkind-nvim'
  }

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
    requires = { { 'nvim-lua/popup.nvim' }, { 'nvim-lua/plenary.nvim' } },
    setup = [[require('config.telescope_setup')]],
    config = [[require('config.telescope')]],
    cmd = 'Telescope',
  }
  use {
    'nvim-telescope/telescope-cheat.nvim',
    requires = { 'tami5/sql.nvim' },
    config = [[require('telescope').load_extension('cheat')]],
    after = 'telescope.nvim',
  }

  -- Cosmetics
  use {
    {
      'famiu/feline.nvim',
      config = [[require('config/feline').setup()]],
      requires = { 'kyazdani42/nvim-web-devicons' },
    },
    { 'kyazdani42/nvim-tree.lua', config = [[require('config.tree')]], requires = { 'kyazdani42/nvim-web-devicons' } },
    { 'projekt0n/github-nvim-theme', config = [[require('config.theme')]] },
  }
end)
