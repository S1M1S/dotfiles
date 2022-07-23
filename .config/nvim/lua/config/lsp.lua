local map_old = require('config.utils').map

-- local lsp_installer = require('nvim-lsp-installer')

-- lsp_installer.on_server_ready(function(server)
--   local opts = {}
--   server:setup(opts)
-- end)

require('nvim-lsp-installer').setup()

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local on_attach = function(client, bufnr)
  local bufopts = {
    silent = true,
    buffer = bufnr,
  }

  map_old('n', 'gld', vim.lsp.buf.definition, bufopts)
  map_old('n', 'gh', vim.lsp.buf.hover, bufopts)
  map_old('n', 'gws', vim.lsp.buf.workspace_symbol, bufopts)
  map_old('n', 'gof', vim.diagnostic.open_float, bufopts)
  map_old('n', 'gca', vim.lsp.buf.code_action, bufopts)
  map_old('n', 'grr', vim.lsp.buf.references, bufopts)
  map_old('n', 'grn', vim.lsp.buf.rename, bufopts)
  map_old('n', 'gsh', vim.lsp.buf.signature_help, bufopts)

  -- start up vim illuminate
  require 'illuminate'.on_attach(client)
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
