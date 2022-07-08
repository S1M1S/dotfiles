require'nvim-treesitter.configs'.setup {
  ensure_installed = { "json", "vim", "lua", "http", "dockerfile", "rust", "yaml", "css", "scss", "javascript", "markdown", "ruby", "toml" },
  -- activate custom nvim-treesitter plugins
  highlight = {
    enable = true,              -- false will disable the whole extension
    additional_vim_regex_highlighting = false,
  },
  -- Highlights definition and usages of the current symbol under the cursor
  refactor = {
    highlight_definitions = {
      enable = true,
      clear_on_cursor_move = true,
    },
    -- Highlights the block from the current scope where the cursor is.
    -- highlight_current_scope = {
      -- enable = true,
    -- },
    -- Renames the symbol under the cursor within the current scope (and current file)
    smart_rename = {
      enable = true,
      keymaps = {
        smart_rename = "grr"
      }
    }
  },
  textsubjects = {
    enable = true,
    prev_selection = ',', -- (Optional) keymap to select the previous selection
    keymaps = {
      ['.'] = "textsubjects-smart",
      [';'] = "textsubjects-container-outer",
      ['i;'] = "textsubjects-container-inner",
    },
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
        ["ab"] = "@block.outer",
        ["ib"] = "@block.inner",
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        ["]m"] = "@function.outer",
        ["]]"] = "@class.outer",
      },
      goto_next_end = {
        ["]M"] = "@function.outer",
        ["]["] = "@class.outer",
      },
      goto_previous_start = {
        ["[m"] = "@function.outer",
        ["[["] = "@class.outer",
      },
      goto_previous_end = {
        ["[M"] = "@function.outer",
        ["[]"] = "@class.outer",
      },
    },
  },
  autotag = {
    enable = true,
  },
}


vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.fillchars = "fold: "
vim.opt.foldtext = [[substitute(getline(v:foldstart),'\\t',repeat('\ ',&tabstop),'g').'...'.trim(getline(v:foldend)) . ' (' . (v:foldend - v:foldstart + 1) . ' lines)']]

vim.opt.foldlevel = 2
vim.opt.foldnestmax = 3
vim.opt.foldminlines = 1
