local map = require('config.utils').map

require'nvim-tree'.setup {
  disable_netrw       = true,
  open_on_setup       = false,
  ignore_ft_on_setup  = {},
  update_to_buf_dir   = {
    enable = true,
    auto_open = true,
  },
  auto_close          = true,
  open_on_tab         = false,
  hijack_cursor       = false,
  update_cwd          = true,
  diagnostics         = {
    enable = false,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    }
  },
  update_focused_file = {
    enable      = true,
    update_cwd  = true,
    ignore_list = {}
  },
  git = {
    enable = true,
    ignore = true,
  },
  view = {
    width = 30,
    height = 30,
    side = 'left',
    auto_resize = false,
    number = false,
    relativenumber = false,
    mappings = {
      custom_only = false,
      list = {}
    }
  },
  filters = {
    dotfiles = false,
  }
}

function fix_nvim_tree()
  local toggle = require('nvim-tree').toggle
  toggle()
  toggle()
end

map('n', '<leader>t', '<cmd>NvimTreeToggle<cr>', { silent = true })
