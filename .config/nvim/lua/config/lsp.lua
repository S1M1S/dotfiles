local map = require('config.utils').map

-- local lsp_installer = require('nvim-lsp-installer')

-- lsp_installer.on_server_ready(function(server)
--   local opts = {}
--   server:setup(opts)
-- end)

require('nvim-lsp-installer').setup()

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    'documentation',
    'detail',
    'additionalTextEdits',
  },
}

local cmp_nvim_lsp = require('cmp_nvim_lsp')
capabilities = cmp_nvim_lsp.update_capabilities(capabilities)

local on_attach = function(client, bufnr)
  local bufopts = {
    -- silent = true,
    buffer = bufnr,
  }

  -- map('n', 'gd', vim.lsp.buf.definition, bufopts)
  map('n', 'K', vim.lsp.buf.hover, bufopts)
  map('n', '<leader>vws', vim.lsp.buf.workspace_symbol, bufopts)
  map('n', '<leader>vd', vim.diagnostic.open_float, bufopts)
  map('n', '[d', vim.diagnostic.goto_next, bufopts)
  map('n', ']d', vim.diagnostic.goto_prev, bufopts)
  map('n', '<leader>vca', vim.lsp.buf.code_action, bufopts)
  map('n', '<leader>vrr', vim.lsp.buf.references, bufopts)
  map('n', '<leader>vrn', vim.lsp.buf.rename, bufopts)
  map('i', '<C-h>', vim.lsp.buf.signature_help, bufopts)
end

local function config(_config)
	return vim.tbl_deep_extend("force", {
		capabilities = capabilities,
		on_attach = on_attach,
	}, _config or {})
end

require('lspconfig').solargraph.setup(config())
require('lspconfig').sumneko_lua.setup(config({
  settings = {
    Lua = {
			runtime = {
				-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
				version = "LuaJIT",
				-- Setup your lua path
				path = vim.split(package.path, ";"),
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { "vim" },
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
				},
			},
    },
  },
}))
