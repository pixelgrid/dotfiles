return {
  "windwp/nvim-spectre",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    vim.keymap.set('n', '<leader>lg', require('spectre').open, { desc = '[S]earch by [G]rep' })
    vim.keymap.set('n', '<leader>gs', '<cmd>lua require("spectre").open_visual({select_word=true})<CR>',
      { desc = '[S]earch current [W]ord' })
  end
}
