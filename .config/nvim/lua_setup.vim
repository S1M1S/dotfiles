lua << EOF
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

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})

--Setup for Neovim LSP
--Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require("lspconfig").html.setup {
  capabilities = capabilities
}

vim.lsp.set_log_level("debug")
require("lspconfig").solargraph.setup{
  capabilities = capabilities,
}

vim.g.seoul256_italic_comments = true
vim.g.seoul256_italic_keywords = true
vim.g.seoul256_italic_functions = true
vim.g.seoul256_disable_background = true
vim.g.seoul256_italic_variables = true
require("seoul256").set()

require("lualine").setup {
  options = {
    options = {theme = "seoul256"}
  }
}

require'nvim-web-devicons'.setup {
  default = true;
}

local tree = {}
tree.open = function ()
  require'nvim-tree'.find_file(true)
  require'bufferline.state'.set_offset(40, 'FileTree')
end
tree.close = function ()
  require'nvim-tree'.close()
  require'bufferline.state'.set_offset(0)
end
tree.closed = true
_G.tree_toggle = function()
  if tree.closed == true then
    tree.open()
    tree.closed = false
  else
    tree.close()
    tree.closed = true
  end
end
vim.api.nvim_set_keymap("n", "<leader>t", "v:lua tree_toggle()<CR>", {noremap = true})
EOF
