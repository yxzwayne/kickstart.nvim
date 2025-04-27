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

      -- nvim-tree keymaps
      vim.keymap.set('n', '<leader>tt', ':NvimTreeToggle<CR>')
      vim.keymap.set('n', '<leader>te', ':NvimTreeFindFile<CR>')
      vim.keymap.set('n', '<leader>tcol', ':NvimTreeCollapse<CR>')
      vim.keymap.set('n', '<leader>tb', ':NvimTreeFocus<CR>')
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
