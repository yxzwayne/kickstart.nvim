-- This file contains all keymaps that are not part of the original kickstart.nvim init
-- and are not part of any plugins

-- Buffer navigation keymaps (using <leader>b prefix)
vim.keymap.set('n', '<leader>bn', ':bnext<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>bp', ':bprevious<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>bl', ':buffers<CR>', { noremap = true }) -- List all buffers (changed from bb)
vim.keymap.set('n', '<leader>bd', ':bdelete<CR>', { noremap = true }) -- Delete current buffer
vim.keymap.set('n', '<leader>bw', ':bwipe<CR>', { noremap = true }) -- Wipe current buffer
