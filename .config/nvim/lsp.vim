lua << EOF
local nvim_lsp = require('lspconfig')

--Setup for Neovim LSP
--Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    'documentation',
    'detail',
    'additionalTextEdits',
  }
}

require("lspconfig").html.setup {
  capabilities = capabilities,
  filetypes = { "html", "erb" },
}
require("lspconfig").solargraph.setup{
  capabilities = capabilities,
  settings = {
    settings = {
      solargraph = {
        useBundler = true,
        autoformat = true
      }
    }
  }
}
require('lspconfig').stylelint_lsp.setup{}

local function setup_servers()
  require'lspinstall'.setup()
  local servers = require'lspinstall'.installed_servers()
  for _, server in pairs(servers) do
    require'lspconfig'[server].setup{}
  end
end

setup_servers()

-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
require'lspinstall'.post_install_hook = function ()
  setup_servers() -- reload installed servers
  vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
end

require('lsp_signature').on_attach()

-- Use an on_attach function to only map the following keys 
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', '<leader>ld', ':lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', '<leader>lD', ':lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', '<leader>lk', ':lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', '<leader>li', ':lua vim.lsp.buf.implementation()<CR>', opts)
  -- buf_set_keymap('n', '<C-k>', ':lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<leader>lr', ':lua vim.lsp.buf.rename()<CR>', opts)
  -- buf_set_keymap('n', '<space>ca', ':lua vim.lsp.buf.code_action()<CR>', opts)
  -- buf_set_keymap('n', '<leader>le', ':lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<leader>lx', ':lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', ':lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', ':lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<leader>lf', ':lua vim.lsp.buf.formatting()<CR>', opts)
end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { "solargraph", "html", "stylelint_lsp" }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup { on_attach = on_attach }
end
EOF
