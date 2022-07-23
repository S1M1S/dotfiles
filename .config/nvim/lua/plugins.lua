-- Reload this file on write
vim.cmd([[autocmd BufWritePost plugins.lua source <afile> | PackerCompile]])

return require('packer').startup(function(use)
  use {
    'wbthomason/packer.nvim',
    'lewis6991/impatient.nvim',
    'nathom/filetype.nvim',
    'nvim-lua/plenary.nvim',
    'iron-e/nvim-cartographer', -- mapping convenience function
  }

  -- set up theme
  use {
    'sainnhe/everforest',
    config = function()
      require('config.theme')
    end,
  }

  -- set up dashboard
  use {
    'glepnir/dashboard-nvim',
    config = function()
      require('config.dashboard')
    end,
  }

  -- automatic saving and loading of sessions
  use {
    'rmagatti/auto-session',
    config = function()
      require('config.auto-session')
    end,
  }

  -- statusline
  use {
    'nvim-lualine/lualine.nvim',
    config = function()
      require('config.lualine')
    end,
  }

  -- bufferline/tabline
  use {
    'akinsho/bufferline.nvim',
    config = function()
      require('config.bufferline')
    end,
    requires = {
      'kyazdani42/nvim-web-devicons',
      'moll/vim-bbye',
    },
  }

  -- prettier popups
  use 'stevearc/dressing.nvim'

  -- notification plugin
  use {
    'rcarriga/nvim-notify',
    config = function()
      vim.notify = require('notify')
    end,
  }

  -- file explorer
  use {
    'kyazdani42/nvim-tree.lua',
    config = function()
      require('config.tree')
    end,
    cmd = {
      'NvimTreeClipboard',
      'NvimTreeClose',
      'NvimTreeFindFile',
      'NvimTreeOpen',
      'NvimTreeRefresh',
      'NvimTreeToggle',
    },
    event = 'VimEnter',
  }

  -- auto-completion
  use {
    'hrsh7th/nvim-cmp',
    config = function()
      require('config.cmp')
    end,
    event = 'InsertEnter',
    requires = {
      {
        'L3MON4D3/LuaSnip',
        config = function()
          require('config.luasnip')
        end,
        requires = {
          'rafamadriz/friendly-snippets',
        },
      },
      { 'hrsh7th/cmp-nvim-lsp',     after = 'nvim-cmp', },
      { 'saadparwaiz1/cmp_luasnip', after = 'nvim-cmp', },
      { 'hrsh7th/cmp-buffer',       after = 'nvim-cmp', },
      { 'hrsh7th/cmp-path',         after = 'nvim-cmp', },
      -- set up github copilot - see the github page for copilot.lua
      {
        'zbirenbaum/copilot-cmp',
        module = 'copilot_cmp',
        after = 'nvim-cmp',
        requires = {
          {
            'zbirenbaum/copilot.lua',
            config = function()
              vim.defer_fn(function()
                require('copilot').setup()
              end, 100)
            end,
            event = 'VimEnter',
            requires = {
              { 'github/copilot.vim', run = ':Copilot', disable = true },
            },
          },
        },
      },
    },
  }

  -- lsp
  use {
    'neovim/nvim-lspconfig',
    config = function()
      require('config.lsp')
    end,
    event = 'BufWinEnter',
    after = 'cmp-nvim-lsp', -- cmp make capabilities referenced in this config
    requires = {
      'williamboman/nvim-lsp-installer',
      'onsails/lspkind-nvim',
      'rrethy/vim-illuminate',
    },
  }

  -- file auto fixing
  use {
    'dense-analysis/ale',
    config = function()
      require('config.ale')
    end,
  }

  -- git commands
  use 'tpope/vim-fugitive'

  -- git ui
  use  {
    'TimUntersberger/neogit',
    config = function()
      require('config.neogit')
    end,
    keys = '<leader>g',
    cmd = 'Neogit',
  }

  -- git signs
  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('config.gitsigns')
    end,
    event = 'BufWinEnter',
  }

  -- file traversal
  use {
    'ggandor/leap.nvim', -- Racing around docs with s and S
    config = function()
      require('leap').set_default_keymaps()
    end,
  }

  -- split improvements
  use {
    'beauwilliams/focus.nvim',
    config = function()
      require('config.focus')
    end,
  }

  -- escape sequence without lag
  use {
    'max397574/better-escape.nvim',
    config = function()
      -- TODO: fix when recording macros
      require('better_escape').setup {
        mapping = 'jk',
      }
    end,
  }

  use 'tpope/vim-endwise'    -- inserts end
  use 'tpope/vim-repeat'     -- enable dot repeat
  use 'tpope/vim-surround'   -- change surrounding
  use 'tpope/vim-unimpaired' -- insert lines above/below

  -- html tag inserter
  use {
    'tpope/vim-ragtag',
    ft = {
      'html',
      'eruby',
    },
  }

  -- rails helper functions
  use {
    'tpope/vim-rails',
    config = function()
      require('config.rails')
    end,
    requires = {
      'tpope/vim-bundler',
    },
  }

  -- provides suda command for sudo writing files
  use 'lambdalisue/suda.vim'

  -- markdown preview
  use {
    'gabrielelana/vim-markdown',
    ft = 'markdown',
    config = function()
      require('config.markdown')
    end,
  }

  -- DAP for debugging
  use {
    'mfussenegger/nvim-dap',
    config = function()
      require('config.dap')
    end,
  }

  -- file navigation and searching
  use {
    'nvim-telescope/telescope.nvim',
    config = [[require('config.telescope')]],
    event = 'BufWinEnter',
    requires = {
      'nvim-lua/popup.nvim',
      'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        run = 'make',
      },
    },
  }

  -- lang/syntax stuff
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function()
      require('config.treesitter')
    end,
    requires = {
      'nvim-treesitter/nvim-treesitter-context',
      'windwp/nvim-ts-autotag',
      'rrethy/nvim-treesitter-textsubjects',
      'nvim-treesitter/nvim-treesitter-refactor',
      'nvim-treesitter/nvim-treesitter-textobjects',
      'JoosepAlviste/nvim-ts-context-commentstring',
    },
  }

  -- commenting
  use {
    'numToStr/comment.nvim',
    config = function()
      require('Comment').setup()
    end,
  }
end)
