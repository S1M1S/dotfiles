local map = require('config.utils').map
local silent = {silent = true}

local group_separator = function(group, hls, count)
  local fmt = string.format
  local padding = require("bufferline.constants").padding
  local space_end = function(hl_groups) return { { highlight = hl_groups.fill.hl, text = padding } } end
  local bg_hl = hls.fill.hl
  local name, display_name = group.name, group.display_name
  local sep_grp, label_grp = hls[fmt("%s_separator", name)], hls[fmt("%s_label", name)]
  local sep_hl = sep_grp and sep_grp.hl or hls.group_separator.hl
  local label_hl = label_grp and label_grp.hl or hls.group_label.hl
  local block = "█"
  local indicator = {
    { text = block, highlight = sep_hl },
    { text = display_name, highlight = label_hl },
    { text = block, highlight = sep_hl },
  }
  return { sep_start = indicator, sep_end = space_end(hls) }
end

require('bufferline').setup {
  options = {
    mode = "buffers", -- set to "tabs" to only show tabpages instead
    numbers = "none",
    close_command = "bdelete %d",       -- can be a string | function, see "Mouse actions"
    right_mouse_command = "bdelete %d", -- can be a string | function, see "Mouse actions"
    left_mouse_command = "buffer %d",    -- can be a string | function, see "Mouse actions"
    middle_mouse_command = nil,          -- can be a string | function, see "Mouse actions"
    -- NOTE: this plugin is designed with this icon in mind,
    -- and so changing this is NOT recommended, this is intended
    -- as an escape hatch for people who cannot bear it for whatever reason
    indicator_icon = '▎',
    -- buffer_close_icon = '',
    modified_icon = '●',
    -- close_icon = '',
    left_trunc_marker = '',
    right_trunc_marker = '',
    --- name_formatter can be used to change the buffer's label in the bufferline.
    --- Please note some names can/will break the
    --- bufferline so use this at your discretion knowing that it has
    --- some limitations that will *NOT* be fixed.
    name_formatter = function(buf)  -- buf contains a "name", "path" and "bufnr"
      -- remove extension from markdown files for example
      if buf.name:match('%.md') then
        return vim.fn.fnamemodify(buf.name, ':t:r')
      end
    end,
    max_name_length = 18,
    max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
    tab_size = 18,
    diagnostics = "nvim_lsp",
    diagnostics_update_in_insert = false,
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      return "("..count..")"
    end,
    -- NOTE: this will be called a lot so don't do any heavy processing here
    offsets = {{filetype = "NvimTree", text = "File Explorer"}},
    -- color_icons = true | false, -- whether or not to add the filetype icon highlights
    show_buffer_icons = true, -- disable filetype icons for buffers
    show_buffer_close_icons = false,
    -- show_buffer_default_icon = true | false, -- whether or not an unrecognised filetype should show a default icon
    -- show_close_icon = true | false,
    -- show_tab_indicators = true | false,
    -- can also be a table containing 2 custom separators
    -- [focused and unfocused]. eg: { '|', '|' }
    separator_style = "thin",
    -- enforce_regular_tabs = false | true,
    -- always_show_bufferline = true | false,
    sort_by = 'insert_after_current',
    groups = {
      options = {
        toggle_hidden_on_enter = true -- when you re-enter a hidden group this options re-opens that group so the buffer is visible
      },
      items = {
        {
          name = " shell",
          auto_close = true,  -- whether or not close this group if it doesn't contain the current buffer
          matcher = function(buf)
            return buf.name:match('zsh')
          end,
          separator = { style = group_separator },
        },
        {
          name = "", -- Mandatory
          matcher = function(buf) -- Mandatory
            return buf.name:match('%_test') or buf.name:match('%_spec')
          end,
          separator = { style = group_separator },
        },
      },
    },
  },
}

map('n', '<s-l>', [[:BufferLineCycleNext<cr>]])
map('n', '<s-h>', [[:BufferLineCyclePrev<cr>]])
map('n', '<c-w>', [[:Bdelete<cr>]])
