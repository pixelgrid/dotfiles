return {
  "ibhagwan/fzf-lua",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    vim.keymap.set('n', '<leader><leader>', require('fzf-lua').buffers)
    vim.keymap.set('n', '<leader>f', require("fzf-lua").files)
    vim.keymap.set('n', '<leader>gf', '<cmd>lua require("fzf-lua").files({cwd = "~/dev/web-ui/"})<CR>')
    vim.keymap.set('n', '<leader>l', require('fzf-lua').loclist)
    vim.keymap.set('n', '<leader>q', require('fzf-lua').quickfix)
  end
}
