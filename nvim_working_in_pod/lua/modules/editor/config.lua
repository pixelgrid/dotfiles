local config = {}

function config.delimitmate()
  vim.g.delimitMate_expand_cr = 0
  vim.g.delimitMate_expand_space = 1
  vim.g.delimitMate_smart_quotes = 1
  vim.g.delimitMate_expand_inside_quotes = 1
  vim.api.nvim_command('au FileType markdown let b:delimitMate_nesting_quotes = ["`"]')
end

return config
