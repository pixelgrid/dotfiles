local bind = require('keymap.bind')
local map_cr = bind.map_cr
local map_cu = bind.map_cu
local map_cmd = bind.map_cmd

-- default map
local def_map = {
  -- Vim map
  ["n|<C-x>k"]    = map_cr('bdelete'):with_noremap():with_silent(),
  ["n|<Leader>w"] = map_cu('write'):with_noremap(),
  ["n|<Leader>q"] = map_cu('quit'):with_noremap(),
  ["n|<C-q>"]     = map_cmd(':wq<CR>'),
  ["n|<Leader>h"] = map_cu('set nohlsearch'):with_noremap(),
  ["n|Y"]         = map_cmd('y$'),
  ["n|[b"]        = map_cu('bp'):with_noremap(),
  ["n|]b"]        = map_cu('bn'):with_noremap(),
  ["n|<C-h>"]     = map_cmd('<C-w>h'):with_noremap(),
  ["n|<C-l>"]     = map_cmd('<C-w>l'):with_noremap(),
  ["n|<C-j>"]     = map_cmd('<C-w>j'):with_noremap(),
  ["n|<C-k>"]     = map_cmd('<C-w>k'):with_noremap(),
}

bind.nvim_load_mapping(def_map)
