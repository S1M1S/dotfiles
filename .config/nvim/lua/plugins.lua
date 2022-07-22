-- Reload this file on write
vim.cmd([[autocmd BufWritePost plugins.lua source <afile> | PackerCompile]])

return require('packer').startup(function()
  use 'wbthomason/packer.nvim'

  use {
    'tpope/vim-sensible',

    -- Convenience plugins
    -- { 'mattn/emmet-vim', keys = {{ 'i', '<C-y>' }} }, -- Emmet
    -- { 'rstacruz/vim-hyperstyle', ft = { 'css' } },
    {
      'ggandor/leap.nvim', -- Racing around docs with s and S
      config = [[require('leap').set_default_keymaps()]],
    },

    -- TPope plugins necessary for survival
    -- { 'tpope/vim-abolish', cmd = { 'S', 'Subvert', 'Abolish' } },
    'tpope/vim-commentary',
    { 'tpope/vim-dispatch', cmd = { 'Dispatch', 'Make', 'Focus', 'Start' } },
    { 'tpope/vim-endwise', ft = { 'rb', 'erb', 'sh', 'zsh', 'lua', 'vim' } },
    'tpope/vim-repeat',
    'tpope/vim-surround',
    'tpope/vim-unimpaired', -- this is the one that lets me put an empty line up above
    { 'tpope/vim-ragtag', ft = { 'html', 'eruby' } },
    { 'tpope/vim-rails', config = [[require('config.rails')]] },
    'tpope/vim-bundler',
    'lambdalisue/suda.vim',

    -- ALE for linting and fixing
    { 'dense-analysis/ale', config = [[require('config.ale')]] },

    -- Syntax highlighting
    { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' },
    { 'nvim-treesitter/nvim-treesitter-context' },
    { 'nvim-treesitter/nvim-treesitter-textobjects' },
    { 'rrethy/nvim-treesitter-textsubjects', config = [[require('config.treesitter')]] },

    -- { 'rafamadriz/neon', config = [[require('config.theme')]] },
    { 'sainnhe/everforest', config = [[require('config.theme')]] },
    'rrethy/vim-illuminate',

    -- LSP
    { 'neovim/nvim-lspconfig', },
    { 'williamboman/nvim-lsp-installer', },
    { 'onsails/lspkind-nvim', config = [[require('config.lsp')]] },

    -- Snippets
    {
      'L3MON4D3/LuaSnip',
      wants = "friendly-snippets",
      requires = {
        'rafamadriz/friendly-snippets',
        'saadparwaiz1/cmp_luasnip',
      },
      config = [[require('config.luasnip')]],
    },
    -- set up github copilot - see the github page for copilot.lua
    { 'github/copilot.vim', run = ':Copilot', disable = true },
    {
      'zbirenbaum/copilot.lua',
      event = {'VimEnter'},
      config = function()
        vim.defer_fn(function()
          require('copilot').setup({
            enabled = true,
            method = "getCompletionsCycling",
          })
        end, 100)
      end,
    },
    { 'zbirenbaum/copilot-cmp', module = 'copilot_cmp' },
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    { 'hrsh7th/nvim-cmp', config = [[require('config.cmp')]] },

    -- let's see if autopairs are any good
    -- { "windwp/nvim-autopairs", config = function() require("nvim-autopairs").setup {} end },

    -- Git
    { 'tpope/vim-fugitive' },
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
