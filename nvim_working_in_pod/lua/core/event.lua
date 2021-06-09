local autocmd = {}

function autocmd.nvim_create_augrougs(definitions)
  for group_name, definition in pairs(definitions) do
    vim.api.nvim_command('augroup '..group_name)
    vim.api.nvim_command('autocmd!')
    for _, def in ipairs(definition) do
      local command = table.concat(vim.tbl_flatten{'autocmd', def}, ' ')
      vim.api.nvim_command(command)
    end
    vim.api.nvim_command('augroup END')
  end
end

function autocmd.load_autocmds()
  local definitions = {
    packer = {
      {"BufWritePost","*.lua","lua require('core.pack').auto_compile()"};
    };
    bufs = {
      {"BufWritePre","COMMIT_EDITMSG","setlocal noundofile"};
    };
    wins = {
      {"VimResized", "*", [[normal! \<c-w>=]]};
      {"VimLeave", "*", [[if has('nvim') | wshada! | else | wviminfo! | endif]]};
      {"FocusGained","*", "checktime"};
    };
    ft = {
      {"Filetype", "dashboard", "set showtabline=0 | autocmd WinLeave <buffer> set showtabline=2"};
    };
    yank = {
      {"TextYankPost", "*", [[silent! lua vim.highlight.on_yank({higroup="IncSearch",timeout=400})]]};
    };
  }

  autocmd.nvim_create_augrougs(definitions)
end

autocmd.load_autocmds()
