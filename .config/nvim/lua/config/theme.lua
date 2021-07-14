local set_theme = function(theme)
  require('github-theme').setup({ themeStyle = theme })
end

set_theme('dark')

return { set_theme = set_theme }
