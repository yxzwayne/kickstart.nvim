-- Formatting and Lua-development helpers.

return {
  -- Autoformat
  {
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    keys = {
      {
        '<leader>GF',
        function()
          require('conform').format { async = true, lsp_format = 'never' }
        end,
        mode = '',
        desc = '[G]lobal [F]ormat buffer',
      },
    },
    opts = {
      notify_on_error = false,
      -- Disabled auto-formatting to prevent accidental whole-file formatting.
      formatters_by_ft = {
        lua = { 'stylua' },
      },
    },
  },

  -- Lazydev for Neovim Lua development
  {
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {
      library = {
        { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
      },
    },
  },
}
