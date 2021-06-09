local completion = {}
local conf = require('modules.completion.config')

completion['neovim/nvim-lspconfig'] = {
  event = 'BufReadPre',
  config = conf.nvim_lsp,
}

completion['hrsh7th/nvim-compe'] = {
  event = 'InsertEnter',
  config = conf.nvim_compe,
}

completion['glepnir/lspsaga.nvim'] = {
  cmd = 'Lspsaga',
}

completion['hrsh7th/vim-vsnip'] = {
  event = 'InsertCharPre',
  config = conf.vim_vsnip
}

completion['rafamadriz/friendly-snippets'] = {
  opt = true
}

completion['kabouzeid/nvim-lspinstall'] = {
  cmd = 'LspInstall',
  config = function()
    require'lspinstall'.setup()
  end
}

return completion
