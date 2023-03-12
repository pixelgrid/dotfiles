local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
vim.opt.swapfile = false
vim.g.mapleader = " "
vim.g.maplocalleader = ' '

require('lazy').setup({{import = "plugins"}})

-- [[ Setting options ]]
-- See `:help vim.o`

-- Set highlight on search
-- vim.o.hlsearch = false

-- Make line numbers default
vim.wo.number = true

-- Enable mouse mode
vim.o.mouse = 'a'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'

-- Set colorscheme
vim.o.termguicolors = true

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- [[ Basic Keymaps ]]
-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Easy save/exit
vim.keymap.set('n', '<leader>q', ":q<CR>")
vim.keymap.set('n', '<leader>w', ":w<CR>")

-- splits
vim.keymap.set('n', '<leader>|', ":vs<CR>")
vim.keymap.set('n', '<leader>-', ":split<CR>")
vim.keymap.set('n', '<leader>=', "<c-w>=")
vim.keymap.set('n', '<leader>#', "<c-w>_<c-w>|")

-- split navigation
-- vim.keymap.set('n', '<c-n>', "<c-w>h<c-w>|")
-- vim.keymap.set('n', '<c-u>', "<c-w>k<c-w>_")
-- vim.keymap.set('n', '<c-e>', "<c-w>j<c-w>_")
-- vim.keymap.set('n', '<c-i>', "<c-w>l<c-w>|")

-- quickfix
vim.keymap.set('n', '<leader>cn', ":cn<CR>")
vim.keymap.set('n', '<leader>cp', ":cp<CR>")

-- convenience
vim.keymap.set('n', 'U', ":redo<CR>")

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
