local tools = {}
local conf = require('modules.tools.config')

tools['nvim-telescope/telescope.nvim'] = {
  cmd = 'Telescope',
  config = conf.telescope,
  requires = {
    {'nvim-lua/popup.nvim', opt = true},
    {'nvim-lua/plenary.nvim', opt = true},
    {'nvim-telescope/telescope-fzy-native.nvim', opt = true},
  },
}

tools['folke/which-key.nvim'] = {
  config = conf.which_key
}

tools['b3nj5m1n/kommentary'] = {
  event = 'BufReadPre',
  config = conf.kommentary
}

tools['brooth/far.vim'] = {
  cmd = {'Far', 'Farp'},
  config = function()
    vim.g['far#source'] = 'rg'
  end
}

return tools
