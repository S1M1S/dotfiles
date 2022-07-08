-- Reload this file on write
vim.cmd([[autocmd BufWritePost plugins.lua source <afile> | PackerCompile]])

return require('packer').startup(function()
  use 'wbthomason/packer.nvim'

  -- Convenience plugins
  use {
    { 'mattn/emmet-vim', keys = {{ 'i', '<C-y>' }} }, -- Emmet
    { 'rstacruz/vim-hyperstyle', ft = { 'css' } },
    {
      'ggandor/lightspeed.nvim', -- Racing around docs with s and S
      keys = {
        { 'n', 's' },
        { 'n', 'S' },
        { 'n', 't' },
        { 'n', 'T' },
        { 'n', 'f' },
        { 'n', 'F' },
      },
    },

    -- TPope plugins necessary for survival
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
    'tpope/vim-bundler',
    'lambdalisue/suda.vim',

    -- ALE for linting and fixing
    {
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
      config = [[vim.cmd('ALEEnable')]],
    },

    -- Syntax highlighting
    { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' },
    'nvim-treesitter/nvim-treesitter-context',
    'nvim-treesitter/nvim-treesitter-textobjects',
    { 'rrethy/nvim-treesitter-textsubjects', config = [[require('config.treesitter')]] },

    { 'rafamadriz/neon', config = [[require('config.theme')]] },

    -- LSP
    { 'neovim/nvim-lspconfig', },
    { 'williamboman/nvim-lsp-installer', },
    { 'onsails/lspkind-nvim', config = [[require('config.lsp')]] },

    -- Snippets
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'rafamadriz/friendly-snippets',
    { 'hrsh7th/nvim-cmp', config = [[require('config.cmp')]] },

    -- let's see if autopairs are any good
    { "windwp/nvim-autopairs", config = function() require("nvim-autopairs").setup {} end },

    -- Git
    { 'tpope/vim-fugitive', cmd = { 'Git', 'Gstatus', 'Gblame', 'Gpush', 'Gpull' }, disable = true },
    {
      'lewis6991/gitsigns.nvim',
      requires = { 'nvim-lua/plenary.nvim' },
      config = [[require('config.gitsigns')]],
      event = 'BufEnter',
    },
    { 'TimUntersberger/neogit', keys = '<leader>g', cmd = 'Neogit', config = [[require('config.neogit')]] },

    -- Search
    {
      'nvim-telescope/telescope.nvim',
      requires = {
        { 'nvim-lua/popup.nvim' },
        { 'nvim-lua/plenary.nvim' },
      },
      config = [[require('config.telescope')]]
    },
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
    },
    {
      'nvim-telescope/telescope-cheat.nvim',
      requires = { 'tami5/sql.nvim' },
      config = [[require('telescope').load_extension('cheat')]],
      after = 'telescope.nvim',
    },

    { 'lazytanuki/nvim-mapper', before = 'telescope.nvim' },

    -- Lines
    { 'nvim-lualine/lualine.nvim', config = [[require('config.lualine')]] },
    { 'kyazdani42/nvim-tree.lua', config = [[require('config.tree')]], requires = { 'kyazdani42/nvim-web-devicons' } },
    { 'akinsho/bufferline.nvim', config = [[require('config.bufferline')]], requires = { 'kyazdani42/nvim-web-devicons' } },
    'moll/vim-bbye',

    -- Markdown
    { 'gabrielelana/vim-markdown', ft = 'markdown', config = [[require('config.markdown')]] },
  }
end)
