require'nvim-treesitter.configs'.setup {
  ensure_installed = { "json", "vim", "lua", "http", "dockerfile", "rust", "yaml", "css", "scss", "javascript", "markdown", "ruby", "toml" },
  highlight = {
    enable = true,              -- false will disable the whole extension
--     additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true,
  }
}

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.fillchars = "fold: "
vim.opt.foldtext = [[substitute(getline(v:foldstart),'\\t',repeat('\ ',&tabstop),'g').'...'.trim(getline(v:foldend)) . ' (' . (v:foldend - v:foldstart + 1) . ' lines)']]

vim.opt.foldlevel = 2
vim.opt.foldnestmax = 3
vim.opt.foldminlines = 1
