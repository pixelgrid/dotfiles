return {
  enabled = false,
  "Pocco81/true-zen.nvim",
  config = function()
    require("true-zen").setup {
      -- your config goes here
      -- or just leave it empty :)
    }
    local api = vim.api;
    api.nvim_set_keymap("n", "<leader>zn", ":TZNarrow<CR>", {})
    api.nvim_set_keymap("v", "<leader>zn", ":'<,'>TZNarrow<CR>", {})
    api.nvim_set_keymap("n", "<leader>zf", ":TZFocus<CR>", {})
    api.nvim_set_keymap("n", "<leader>zm", ":TZMinimalist<CR>", {})
    api.nvim_set_keymap("n", "<leader>za", ":TZAtaraxis<CR>", {})
  end
}
