-- theme_setup_func = require('github-theme').setup
-- local reset_func = require('feline').reset_highlights

-- vim.cmd(':command! -nargs=? Chtheme lua get_time_and_set_theme("<args>")')
-- get_time_and_set_theme()

vim.g.neon_style = "default"
vim.g.neon_italic_keyword = true
vim.g.neon_italic_function = true
-- vim.g.neon_transparent = true

vim.cmd[[colorscheme neon]]
