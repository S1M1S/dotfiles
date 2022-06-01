require'nvim-treesitter.configs'.setup {
  ensure_installed = { "json", "vim", "lua", "http", "dockerfile", "rust", "yaml", "css", "scss", "javascript", "markdown", "ruby", "toml" },
  highlight = {
    enable = true,              -- false will disable the whole extension
    additional_vim_regex_highlighting = false,
  },
}
