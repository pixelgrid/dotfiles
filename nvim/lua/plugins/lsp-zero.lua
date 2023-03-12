return {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v1.x',
  dependencies = {
    -- LSP Support
    { 'neovim/nvim-lspconfig' }, -- Required
    { 'williamboman/mason.nvim' }, -- Optional
    { 'williamboman/mason-lspconfig.nvim' }, -- Optional

    -- Autocompletion
    { 'hrsh7th/nvim-cmp' }, -- Required
    { 'hrsh7th/cmp-nvim-lsp' }, -- Required
    { 'hrsh7th/cmp-buffer' }, -- Optional
    { 'hrsh7th/cmp-path' }, -- Optional
    { 'saadparwaiz1/cmp_luasnip' }, -- Optional
    { 'hrsh7th/cmp-nvim-lua' }, -- Optional

    -- Snippets
    { 'L3MON4D3/LuaSnip' }, -- Required
    { 'rafamadriz/friendly-snippets' }, -- Optional
  },
  config = function()
    local lsp = require('lsp-zero')
    lsp.preset({
      name = 'minimal',
      set_lsp_keymaps = true,
      manage_nvim_cmp = true,
      suggest_lsp_servers = false,
    })
    lsp.ensure_installed({
      'tsserver',
      'eslint',
    })
    local augroup = vim.api.nvim_create_augroup('LspFormatting', {})
    local lsp_format_on_save = function(bufnr)
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd('BufWritePre', {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format()
        end,
      })
    end
    function on_attach(client, bufnr)
      lsp_format_on_save(bufnr)
      local opts = { buffer = bufnr, remap = false }
      -- Show floating diagnostic on hover
      vim.api.nvim_create_autocmd("CursorHold", {
        buffer = bufnr,
        callback = function()
          vim.diagnostic.open_float(nil, {
            focusable = false,
            close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
            border = "rounded",
            source = "always",
            prefix = " ",
            scope = "cursor",
          })
        end,
      })
    end

    lsp.on_attach(on_attach)
    -- Eslint Config
    lsp.configure('eslint', {
      on_attach = function(client, _)
        client.server_capabilities.documentFormattingProvider = true
      end,
      settings = {
        codeActionOnSave = {
          enable = true,
          mode = "all"
        },
        nodePath = "~/dev/web-ui/.yarn/sdks",
        packageManager = "yarn",
      }
    })
    -- Tsserver Config
    lsp.configure('tsserver', {
      cmd = { "typescript-language-server", "--tsserver-path",
        "~/dev/web-ui/.yarn/sdks/typescript/lib/tsserver.js",
        "--stdio" },
      init_options = {
        preferences = {
          importModuleSpecifierPreference = "non-relative",
        },
      },
      settings = {
        codeActionOnSave = {
          enable = false,
          mode = "all"
        },
      }
    })
    -- tsserver Config
    require("typescript").setup({
      disable_commands = false, -- prevent the plugin from creating Vim commands
      debug = false, -- enable debug logging for commands
      go_to_source_definition = {
        fallback = true, -- fall back to standard LSP definition on failure
      },
    })
    lsp.setup()
    vim.diagnostic.config({
      virtual_text = false,
      signs = true,
      update_in_insert = false,
      underline = true,
      severity_sort = false,
      float = true,
    })
  end
}
