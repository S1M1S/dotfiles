require('compe').setup {
  enabled = true,
  autocomplete = true,
  min_length = 1,
  preselect = 'enable',
  max_abbr_width = 100,
  max_kind_width = 100,
  max_menu_width = 100,
  documentation = true,

  source = {
    -- nvim_lsp = true,
    path = true,
    buffer = true,
    vsnip = true,
  },
}

require('nvim-autopairs').setup()
require("nvim-autopairs.completion.compe").setup({
  map_cr = true, --  map <CR> on insert mode
  map_complete = true -- it will auto insert `(` after select function or method item
})

-- set up tab completion for nvim-compe
local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end
local check_back_space = function()
  local col = vim.fn.col('.') - 1
  if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
    return true
  else
    return false
  end
end
-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  elseif vim.fn.call("vsnip#available", {1}) == 1 then
    return t "<Plug>(vsnip-expand-or-jump)"
  elseif check_back_space() then
    return t "<Tab>"
  else
    return vim.fn['compe#complete']()
  end
end
_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  elseif vim.fn.call("vsnip#jumpable", {-1}) == 1 then
    return t "<Plug>(vsnip-jump-prev)"
  else
    -- If <S-Tab> is not working in your terminal, change it to <C-h>
    return t "<S-Tab>"
  end
end
vim.api.nvim_set_keymap("i", "<Tab>",     "v:lua.tab_complete()",       {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>",     "v:lua.tab_complete()",       {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>",   "v:lua.s_tab_complete()",     {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>",   "v:lua.s_tab_complete()",     {expr = true})
-- vim.api.nvim_set_keymap("i", "<CR>",      "compe#confirm('<CR>')",      {expr = true, silent = true})
vim.api.nvim_set_keymap("i", "<leader>c", "compe#close('<leader>c')",   {expr = true, silent = true})

--Cosmetics
-- vim.g.seoul256_italic_comments = true
-- vim.g.seoul256_italic_keywords = true
-- vim.g.seoul256_italic_functions = true
-- require("seoul256").set()

-- require("lualine").setup {
--   options = {
--     options = {theme = "seoul256"}
--   }
-- }

require('nvim-web-devicons').setup {
  default = true;
}

require("bufferline").setup {
  options = {
    diagnostics = "nvim_lsp",
    offsets = {{filetype = "NvimTree", text = "File Explorer", highlight = "Directory"}},
    separator_style = "thin",
    sort_by = "extension",
  }
}

require("telescope").setup{
  defaults = {
    winblend = 10
  }
}

-- require('shade').setup{
--   overlay_opacity = 70,
-- }
