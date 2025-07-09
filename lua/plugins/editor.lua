-- Editor enhancement plugins

-- Helper function for visual selection
local function getVisualSelection()
  vim.cmd 'noau normal! "vy"'
  local text = vim.fn.getreg 'v'
  vim.fn.setreg('v', {})

  text = string.gsub(text, '\n', '')
  if #text > 0 then
    return text
  else
    return ''
  end
end

return {
  -- Mini.nvim modules
  {
    'echasnovski/mini.nvim',
    config = function()
      -- Better Around/Inside textobjects
      require('mini.ai').setup { n_lines = 500 }
      -- Add/delete/replace surroundings
      require('mini.surround').setup()
      -- Statusline
      local statusline = require 'mini.statusline'
      statusline.setup { use_icons = vim.g.have_nerd_font }
      ---@diagnostic disable-next-line: duplicate-set-field
      statusline.section_location = function()
        return '%2l:%-2v'
      end
    end,
  },

  -- Telescope fuzzy finder
  {
    'nvim-telescope/telescope.nvim',
    -- Remove cmd = 'Telescope' to load on startup
    -- cmd = 'Telescope',
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
      { 'nvim-telescope/telescope-ui-select.nvim' },
      { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
    },
    config = function()
      require('telescope').setup {
        extensions = {
          ['ui-select'] = {
            require('telescope.themes').get_dropdown(),
          },
        },
      }

      -- Enable extensions
      pcall(require('telescope').load_extension, 'fzf')
      pcall(require('telescope').load_extension, 'ui-select')

      -- Keymaps
      local builtin = require 'telescope.builtin'
      vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
      vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
      vim.keymap.set('n', '<leader>sp', builtin.find_files, { desc = '[S]earch Files. // use (P) to mimic vscode' })
      vim.keymap.set('n', '<C-p>', builtin.find_files, { desc = 'Find files using vscode like keymap' })
      vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })
      vim.keymap.set('n', '<leader>sw', function()
        builtin.grep_string { search = vim.fn.expand '<cword>' }
      end, { desc = '[S]earch current [W]ord' })
      vim.keymap.set('v', '<leader>sw', function()
        local text = getVisualSelection()
        builtin.grep_string { search = text }
      end, { desc = '[S]earch selected [W]ord' })
      vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
      vim.keymap.set('n', '<C-f>', builtin.live_grep, { desc = '[S]earch by [G]rep' })
      vim.keymap.set('v', '<leader>sg', function()
        local text = getVisualSelection()
        builtin.live_grep { default_text = text }
      end, { desc = '[S]earch selected text by [G]rep' })
      vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
      vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
      vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
      vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })

      vim.keymap.set('n', '<leader>/', function()
        builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
          winblend = 10,
          previewer = false,
        })
      end, { desc = '[/] Fuzzily search in current buffer' })

      vim.keymap.set('v', '<leader>/', function()
        local text = getVisualSelection()
        builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
          winblend = 10,
          previewer = false,
          default_text = text,
        })
      end, { desc = 'Fuzzily search selection in current buffer' })

      vim.keymap.set('n', '<leader>s/', function()
        builtin.live_grep {
          grep_open_files = true,
          prompt_title = 'Live Grep in Open Files',
        }
      end, { desc = '[S]earch [/] in Open Files' })

      vim.keymap.set('n', '<leader>sn', function()
        builtin.find_files { cwd = vim.fn.stdpath 'config' }
      end, { desc = '[S]earch [N]eovim files' })
    end,
  },

  -- Flash for fast navigation
  {
    'folke/flash.nvim',
    event = 'VeryLazy',
    opts = {},
    keys = {
      { 's', mode = { 'n', 'x', 'o' }, function() require('flash').jump() end, desc = 'Flash' },
      { 'S', mode = { 'n', 'x', 'o' }, function() require('flash').treesitter() end, desc = 'Flash Treesitter' },
      { 'r', mode = 'o', function() require('flash').remote() end, desc = 'Remote Flash' },
      { 'R', mode = { 'o', 'x' }, function() require('flash').treesitter_search() end, desc = 'Treesitter Search' },
      { '<c-s>', mode = { 'c' }, function() require('flash').toggle() end, desc = 'Toggle Flash Search' },
    },
  },

  -- Session management
  {
    'jedrzejboczar/possession.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('possession').setup {
        autosave = {
          current = true,
          tmp = false,
          tmp_name = 'tmp',
          on_load = true,
          on_quit = true,
        },
        commands = {
          save = 'PossessionSave',
          load = 'PossessionLoad',
          delete = 'PossessionDelete',
          list = 'PossessionList',
        },
      }

      -- Keymaps
      vim.keymap.set('n', '<leader>qs', '<cmd>PossessionSave<cr>', { desc = 'Save session' })
      vim.keymap.set('n', '<leader>ql', '<cmd>PossessionLoad<cr>', { desc = 'Load session' })
      vim.keymap.set('n', '<leader>qd', '<cmd>PossessionDelete<cr>', { desc = 'Delete session' })
      vim.keymap.set('n', '<leader>qL', '<cmd>PossessionList<cr>', { desc = 'List sessions' })
    end,
  },

  -- Git integration
  {
    'kdheepak/lazygit.nvim',
    cmd = {
      'LazyGit',
      'LazyGitConfig',
      'LazyGitCurrentFile',
      'LazyGitFilter',
      'LazyGitFilterCurrentFile',
    },
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
      { '<leader>gg', '<cmd>LazyGit<cr>', desc = 'LazyGit' },
      { '<leader>gf', '<cmd>LazyGitFilter<cr>', desc = 'LazyGit Filter' },
      { '<leader>gc', '<cmd>LazyGitCurrentFile<cr>', desc = 'LazyGit Current File' },
    },
  },

  -- Comment plugin
  {
    'numToStr/Comment.nvim',
    opts = {},
  },
}