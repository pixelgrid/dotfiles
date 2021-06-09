local global = require('core.global')

local create_dirs = function()
  local data_dir = {
    global.cache_dir..'backup',
    global.cache_dir..'session',
    global.cache_dir..'swap',
    global.cache_dir..'tags',
    global.cache_dir..'undo',
  }
  if vim.fn.isdirectory(global.cache_dir) == 0 then
    os.execute("mkdir -p " .. global.cache_dir)
  end

  for _, v in pairs(data_dir) do
    if vim.fn.isdirectory(v) == 0 then
      os.execute("mkdir -p " .. v)
    end
  end
end

local disable_distribution_plugins = function()
  vim.g.loaded_gzip = 1
  vim.g.loaded_tar = 1
  vim.g.loaded_tarPlugin = 1
  vim.g.loaded_zip = 1
  vim.g.loaded_zipPlugin = 1
  vim.g.loaded_getscript = 1
  vim.g.loaded_getscriptPlugin = 1
  vim.g.loaded_vimball = 1
  vim.g.loaded_vimballPlugin = 1
  vim.g.loaded_matchit = 1
  vim.g.loaded_matchparen = 1
  vim.g.loaded_2html_plugin = 1
  vim.g.loaded_logiPat = 1
  vim.g.loaded_rrhelper = 1
  vim.g.loaded_netrw = 1
  vim.g.loaded_netrwPlugin = 1
end

local setup_providers = function()
  if global.is_mac then
    vim.g.python3_host_prog = '/usr/local/bin/python3'
  elseif global.is_unix then
    vim.g.python3_host_prog = '/usr/bin/python3'
  else
    vim.g.loaded_python3_provider = 0
  end
  vim.g.loaded_python_provider = 0
  vim.g.loaded_node_provider = 0
  vim.g.loaded_perl_provider = 0
  vim.g.loaded_ruby_provider = 0
end

local map_leader = function()
  vim.api.nvim_set_keymap('n',' ','',{noremap = true})
  vim.api.nvim_set_keymap('x',' ','',{noremap = true})
  vim.g.mapleader = " "
end

local load_core = function()
  local pack = require('core.pack')
  create_dirs()
  disable_distribution_plugins()
  setup_providers()
  map_leader()

  pack.ensure_plugins()
  require('core.options')
  require('core.mapping')
  require('keymap')
  require("core.event")
  pack.load_compile()
end

load_core()
