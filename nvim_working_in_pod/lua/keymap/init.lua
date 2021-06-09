local bind = require('keymap.bind')
local global = require('core.global')
local map_cr = bind.map_cr
local map_cu = bind.map_cu
local map_cmd = bind.map_cmd
require('keymap.config')

local plug_map = {
  -- Autocomplete
  ["i|<Tab>"]      = map_cmd('v:lua.tab_complete()'):with_expr():with_silent(),
  ["i|<S-Tab>"]    = map_cmd('v:lua.s_tab_complete()'):with_expr():with_silent(),
  ["i|<CR>"]       = map_cmd([[compe#confirm({ 'keys': "\<Plug>delimitMateCR", 'mode': '' })]]):with_noremap():with_expr():with_silent():with_nowait(),
  -- Lsp
  ["n|<Leader>li"] = map_cr("LspInfo"):with_noremap():with_silent():with_nowait(),
  ["n|<Leader>ll"] = map_cr("LspLog"):with_noremap():with_silent():with_nowait(),
  ["n|<Leader>lr"] = map_cr("LspRestart"):with_noremap():with_silent():with_nowait(),
  ["n|<C-f>"]      = map_cmd("<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>"):with_noremap():with_silent():with_nowait(),
  ["n|<C-b>"]      = map_cmd("<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>"):with_noremap():with_silent():with_nowait(),
  ["n|]e"]         = map_cr("Lspsaga diagnostic_jump_next"):with_noremap():with_silent(),
  ["n|[e"]         = map_cr("Lspsaga diagnostic_jump_prev"):with_noremap():with_silent(),
  ["n|K"]          = map_cr("Lspsaga hover_doc"):with_noremap():with_silent(),
  ["n|ga"]         = map_cr("Lspsaga code_action"):with_noremap():with_silent(),
  ["v|ga"]         = map_cr("Lspsaga range_code_action"):with_noremap():with_silent(),
  ["n|gd"]         = map_cr("Lspsaga preview_definition"):with_noremap():with_silent(),
  ["n|gD"]         = map_cmd("<cmd>lua vim.lsp.buf.definition()<CR>"):with_noremap():with_silent(),
  ["n|gi"]         = map_cmd("<cmd>lua vim.lsp.buf.implementation()<CR>"):with_noremap():with_silent(),
  ["n|gs"]         = map_cr("Lspsaga signature_help"):with_noremap():with_silent(),
  ["n|gr"]         = map_cr("Lspsaga rename"):with_noremap():with_silent(),
  ["n|gR"]         = map_cmd("<cmd>lua vim.lua.buf.references()<CR>"):with_noremap():with_silent(),
  ["n|gh"]         = map_cr("Lspsaga lsp_finder"):with_noremap():with_silent(),
  ["n|gt"]         = map_cmd("<cmd>lua vim.lsp.buf.type_definition()<CR>"):with_noremap():with_silent(),
  ["n|gw"]         = map_cmd("<cmd>lua vim.lsp.buf.workspace_symbol()<CR>"):with_noremap():with_silent(),
  ["n|ge"]         = map_cr("Lspsaga show_line_diagnostics"):with_noremap():with_silent(),
  -- Plugin Telescope
  ["n|<Leader>bb"] = map_cu('Telescope buffers'):with_noremap():with_silent(),
  ["n|<Leader>fa"] = map_cu('DashboardFindWord'):with_noremap():with_silent(),
  ["n|<Leader>fb"] = map_cu('Telescope file_browser'):with_noremap():with_silent(),
  ["n|<Leader>ff"] = map_cu('DashboardFindFile'):with_noremap():with_silent(),
  ["n|<Leader>fg"] = map_cu('Telescope git_files'):with_noremap():with_silent(),
  ["n|<Leader>fw"] = map_cu('Telescope grep_string'):with_noremap():with_silent(),
  ["n|<Leader>fh"] = map_cu('DashboardFindHistory'):with_noremap():with_silent(),
  ["n|<Leader>fl"] = map_cu('Telescope loclist'):with_noremap():with_silent(),
  ["n|<Leader>fc"] = map_cu('Telescope git_commits'):with_noremap():with_silent(),
  ["n|<Leader>ft"] = map_cu('Telescope help_tags'):with_noremap():with_silent(),
  ["n|<Leader>fd"] = map_cu('Telescope dotfiles path='..global.home..'/.dotfiles'):with_noremap():with_silent(),
  -- Plugin nvim-tree
  ["n|<Leader>e"] = map_cr('NvimTreeToggle'):with_noremap():with_silent(),
  ["n|<Leader>F"] = map_cr('NvimTreeFindFile'):with_noremap():with_silent(),
  -- Plugin accelerated-jk
  ["n|j"] = map_cmd('v:lua.enhance_jk_move("j")'):with_silent():with_expr(),
  ["n|k"] = map_cmd('v:lua.enhance_jk_move("k")'):with_silent():with_expr(),
  -- Plugin packer
  ["n|<Leader>pu"] = map_cr("PackerUpdate"):with_noremap():with_silent():with_nowait(),
  ["n|<Leader>pi"] = map_cr("PackerInstall"):with_noremap():with_silent():with_nowait(),
  ["n|<Leader>pc"] = map_cr("PackerCompile"):with_noremap():with_silent():with_nowait(),
  -- Plugin Far.vim
  ["n|<Leader>fz"] = map_cr('Farf'):with_noremap():with_silent(),
  ["v|<Leader>fz"] = map_cr('Farf'):with_noremap():with_silent(),
}

bind.nvim_load_mapping(plug_map)
