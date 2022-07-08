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
  },
}

require("nvim-mapper").setup {
  -- do not assign the default keymap (<leader>MM)
  no_map = true,
  -- where should ripgrep look for your keybinds definitions.
  -- Default config search path is ~/.config/nvim/lua
  search_path = os.getenv('HOME') .. '/dotfiles/.config/nvim/lua',
  -- what should be done with the selected keybind when pressing enter.
  -- Available actions:
  --   * "definition" - Go to keybind definition (default)
  --   * "execute" - Execute the keybind command
  action_on_enter = 'definition',
} 

map('n', '<c-a>', [[<cmd>Telescope buffers show_all_buffers=true sort_lastused=true<cr>]], silent)
map('n', '<c-d>', [[:lua require('telescope.builtin').find_files({ hidden=true })<cr>]], silent)
map('n', '<c-g>', [[:lua require('telescope.builtin').live_grep({ max_results=10 })<cr>]], silent)
map('n', '<leader>ch', [[<cmd>Telescope cheat fd<cr>]], silent)

map({'n', 'v', 'o'}, [[<leader>cm]], [[<cmd>Telescope mapper<cr>]], silent, 'Telescope', 'nvim-mapper', 'Open mapper cheatsheet')
