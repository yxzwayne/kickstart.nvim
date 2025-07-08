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
        view = {
          side = 'right',
          width = 50,
          preserve_window_proportions = true,
        },
        update_focused_file = {
          enable = true,
        },
        actions = {
          open_file = {
            quit_on_open = false,
          },
        },
      }

      -- nvim-tree keymaps (using capital T)
      vim.keymap.set('n', '<leader>TT', ':NvimTreeToggle<CR>', { desc = 'Toggle [T]ree' })
      vim.keymap.set('n', '<leader>Te', ':NvimTreeFindFile<CR>', { desc = '[T]ree find fil[e]' })
      vim.keymap.set('n', '<leader>Tc', ':NvimTreeCollapse<CR>', { desc = '[T]ree [c]ollapse' })
      vim.keymap.set('n', '<leader>Tb', ':NvimTreeFocus<CR>', { desc = '[T]ree focus ([b]ring to focus)' })
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
