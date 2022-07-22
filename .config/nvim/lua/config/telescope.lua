local telescope = require('telescope')
local map = require('config.utils').map
local silent = {silent = true}

telescope.setup {
  defaults = {
    layout_strategy = 'flex',
    scroll_strategy = 'cycle',
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "--hidden",
    },
    mappings = {
      i = {
        ["<esc>"] = require('telescope.actions').close,
      },
    },
  },
}

map('n', '<c-a>', [[<cmd>Telescope buffers show_all_buffers=true sort_lastused=true<cr>]], silent)
map('n', '<c-d>', [[:lua require('telescope.builtin').find_files({ hidden=true })<cr>]], silent)
map('n', '<c-g>', [[:lua require('telescope.builtin').live_grep({ max_results=10 })<cr>]], silent)
map('n', '<leader>ch', [[<cmd>Telescope cheat fd<cr>]], silent)

map({'n', 'v', 'o'}, [[<leader>cm]], [[<cmd>Telescope mapper<cr>]], silent, 'Telescope', 'nvim-mapper', 'Open mapper cheatsheet')
