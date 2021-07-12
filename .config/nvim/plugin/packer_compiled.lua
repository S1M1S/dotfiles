-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/samri/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/samri/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/samri/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/samri/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/samri/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ale = {
    commands = { "ALEEnable" },
    config = { "vim.cmd[[ALEEnable]]" },
    loaded = false,
    needs_bufread = true,
    path = "/Users/samri/.local/share/nvim/site/pack/packer/opt/ale"
  },
  ["emmet-vim"] = {
    keys = { { "i", "<C-y>" } },
    loaded = false,
    needs_bufread = false,
    path = "/Users/samri/.local/share/nvim/site/pack/packer/opt/emmet-vim"
  },
  ["feline.nvim"] = {
    config = { "require('config/feline')" },
    loaded = true,
    path = "/Users/samri/.local/share/nvim/site/pack/packer/start/feline.nvim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/Users/samri/.local/share/nvim/site/pack/packer/start/friendly-snippets"
  },
  ["github-nvim-theme"] = {
    config = { "require('github-theme').setup()" },
    loaded = true,
    path = "/Users/samri/.local/share/nvim/site/pack/packer/start/github-nvim-theme"
  },
  ["gitsigns.nvim"] = {
    config = { "require('config.gitsigns')" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/samri/.local/share/nvim/site/pack/packer/opt/gitsigns.nvim"
  },
  ["lightspeed.nvim"] = {
    keys = { { "n", "s" }, { "n", "S" }, { "n", "t" }, { "n", "T" }, { "n", "f" }, { "n", "F" } },
    loaded = false,
    needs_bufread = false,
    path = "/Users/samri/.local/share/nvim/site/pack/packer/opt/lightspeed.nvim"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "/Users/samri/.local/share/nvim/site/pack/packer/start/lspkind-nvim"
  },
  neogit = {
    commands = { "Neogit" },
    config = { "require('config.neogit')" },
    loaded = false,
    needs_bufread = true,
    path = "/Users/samri/.local/share/nvim/site/pack/packer/opt/neogit"
  },
  ["nvim-compe"] = {
    after_files = { "/Users/samri/.local/share/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe.vim" },
    config = { "require('config.compe')" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/samri/.local/share/nvim/site/pack/packer/opt/nvim-compe"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/samri/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-lspinstall"] = {
    config = { "require('config.lspinstall')" },
    loaded = true,
    path = "/Users/samri/.local/share/nvim/site/pack/packer/start/nvim-lspinstall"
  },
  ["nvim-tree.lua"] = {
    loaded = true,
    path = "/Users/samri/.local/share/nvim/site/pack/packer/start/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/Users/samri/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-treesitter-refactor"] = {
    loaded = true,
    path = "/Users/samri/.local/share/nvim/site/pack/packer/start/nvim-treesitter-refactor"
  },
  ["nvim-treesitter-textobjects"] = {
    loaded = true,
    path = "/Users/samri/.local/share/nvim/site/pack/packer/start/nvim-treesitter-textobjects"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/samri/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/samri/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/samri/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/Users/samri/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["sql.nvim"] = {
    loaded = true,
    path = "/Users/samri/.local/share/nvim/site/pack/packer/start/sql.nvim"
  },
  ["telescope-cheat.nvim"] = {
    commands = { "Telescope cheat" },
    config = { "require('telescope').load_extension('cheat')" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/samri/.local/share/nvim/site/pack/packer/opt/telescope-cheat.nvim"
  },
  ["telescope.nvim"] = {
    commands = { "Telescope" },
    config = { "require('config.telescope')" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/samri/.local/share/nvim/site/pack/packer/opt/telescope.nvim"
  },
  ["vim-abolish"] = {
    commands = { "S", "Subvert", "Abolish" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/samri/.local/share/nvim/site/pack/packer/opt/vim-abolish"
  },
  ["vim-bundler"] = {
    commands = { "Bundle" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/samri/.local/share/nvim/site/pack/packer/opt/vim-bundler"
  },
  ["vim-closer"] = {
    loaded = true,
    path = "/Users/samri/.local/share/nvim/site/pack/packer/start/vim-closer"
  },
  ["vim-commentary"] = {
    commands = { "Commentary" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/samri/.local/share/nvim/site/pack/packer/opt/vim-commentary"
  },
  ["vim-dispatch"] = {
    commands = { "Dispatch", "Make", "Focus", "Start" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/samri/.local/share/nvim/site/pack/packer/opt/vim-dispatch"
  },
  ["vim-endwise"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/samri/.local/share/nvim/site/pack/packer/opt/vim-endwise"
  },
  ["vim-eunuch"] = {
    commands = { "Delete", "Move", "Rename", "Chmod", "Mkdir", "Clocate", "SudoWrite", "SudoEdit" },
    loaded = false,
    needs_bufread = false,
    path = "/Users/samri/.local/share/nvim/site/pack/packer/opt/vim-eunuch"
  },
  ["vim-ragtag"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/samri/.local/share/nvim/site/pack/packer/opt/vim-ragtag"
  },
  ["vim-rails"] = {
    loaded = true,
    path = "/Users/samri/.local/share/nvim/site/pack/packer/start/vim-rails"
  },
  ["vim-repeat"] = {
    keys = { { "", "." } },
    loaded = false,
    needs_bufread = false,
    path = "/Users/samri/.local/share/nvim/site/pack/packer/opt/vim-repeat"
  },
  ["vim-sensible"] = {
    loaded = true,
    path = "/Users/samri/.local/share/nvim/site/pack/packer/start/vim-sensible"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/Users/samri/.local/share/nvim/site/pack/packer/start/vim-surround"
  },
  ["vim-toml"] = {
    loaded = false,
    needs_bufread = true,
    path = "/Users/samri/.local/share/nvim/site/pack/packer/opt/vim-toml"
  },
  ["vim-unimpaired"] = {
    loaded = true,
    path = "/Users/samri/.local/share/nvim/site/pack/packer/start/vim-unimpaired"
  },
  ["vim-vsnip"] = {
    loaded = true,
    path = "/Users/samri/.local/share/nvim/site/pack/packer/start/vim-vsnip"
  },
  ["vim-vsnip-integ"] = {
    loaded = true,
    path = "/Users/samri/.local/share/nvim/site/pack/packer/start/vim-vsnip-integ"
  }
}

time([[Defining packer_plugins]], false)
-- Setup for: telescope.nvim
time([[Setup for telescope.nvim]], true)
require('config.telescope_setup')
time([[Setup for telescope.nvim]], false)
-- Config for: feline.nvim
time([[Config for feline.nvim]], true)
require('config/feline')
time([[Config for feline.nvim]], false)
-- Config for: nvim-lspinstall
time([[Config for nvim-lspinstall]], true)
require('config.lspinstall')
time([[Config for nvim-lspinstall]], false)
-- Config for: github-nvim-theme
time([[Config for github-nvim-theme]], true)
require('github-theme').setup()
time([[Config for github-nvim-theme]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
vim.cmd [[command! -nargs=* -range -bang -complete=file Focus lua require("packer.load")({'vim-dispatch'}, { cmd = "Focus", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file Start lua require("packer.load")({'vim-dispatch'}, { cmd = "Start", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file Clocate lua require("packer.load")({'vim-eunuch'}, { cmd = "Clocate", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file SudoWrite lua require("packer.load")({'vim-eunuch'}, { cmd = "SudoWrite", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file SudoEdit lua require("packer.load")({'vim-eunuch'}, { cmd = "SudoEdit", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file Telescope cheat lua require("packer.load")({'telescope-cheat.nvim'}, { cmd = "Telescope cheat", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file Neogit lua require("packer.load")({'neogit'}, { cmd = "Neogit", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file Bundle lua require("packer.load")({'vim-bundler'}, { cmd = "Bundle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file S lua require("packer.load")({'vim-abolish'}, { cmd = "S", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file Telescope lua require("packer.load")({'telescope.nvim'}, { cmd = "Telescope", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file ALEEnable lua require("packer.load")({'ale'}, { cmd = "ALEEnable", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file Chmod lua require("packer.load")({'vim-eunuch'}, { cmd = "Chmod", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file Move lua require("packer.load")({'vim-eunuch'}, { cmd = "Move", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file Make lua require("packer.load")({'vim-dispatch'}, { cmd = "Make", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file Subvert lua require("packer.load")({'vim-abolish'}, { cmd = "Subvert", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file Abolish lua require("packer.load")({'vim-abolish'}, { cmd = "Abolish", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file Mkdir lua require("packer.load")({'vim-eunuch'}, { cmd = "Mkdir", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file Commentary lua require("packer.load")({'vim-commentary'}, { cmd = "Commentary", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file Delete lua require("packer.load")({'vim-eunuch'}, { cmd = "Delete", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file Dispatch lua require("packer.load")({'vim-dispatch'}, { cmd = "Dispatch", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file Rename lua require("packer.load")({'vim-eunuch'}, { cmd = "Rename", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
time([[Defining lazy-load commands]], false)

-- Keymap lazy-loads
time([[Defining lazy-load keymaps]], true)
vim.cmd [[inoremap <silent> <C-y> <cmd>lua require("packer.load")({'emmet-vim'}, { keys = "<lt>C-y>" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> F <cmd>lua require("packer.load")({'lightspeed.nvim'}, { keys = "F", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> f <cmd>lua require("packer.load")({'lightspeed.nvim'}, { keys = "f", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> s <cmd>lua require("packer.load")({'lightspeed.nvim'}, { keys = "s", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> S <cmd>lua require("packer.load")({'lightspeed.nvim'}, { keys = "S", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> . <cmd>lua require("packer.load")({'vim-repeat'}, { keys = ".", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> t <cmd>lua require("packer.load")({'lightspeed.nvim'}, { keys = "t", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[nnoremap <silent> T <cmd>lua require("packer.load")({'lightspeed.nvim'}, { keys = "T", prefix = "" }, _G.packer_plugins)<cr>]]
time([[Defining lazy-load keymaps]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType vim ++once lua require("packer.load")({'vim-endwise', 'ale'}, { ft = "vim" }, _G.packer_plugins)]]
vim.cmd [[au FileType js ++once lua require("packer.load")({'ale'}, { ft = "js" }, _G.packer_plugins)]]
vim.cmd [[au FileType toml ++once lua require("packer.load")({'vim-toml'}, { ft = "toml" }, _G.packer_plugins)]]
vim.cmd [[au FileType sh ++once lua require("packer.load")({'vim-endwise', 'ale'}, { ft = "sh" }, _G.packer_plugins)]]
vim.cmd [[au FileType rb ++once lua require("packer.load")({'vim-endwise', 'ale'}, { ft = "rb" }, _G.packer_plugins)]]
vim.cmd [[au FileType erb ++once lua require("packer.load")({'vim-endwise', 'vim-ragtag'}, { ft = "erb" }, _G.packer_plugins)]]
vim.cmd [[au FileType zsh ++once lua require("packer.load")({'vim-endwise', 'ale'}, { ft = "zsh" }, _G.packer_plugins)]]
vim.cmd [[au FileType lua ++once lua require("packer.load")({'vim-endwise'}, { ft = "lua" }, _G.packer_plugins)]]
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'ale'}, { ft = "markdown" }, _G.packer_plugins)]]
vim.cmd [[au FileType html ++once lua require("packer.load")({'vim-ragtag', 'ale'}, { ft = "html" }, _G.packer_plugins)]]
vim.cmd [[au FileType bash ++once lua require("packer.load")({'ale'}, { ft = "bash" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au InsertEnter * ++once lua require("packer.load")({'nvim-compe'}, { event = "InsertEnter *" }, _G.packer_plugins)]]
vim.cmd [[au BufEnter * ++once lua require("packer.load")({'gitsigns.nvim'}, { event = "BufEnter *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
time([[Sourcing ftdetect script at: /Users/samri/.local/share/nvim/site/pack/packer/opt/vim-toml/ftdetect/toml.vim]], true)
vim.cmd [[source /Users/samri/.local/share/nvim/site/pack/packer/opt/vim-toml/ftdetect/toml.vim]]
time([[Sourcing ftdetect script at: /Users/samri/.local/share/nvim/site/pack/packer/opt/vim-toml/ftdetect/toml.vim]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
