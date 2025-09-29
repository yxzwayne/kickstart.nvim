-- LSP configuration

return {
  -- LSP Configuration
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      { 'williamboman/mason.nvim', opts = {} },
      'williamboman/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',
      { 'j-hui/fidget.nvim', opts = {} },
      'saghen/blink.cmp',
      'mfussenegger/nvim-jdtls',
    },
    config = function()
      -- LSP attach function
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
        callback = function(event)
          -- LSP keymaps using gt prefix (go to...)
          local map = function(keys, func, desc, mode)
            mode = mode or 'n'
            vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
          end

          -- Core navigation
          map('gtd', vim.lsp.buf.definition, '[G]o [T]o [D]efinition')
          map('gtD', vim.lsp.buf.declaration, '[G]o [T]o [D]eclaration')
          map('gtr', vim.lsp.buf.references, '[G]o [T]o [R]eferences')
          map('gti', vim.lsp.buf.implementation, '[G]o [T]o [I]mplementation')
          map('gtt', vim.lsp.buf.type_definition, '[G]o [T]o [T]ype definition')

          -- Information/Help
          map('gth', vim.lsp.buf.hover, '[G]o [T]o [H]over documentation')
          map('gts', vim.lsp.buf.signature_help, '[G]o [T]o [S]ignature help')

          -- Actions
          map('gta', vim.lsp.buf.code_action, '[G]o [T]o code [A]ctions', { 'n', 'x' })
          map('gtn', vim.lsp.buf.rename, '[G]o [T]o re[N]ame symbol')
          map('gtf', function() vim.lsp.buf.format { async = true } end, '[G]o [T]o [F]ormat document')

          -- Workspace
          map('gtw', vim.lsp.buf.workspace_symbol, '[G]o [T]o [W]orkspace symbols')
          map('gtS', vim.lsp.buf.document_symbol, '[G]o [T]o document [S]ymbols')

          -- Diagnostics navigation
          map('gt]', vim.diagnostic.goto_next, '[G]o [T]o next diagnostic')
          map('gt[', vim.diagnostic.goto_prev, '[G]o [T]o previous diagnostic')
          map('gtk', vim.diagnostic.open_float, '[G]o [T]o diagnostic (show in float)')

          local function client_supports_method(client, method, bufnr)
            if vim.fn.has 'nvim-0.11' == 1 then
              return client:supports_method(method, bufnr)
            else
              return client.supports_method(method, { bufnr = bufnr })
            end
          end

          -- Document highlight
          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf) then
            local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })
            vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.clear_references,
            })

            vim.api.nvim_create_autocmd('LspDetach', {
              group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
              callback = function(event2)
                vim.lsp.buf.clear_references()
                vim.api.nvim_clear_autocmds { group = 'kickstart-lsp-highlight', buffer = event2.buf }
              end,
            })
          end

          -- Inlay hints toggle removed - will be configured manually later
        end,
      })

      -- Diagnostic configuration
      vim.diagnostic.config {
        severity_sort = true,
        float = { border = 'rounded', source = 'if_many' },
        underline = { severity = vim.diagnostic.severity.ERROR },
        signs = vim.g.have_nerd_font and {
          text = {
            [vim.diagnostic.severity.ERROR] = '󰅚 ',
            [vim.diagnostic.severity.WARN] = '󰀪 ',
            [vim.diagnostic.severity.INFO] = '󰋽 ',
            [vim.diagnostic.severity.HINT] = '󰌶 ',
          },
        } or {},
        virtual_text = {
          source = 'if_many',
          spacing = 2,
          format = function(diagnostic)
            return diagnostic.message
          end,
        },
      }

      -- LSP capabilities
      local capabilities = require('blink.cmp').get_lsp_capabilities()

      -- LSP servers configuration
      local servers = {
        lua_ls = {
          settings = {
            Lua = {
              completion = {
                callSnippet = 'Replace',
              },
            },
          },
        },
        ts_ls = {},
        clangd = {
          cmd = {
            'clangd',
            '--background-index',
            '--clang-tidy',
            '--header-insertion=iwyu',
            '--completion-style=detailed',
            '--function-arg-placeholders',
            '--fallback-style=llvm',
          },
          init_options = {
            usePlaceholders = true,
            completeUnimported = true,
            clangdFileStatus = true,
          },
        },
        pyright = {
          settings = {
            python = {
              analysis = {
                autoSearchPaths = true,
                diagnosticMode = 'workspace',
                useLibraryCodeForTypes = true,
              },
            },
          },
        },
        rust_analyzer = {
          settings = {
            ['rust-analyzer'] = {
              cargo = {
                allFeatures = true,
              },
              checkOnSave = {
                command = 'clippy',
              },
            },
          },
        },
        -- jdtls is handled separately in the mason-lspconfig handlers below
      }

      -- Ensure installed
      local ensure_installed = vim.tbl_keys(servers or {})
      vim.list_extend(ensure_installed, {
        'stylua', -- Lua formatter
      })
      require('mason-tool-installer').setup { ensure_installed = ensure_installed }

      -- Setup servers
      require("mason-lspconfig").setup({
        ensure_installed = {},
        automatic_installation = false,
        automatic_enable = false,  -- Disable automatic enable to prevent version compatibility issues
        handlers = {
          function(server_name)
            local server = servers[server_name] or {}
            require("lspconfig")[server_name].setup({
              cmd = server.cmd,
              settings = server.settings,
              filetypes = server.filetypes,
              capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {}),
            })
          end,
          jdtls = function()
            -- Bemol-compatible nvim-jdtls configuration
            local cmd = { vim.fn.exepath("jdtls") }
            
            -- Add lombok support if Mason is available
            local mason_registry = require("mason-registry")
            if mason_registry.is_installed("jdtls") then
              local lombok_jar = mason_registry.get_package("jdtls"):get_install_path() .. "/lombok.jar"
              table.insert(cmd, string.format("--jvm-arg=-javaagent:%s", lombok_jar))
            end

            local root_dir = require("jdtls.setup").find_root({ "packageInfo" }, "Config")

            if root_dir then
              local file = io.open(root_dir .. "/.bemol/ws_root_folders")
              if file then
                for line in file:lines() do
                  vim.lsp.buf.add_workspace_folder(line)
                end
                file:close()
              end
            end

            require("lspconfig").jdtls.setup({
              cmd = cmd,
              root_dir = root_dir,
              capabilities = capabilities,
            })
          end,
        },
      })
    end,
  },

  -- Autoformat
  {
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    keys = {
      {
        '<leader>GF',
        function()
          require('conform').format { async = true, lsp_format = 'fallback' }
        end,
        mode = '',
        desc = '[G]lobal [F]ormat buffer',
      },
    },
    opts = {
      notify_on_error = false,
      -- Disabled auto-formatting to prevent accidental whole-file formatting
      -- format_on_save = function(bufnr)
      --   local disable_filetypes = { c = true, cpp = true }
      --   if disable_filetypes[vim.bo[bufnr].filetype] then
      --     return nil
      --   else
      --     return {
      --       timeout_ms = 500,
      --       lsp_format = 'fallback',
      --     }
      --   end
      -- end,
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