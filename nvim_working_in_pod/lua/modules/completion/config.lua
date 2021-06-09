local config = {}

function config.nvim_lsp()
  require('modules.completion.lspconfig')
end

function config.nvim_compe()
  require'compe'.setup {
    enabled = true;
    debug = false;
    min_length = 1;
    allow_prefix_unmatch = false;
    source = {
      path = true;
      buffer = true;
      calc = true;
      nvim_lsp = true;
      spell = true;
      tags = true;
      nvim_lua = true;
      vsnip = true;
    };
  }
end

function config.vim_vsnip()
  local home = os.getenv("HOME")
  local data_dir = string.format('%s/site/',vim.fn.stdpath('data'))
  vim.g.vsnip_snippet_dir = home .. '/.config/nvim/snippets'
  vim.g.vsnip_snippet_dirs = {
    data_dir..'/pack/packer/opt/friendly-snippets/snippets',
  }
end

return config
