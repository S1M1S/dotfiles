require('nvim-treesitter.configs').setup {
  ensure_installed = {
    "json",
    "vim",
    "lua",
    "http",
    "dockerfile",
    "rust",
    "yaml",
    "css",
    "scss",
    "javascript",
    "markdown",
    "ruby",
    "toml"
  },
  auto_install = true,

  indent = {
    enable = true,
  },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  autotag = {
    enable = true,
  },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
  textsubjects = {
    enable = true,
    keymaps = { ['.'] = "textsubjects-smart", },
  },
  refactor = {
    smart_rename = { enable = true, keymaps = { smart_rename = "gtrn", }, },
    navigation =   { enable = true, keymaps = { goto_definition_lsp_fallback = "gtd", }, },
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
        ["ab"] = "@block.outer",
        ["ib"] = "@block.inner",
      },
    },
  },
}

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.fillchars = "fold: "
vim.opt.foldtext = [[substitute(getline(v:foldstart),'\\t',repeat('\ ',&tabstop),'g').'...'.trim(getline(v:foldend)) . ' (' . (v:foldend - v:foldstart + 1) . ' lines)']]

vim.opt.foldlevel = 2
vim.opt.foldnestmax = 3
vim.opt.foldminlines = 1
