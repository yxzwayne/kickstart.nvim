-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

return {
  {
    'nvim-tree/nvim-tree.lua',
    version = '*',
    lazy = false,
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require('nvim-tree').setup {
        sync_root_with_cwd = true,
        view = {
          side = 'right',
          width = 50,
          preserve_window_proportions = true,
        },
        update_focused_file = {
          enable = true,
          update_root = false,
        },
        renderer = {
          group_empty = true,
        },
        actions = {
          open_file = {
            quit_on_open = false,
            eject = false,
          },
        },
      }

      local api = require('nvim-tree.api')

      -- Updated keymaps with the new toggle function
      vim.keymap.set('n', '<leader>e', function()
        api.tree.toggle({ focus = true })
      end, { desc = 'Explorer (toggle, pinned root)' })
      
      -- Keep existing keymaps for compatibility
      vim.keymap.set('n', '<leader>tt', ':NvimTreeToggle<CR>', { desc = 'Toggle [t]ree' })
      vim.keymap.set('n', '<leader>te', ':NvimTreeFindFile<CR>', { desc = '[t]ree find fil[e]' })
      vim.keymap.set('n', '<leader>tc', ':NvimTreeCollapse<CR>', { desc = '[t]ree [c]ollapse' })
      vim.keymap.set('n', '<leader>tb', ':NvimTreeFocus<CR>', { desc = '[t]ree focus ([b]ring to focus)' })
    end,
  },
  {
    'numToStr/Comment.nvim',
    opts = {
      -- add any options here
    },
  },
  {
    'akinsho/bufferline.nvim',
    version = '*',
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      require('bufferline').setup {}
    end,
  },
}
