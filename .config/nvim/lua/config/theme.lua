theme_setup_func = require('github-theme').setup
local reset_func = require('feline').reset_highlights

local set_theme = function(theme)
  theme_setup_func({ themeStyle = theme, transparent = true })
  reset_func()
end

local set_theme_from_sunshine = function(chan_id, data, name)
  time = data[1]
  themes = { day = 'light', night = 'dark' }
  set_theme(themes[time])
end

function get_time_and_set_theme(override)
  if override and override ~= "" then
    set_theme(override)
  elseif vim.fn.executable('sunshine') then
    vim.fn.jobstart('sunshine -s "@-30 150"', { on_stdout = set_theme_from_sunshine })
  else
    set_theme('dark')
  end
end

vim.cmd(':command! -nargs=? Chtheme lua get_time_and_set_theme("<args>")')
get_time_and_set_theme()
